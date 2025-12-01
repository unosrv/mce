# Dockerfile for MCE Phoenix Application
# Production deployment via Dokploy
#
# Based on Phoenix 1.8 best practices:
# - https://hexdocs.pm/phoenix/releases.html
# - https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Release.html
#
# Build: docker build -t mce .
# Run:   docker run -p 4000:4000 -e DATABASE_URL=... -e SECRET_KEY_BASE=... -e PHX_HOST=... mce

# =============================================================================
# Build Arguments - Update versions as needed
# =============================================================================
# Find compatible versions at:
# - https://hub.docker.com/r/hexpm/elixir/tags
# - https://hub.docker.com/_/debian/tags
# Verified available image: https://hub.docker.com/r/hexpm/elixir/tags
ARG ELIXIR_VERSION=1.15.7
ARG OTP_VERSION=26.1.1
ARG DEBIAN_VERSION=bookworm-20230612-slim

ARG BUILDER_IMAGE="docker.io/hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="docker.io/debian:${DEBIAN_VERSION}"

# =============================================================================
# Stage 1: Builder
# =============================================================================
FROM ${BUILDER_IMAGE} AS builder

# Install build dependencies
# - build-essential: for native extensions (bcrypt_elixir)
# - git: for fetching git-based dependencies (heroicons)
# - curl: for downloading assets (tailwind, esbuild)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install hex and rebar
RUN mix local.hex --force \
  && mix local.rebar --force

# Set build environment
ENV MIX_ENV="prod"

# =============================================================================
# Dependencies Layer (cached for faster rebuilds)
# =============================================================================
# Copy only dependency files first for better layer caching
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV

# Create config directory and copy compile-time config
RUN mkdir config
COPY config/config.exs config/${MIX_ENV}.exs config/

# Compile dependencies
RUN mix deps.compile

# =============================================================================
# Assets Setup Layer
# =============================================================================
# Download tailwind and esbuild binaries
RUN mix assets.setup

# =============================================================================
# Application Source Layer
# =============================================================================
# Copy application source files
COPY priv priv
COPY lib lib

# =============================================================================
# CRITICAL: Compile Application BEFORE Assets
# =============================================================================
# This order is essential for Phoenix LiveView colocated hooks.
# The phoenix-colocated module is generated during compilation.
RUN mix compile

# =============================================================================
# Assets Layer
# =============================================================================
# Copy assets after compilation (for colocated hooks to work)
COPY assets assets

# Compile and deploy assets (now colocated hooks module exists)
RUN mix assets.deploy

# =============================================================================
# Release Layer
# =============================================================================
# Copy runtime config (doesn't require recompilation)
COPY config/runtime.exs config/

# Copy release configuration (env.sh.eex, overlays)
COPY rel rel

# Build the release
RUN mix release

# =============================================================================
# Stage 2: Runtime
# =============================================================================
FROM ${RUNNER_IMAGE} AS runtime

# Install runtime dependencies
# - libstdc++6: standard C++ library
# - openssl: SSL/TLS support
# - libncurses6: terminal UI (for remote_console)
# - locales: UTF-8 locale support
# - ca-certificates: HTTPS support
# - chromium: for ChromicPDF (PDF generation)
# - fonts-liberation: standard fonts for PDF rendering
# - fonts-noto-cjk: CJK fonts (Korean, Chinese, Japanese)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libstdc++6 \
    openssl \
    libncurses6 \
    locales \
    ca-certificates \
    chromium \
    fonts-liberation \
    fonts-noto-cjk \
  && rm -rf /var/lib/apt/lists/*

# Configure locale for Elixir
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set working directory
WORKDIR /app

# Create non-root user for security
RUN useradd --create-home --shell /bin/bash app \
  && chown -R app:app /app

# Set runtime environment
ENV MIX_ENV="prod"
ENV PHX_SERVER="true"

# ChromicPDF configuration
# Use no_sandbox since we're in a container
ENV CHROMIC_PDF_NO_SANDBOX="true"

# Copy release from builder stage
COPY --from=builder --chown=app:app /app/_build/prod/rel/mce ./

# Switch to non-root user
USER app

# Expose the application port
EXPOSE 4000

# Health check (optional, but recommended for Dokploy)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:4000/health || exit 1

# Start the application
CMD ["/app/bin/server"]
