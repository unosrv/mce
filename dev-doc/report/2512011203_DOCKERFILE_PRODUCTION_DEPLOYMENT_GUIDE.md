# Complete Guide: Phoenix/Elixir Production Dockerfile

**Date**: 2025-12-01
**Author**: Claude Code
**Purpose**: Educational guide for understanding Docker-based Phoenix deployment

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Why Use Docker for Phoenix?](#2-why-use-docker-for-phoenix)
3. [Understanding Multi-Stage Builds](#3-understanding-multi-stage-builds)
4. [The Dockerfile Explained Line by Line](#4-the-dockerfile-explained-line-by-line)
5. [Supporting Files Explained](#5-supporting-files-explained)
6. [The Build Process Flow](#6-the-build-process-flow)
7. [Environment Variables](#7-environment-variables)
8. [Common Issues and Solutions](#8-common-issues-and-solutions)
9. [Glossary](#9-glossary)

---

## 1. Introduction

This document explains how to deploy a Phoenix/Elixir web application using Docker. We'll cover every file created for the production deployment and explain each line of the Dockerfile in detail.

### What You'll Learn

- How Docker builds work
- What each Dockerfile instruction does
- Why the build order matters for Phoenix
- How to troubleshoot common deployment issues

### Prerequisites

Basic understanding of:
- Command line usage
- What web applications are
- Basic programming concepts

No prior Docker or DevOps experience required!

---

## 2. Why Use Docker for Phoenix?

### The Problem Docker Solves

When you develop an application on your computer, it works because you have:
- The right version of Elixir installed
- The right version of Erlang installed
- All the system libraries your app needs
- Your database configured correctly

But when you deploy to a server, that server might have different versions of everything, leading to the dreaded "it works on my machine" problem.

### How Docker Helps

Docker packages your application with everything it needs to run:

```
┌─────────────────────────────────────┐
│         Docker Container            │
│  ┌─────────────────────────────┐    │
│  │   Your Phoenix Application  │    │
│  ├─────────────────────────────┤    │
│  │   Elixir 1.15.8             │    │
│  │   Erlang/OTP 26.2.5         │    │
│  │   System Libraries          │    │
│  │   Chromium (for PDFs)       │    │
│  │   Fonts                     │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

This container runs identically on any computer with Docker installed.

### Benefits for Phoenix Applications

1. **Reproducible builds**: Same result every time
2. **Isolation**: Your app doesn't conflict with other apps
3. **Portability**: Deploy to any cloud provider
4. **Scalability**: Easy to run multiple instances

---

## 3. Understanding Multi-Stage Builds

Our Dockerfile uses a **multi-stage build**. Think of it like cooking:

### Stage 1: "Builder" Kitchen
- Has all the cooking tools (compilers, build tools)
- Has all the ingredients (source code, dependencies)
- Creates the final dish (compiled release)
- Gets messy with lots of intermediate files

### Stage 2: "Runtime" Serving Area
- Clean and minimal
- Only has the finished dish
- Only has what's needed to serve (runtime libraries)

```
┌─────────────────────────────────────────────────────────┐
│  STAGE 1: Builder (~2GB)                                │
│  ┌─────────────────────────────────────────────────┐    │
│  │  Elixir + Erlang + Build Tools                  │    │
│  │  Source Code + Dependencies                     │    │
│  │  Compilers + Git + Curl                         │    │
│  │  → Produces: _build/prod/rel/mce/               │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
                          │
                          │ COPY only the release
                          ▼
┌─────────────────────────────────────────────────────────┐
│  STAGE 2: Runtime (~400MB)                              │
│  ┌─────────────────────────────────────────────────┐    │
│  │  Minimal Debian + Runtime Libraries             │    │
│  │  Compiled Release (from Stage 1)                │    │
│  │  Chromium + Fonts (for PDF generation)          │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

**Why this matters**: The final image is ~5x smaller without build tools!

---

## 4. The Dockerfile Explained Line by Line

Let's go through the entire Dockerfile, explaining every single line.

### Section 1: Comments and Metadata

```dockerfile
# Dockerfile for MCE Phoenix Application
# Production deployment via Dokploy
#
# Based on Phoenix 1.8 best practices:
# - https://hexdocs.pm/phoenix/releases.html
# - https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Release.html
#
# Build: docker build -t mce .
# Run:   docker run -p 4000:4000 -e DATABASE_URL=... -e SECRET_KEY_BASE=... -e PHX_HOST=... mce
```

**What this does**: Lines starting with `#` are comments. They're ignored by Docker but help humans understand the file.

**Best practice**: Always document your Dockerfile with:
- What it's for
- How to build it
- How to run it

---

### Section 2: Build Arguments (ARG)

```dockerfile
ARG ELIXIR_VERSION=1.19.4
ARG OTP_VERSION=27.3.3
ARG DEBIAN_VERSION=bookworm-20251117-slim
```

**What `ARG` does**: Defines variables that can be used during the build process.

| Variable | Value | Meaning |
|----------|-------|---------|
| `ELIXIR_VERSION` | `1.19.4` | The Elixir programming language version |
| `OTP_VERSION` | `27.3.3` | The Erlang/OTP runtime version |
| `DEBIAN_VERSION` | `bookworm-20251117-slim` | The Linux operating system version |

**Why these specific versions?**
- `1.19.4` is the latest stable Elixir and satisfies dependency requirements (backpex `~> 1.16`)
- `27.3.3` is a stable OTP version compatible with Elixir 1.19
- `bookworm` is Debian 12 (stable, well-supported)
- `slim` means a minimal installation (smaller image)

```dockerfile
ARG BUILDER_IMAGE="docker.io/hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="docker.io/debian:${DEBIAN_VERSION}"
```

**What this does**: Constructs the full image names using the version variables.

- `BUILDER_IMAGE` → `hexpm/elixir:1.19.4-erlang-27.3.3-debian-bookworm-20251117-slim`
  - This is an official image from the Elixir team with Elixir + Erlang pre-installed

- `RUNNER_IMAGE` → `debian:bookworm-20251117-slim`
  - This is a minimal Debian image for running (not building) the app

**Why `hexpm/elixir` instead of `elixir`?**
The `hexpm/elixir` images are specifically designed for building Elixir releases and are maintained by the Elixir team.

---

### Section 3: Builder Stage

```dockerfile
FROM ${BUILDER_IMAGE} AS builder
```

**What `FROM` does**: Starts a new build stage using the specified base image.

**What `AS builder` does**: Names this stage "builder" so we can reference it later.

Think of it like: "Start with a computer that already has Elixir and Erlang installed, and call this computer 'builder'"

---

#### Installing Build Dependencies

```dockerfile
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
  && rm -rf /var/lib/apt/lists/*
```

**What `RUN` does**: Executes shell commands inside the container.

**Breaking down the commands**:

| Command | Purpose |
|---------|---------|
| `apt-get update` | Updates the list of available packages |
| `apt-get install -y` | Installs packages without asking for confirmation |
| `--no-install-recommends` | Only installs required packages (keeps image smaller) |
| `build-essential` | C compiler and build tools (needed for native extensions like `bcrypt`) |
| `git` | Git version control (needed to fetch `heroicons` from GitHub) |
| `curl` | HTTP client (needed to download Tailwind and esbuild) |
| `rm -rf /var/lib/apt/lists/*` | Cleans up package cache (keeps image smaller) |

**Why the `\` characters?**
The backslash `\` continues the command on the next line. It's for readability only.

**Why chain with `&&`?**
Each `RUN` creates a new "layer" in the Docker image. Chaining commands with `&&` keeps them in one layer, making the image smaller.

---

#### Setting Up the Working Directory

```dockerfile
WORKDIR /app
```

**What `WORKDIR` does**: Sets the working directory for all following commands.

All subsequent commands will run in `/app`. It's like doing `cd /app` but persistent.

---

#### Installing Hex and Rebar

```dockerfile
RUN mix local.hex --force \
  && mix local.rebar --force
```

**What this does**: Installs two package managers that Elixir needs:

| Tool | Purpose |
|------|---------|
| `hex` | The package manager for Elixir (like npm for Node.js) |
| `rebar` | The package manager for Erlang native dependencies |

**Why `--force`?**
Skips the confirmation prompt. We're in an automated build, so there's no one to type "yes".

---

#### Setting the Build Environment

```dockerfile
ENV MIX_ENV="prod"
```

**What `ENV` does**: Sets an environment variable that persists for the rest of the build.

**What `MIX_ENV` does**: Tells Mix (Elixir's build tool) which environment to use:

| Environment | Purpose |
|-------------|---------|
| `dev` | Development - includes debugging tools, live reload |
| `test` | Testing - includes test frameworks |
| `prod` | Production - optimized, no debugging tools |

Setting `MIX_ENV=prod` ensures:
- Dependencies are compiled with optimizations
- Development-only code is excluded
- The final release is as small as possible

---

### Section 4: Dependencies Layer

```dockerfile
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
```

**What `COPY` does**: Copies files from your computer into the container.

**Why copy only `mix.exs` and `mix.lock` first?**

This is a **Docker layer caching optimization**. Here's how it works:

```
┌───────────────────────────────────────────────────────────────────────┐
│  Docker Layer Caching                                                 │
├───────────────────────────────────────────────────────────────────────┤
│  Layer 1: Base image                    [Cached]                      │
│  Layer 2: apt-get install               [Cached]                      │
│  Layer 3: COPY mix.exs mix.lock         [Cached if unchanged]         │
│  Layer 4: mix deps.get                  [Cached if Layer 3 unchanged] │
│  Layer 5: COPY lib/                     [Rebuilt on code changes]     │
│  Layer 6: mix compile                   [Rebuilt]                     │
└───────────────────────────────────────────────────────────────────────┘
```

If your dependencies don't change, Docker reuses the cached layer. This can save **5+ minutes** on each build!

**What `--only $MIX_ENV` does**: Only fetches production dependencies, not dev/test ones.

---

#### Compiling Dependencies

```dockerfile
RUN mkdir config
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile
```

**Step by step**:

1. `mkdir config` - Create the config directory
2. `COPY config/config.exs config/prod.exs config/` - Copy configuration files
3. `mix deps.compile` - Compile all dependencies

**Why copy config before compiling?**

Some dependencies read configuration at compile time. By copying config files first, we ensure dependencies are compiled with the correct settings.

---

#### Setting Up Assets

```dockerfile
RUN mix assets.setup
```

**What this does**: Downloads and installs:
- **Tailwind CSS** - A CSS framework
- **esbuild** - A JavaScript bundler

These are binary tools downloaded from the internet, not Elixir packages.

---

### Section 5: Application Source Layer

```dockerfile
COPY priv priv
COPY lib lib
```

**What this copies**:

| Directory | Contains |
|-----------|----------|
| `priv/` | Static files, database migrations, seeds |
| `lib/` | Your Elixir source code |

---

### Section 6: CRITICAL - Compilation Order

```dockerfile
# CRITICAL: Compile Application BEFORE Assets
# This order is essential for Phoenix LiveView colocated hooks.
# The phoenix-colocated module is generated during compilation.
RUN mix compile
```

**Why this is CRITICAL**:

Phoenix LiveView 1.1 introduced "colocated hooks" - JavaScript code that lives alongside your Elixir LiveView modules. During `mix compile`, Phoenix generates a JavaScript module at `priv/static/assets/phoenix-colocated/mce.js`.

If you run `mix assets.deploy` BEFORE `mix compile`:
```
❌ Error: Could not resolve "phoenix-colocated/mce"
```

The correct order:
```
1. mix compile     → Generates phoenix-colocated/mce.js
2. mix assets.deploy → Bundles it with your JavaScript
```

**This was the root cause of our deployment failures!**

---

### Section 7: Assets Layer

```dockerfile
COPY assets assets
RUN mix assets.deploy
```

**What this does**:
1. Copies the `assets/` directory (JavaScript, CSS, images)
2. Runs asset compilation:
   - Processes Tailwind CSS
   - Bundles JavaScript with esbuild
   - Minifies everything for production
   - Generates cache-busting fingerprints

---

### Section 8: Release Layer

```dockerfile
COPY config/runtime.exs config/
COPY rel rel
RUN mix release
```

**What `runtime.exs` is for**:

Unlike `config.exs` and `prod.exs` which are read at **compile time**, `runtime.exs` is read at **startup time**. This is where you read environment variables like `DATABASE_URL`.

**What `COPY rel rel` does**:

Copies the `rel/` directory which contains:
- `env.sh.eex` - Environment setup script
- `overlays/bin/server` - The startup script

These files configure how the release starts.

**What `mix release` does**:

Creates a self-contained package with:
- Your compiled application (`.beam` files)
- The Erlang runtime (ERTS)
- Boot scripts
- Configuration files

The output is in `_build/prod/rel/mce/`.

---

### Section 9: Runtime Stage

```dockerfile
FROM ${RUNNER_IMAGE} AS runtime
```

**What this does**: Starts a completely fresh image from Debian.

**Everything from the builder stage is discarded** except what we explicitly copy.

---

#### Installing Runtime Dependencies

```dockerfile
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libstdc++6 \
    openssl \
    libncurses6 \
    locales \
    ca-certificates \
    curl \
    chromium \
    fonts-liberation \
    fonts-noto-cjk \
  && rm -rf /var/lib/apt/lists/*
```

**What each package does**:

| Package | Purpose |
|---------|---------|
| `libstdc++6` | C++ standard library (needed by Erlang) |
| `openssl` | SSL/TLS encryption (HTTPS, database connections) |
| `libncurses6` | Terminal library (for `remote_console`) |
| `locales` | Language/locale support |
| `ca-certificates` | SSL certificate authorities (for HTTPS) |
| `curl` | HTTP client (for Docker HEALTHCHECK command) |
| `chromium` | Web browser (for PDF generation with ChromicPDF) |
| `fonts-liberation` | Standard fonts for PDFs |
| `fonts-noto-cjk` | Chinese/Japanese/Korean fonts (for Korean text in PDFs) |

---

#### Configuring Locale

```dockerfile
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
```

**What this does**: Enables UTF-8 encoding for proper text handling.

Elixir requires UTF-8 locale. Without this, you might see warnings like:
```
warning: the VM is running with native name encoding of latin1
```

---

#### Security Setup

```dockerfile
WORKDIR /app
RUN useradd --create-home --shell /bin/bash app \
  && chown -R app:app /app
```

**What this does**: Creates a non-root user named `app`.

**Why this matters for security**:
- If someone exploits a vulnerability in your app, they have limited privileges
- They can't install software or access system files
- This is a security best practice for all containerized applications

---

#### Runtime Environment Variables

```dockerfile
ENV MIX_ENV="prod"
ENV PHX_SERVER="true"
ENV CHROMIC_PDF_NO_SANDBOX="true"
```

| Variable | Purpose |
|----------|---------|
| `MIX_ENV` | Confirms we're in production mode |
| `PHX_SERVER` | Tells Phoenix to start the web server |
| `CHROMIC_PDF_NO_SANDBOX` | Disables Chrome's sandbox (required in Docker) |

**Why `PHX_SERVER`?**

By default, a Phoenix release doesn't start the web server. This is useful if you want to run migrations without starting the server. Setting `PHX_SERVER=true` enables the server.

**Why `CHROMIC_PDF_NO_SANDBOX`?**

Chrome's sandbox requires special kernel capabilities that Docker containers don't have by default. Disabling the sandbox is safe within a container because the container itself provides isolation.

---

#### Copying the Release

```dockerfile
COPY --from=builder --chown=app:app /app/_build/prod/rel/mce ./
```

**What this does**: Copies ONLY the compiled release from the builder stage.

| Flag | Purpose |
|------|---------|
| `--from=builder` | Copy from the builder stage, not the host |
| `--chown=app:app` | Set ownership to the `app` user |

This is where the multi-stage magic happens. We're only copying ~50MB of compiled code, not the ~2GB of build tools.

---

#### Running as Non-Root

```dockerfile
USER app
```

**What this does**: Switches to the `app` user for all subsequent commands.

From this point on, everything runs as `app`, not `root`.

---

#### Exposing the Port

```dockerfile
EXPOSE 4000
```

**What this does**: Documents that the container listens on port 4000.

**Note**: This doesn't actually publish the port. It's documentation. You still need `-p 4000:4000` when running the container.

---

#### Health Check

```dockerfile
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:4000/health || exit 1
```

**What this does**: Tells Docker how to check if the application is healthy.

| Parameter | Value | Meaning |
|-----------|-------|---------|
| `--interval` | 30s | Check every 30 seconds |
| `--timeout` | 5s | Wait up to 5 seconds for response |
| `--start-period` | 10s | Give app 10 seconds to start before checking |
| `--retries` | 3 | Mark unhealthy after 3 consecutive failures |

**The health check command**:
- `curl -f http://localhost:4000/health` - Make HTTP request
- `-f` means fail on HTTP errors (4xx, 5xx)
- `|| exit 1` - Exit with error code if curl fails

---

#### Starting the Application

```dockerfile
CMD ["/app/bin/server"]
```

**What `CMD` does**: Specifies the default command to run when the container starts.

**What `/app/bin/server` is**: A shell script that:
1. Sets `PHX_SERVER=true`
2. Starts the Elixir application

---

## 5. Supporting Files Explained

### 5.1 `.dockerignore`

**Location**: `/Volumes/Storage/Projects/mce/code/mce/.dockerignore`

**Purpose**: Tells Docker which files to IGNORE when building.

When you run `docker build`, Docker first sends all files in your project to the Docker daemon. The `.dockerignore` file excludes unnecessary files, making the build:
- **Faster** (less data to transfer)
- **Smaller** (no dev dependencies in context)
- **More secure** (no secrets accidentally included)

**Key exclusions**:

```
# Don't include Git history
.git

# Don't include compiled files (we'll build fresh)
_build/
deps/

# Don't include test files (not needed in production)
/test/

# Don't include development documentation
dev-doc/

# Don't include IDE settings
.vscode/
.idea/

# Don't include environment files with secrets
.env
.env.*
```

---

### 5.2 `rel/env.sh.eex`

**Location**: `/Volumes/Storage/Projects/mce/code/mce/rel/env.sh.eex`

**Purpose**: Shell script sourced before starting the release.

**What `.eex` means**: "Embedded Elixir" - a template format. But in this case, we're not using any templating, just plain shell script.

```bash
#!/bin/sh

# Set UTF-8 locale
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# Enable the Phoenix server
export PHX_SERVER="${PHX_SERVER:-true}"

# Disable Chrome sandbox for Docker
export CHROMIC_PDF_NO_SANDBOX="${CHROMIC_PDF_NO_SANDBOX:-true}"

# Default database connection pool size
export POOL_SIZE="${POOL_SIZE:-10}"
```

**What `${VAR:-default}` means**:
- If `VAR` is set, use its value
- If `VAR` is not set, use `default`

This allows environment variables to be overridden while providing sensible defaults.

---

### 5.3 `rel/overlays/bin/server`

**Location**: `/Volumes/Storage/Projects/mce/code/mce/rel/overlays/bin/server`

**Purpose**: The startup script that Docker calls.

```bash
#!/bin/sh
set -e                                    # Exit on any error
cd -P -- "$(dirname -- "$0")/.."          # Change to app directory
export PHX_SERVER=true                    # Enable the web server
exec ./bin/mce start                      # Start the application
```

**What `exec` does**: Replaces the shell process with the Elixir process. This ensures:
- Signal handling works correctly (SIGTERM stops the app)
- The container exit code reflects the app's exit code

---

### 5.4 `lib/mce_web/controllers/health_controller.ex`

**Location**: `/Volumes/Storage/Projects/mce/code/mce/lib/mce_web/controllers/health_controller.ex`

**Purpose**: HTTP endpoint for health checks.

```elixir
defmodule MceWeb.HealthController do
  use MceWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end
end
```

**What it returns**:
```json
{"status": "ok"}
```

**Why this endpoint?**
- Docker HEALTHCHECK calls it every 30 seconds
- Load balancers use it to know if the app is ready
- Monitoring systems use it to detect outages

---

## 6. The Build Process Flow

Here's the complete flow when you run `docker build`:

```
┌─────────────────────────────────────────────────────────────┐
│  1. COPY mix.exs, mix.lock                                  │
│     ↓                                                       │
│  2. mix deps.get (download dependencies)                    │
│     ↓                                                       │
│  3. COPY config files                                       │
│     ↓                                                       │
│  4. mix deps.compile (compile dependencies)                 │
│     ↓                                                       │
│  5. mix assets.setup (download Tailwind, esbuild)           │
│     ↓                                                       │
│  6. COPY lib, priv (application source)                     │
│     ↓                                                       │
│  7. mix compile (compile application)                       │
│     ↓ ← Creates phoenix-colocated/mce.js                    │
│  8. COPY assets                                             │
│     ↓                                                       │
│  9. mix assets.deploy (bundle JS/CSS)                       │
│     ↓ ← Uses phoenix-colocated/mce.js                       │
│  10. mix release (create standalone package)                │
│     ↓                                                       │
│  ═══════════════════════════════════════════════════════    │
│  11. Start fresh Debian image                               │
│     ↓                                                       │
│  12. Install runtime dependencies                           │
│     ↓                                                       │
│  13. COPY release from builder                              │
│     ↓                                                       │
│  14. Set user, expose port, configure healthcheck           │
│     ↓                                                       │
│  15. CMD /app/bin/server                                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 7. Environment Variables

### Required Variables (must be set in Dokploy)

| Variable | Example | Purpose |
|----------|---------|---------|
| `DATABASE_URL` | `postgresql://user:pass@host:5432/db` | Database connection string |
| `SECRET_KEY_BASE` | `64+ character random string` | Encryption key for cookies/sessions |
| `PHX_HOST` | `mce.anysite.kr` | Your domain name |

### Optional Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `PORT` | `4000` | HTTP port to listen on |
| `POOL_SIZE` | `10` | Database connection pool size |
| `PHX_SERVER` | `true` | Whether to start web server |

### How to Generate SECRET_KEY_BASE

```bash
mix phx.gen.secret
```

This outputs a secure 64-character random string.

---

## 8. Common Issues and Solutions

### Issue 1: "Could not resolve phoenix-colocated/mce"

**Cause**: `mix assets.deploy` ran before `mix compile`

**Solution**: Ensure `mix compile` comes before `mix assets.deploy` in the Dockerfile

---

### Issue 2: "locale: Cannot set LC_ALL"

**Cause**: UTF-8 locale not configured

**Solution**: Add locale configuration to Dockerfile:
```dockerfile
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
```

---

### Issue 3: "Chrome sandbox error"

**Cause**: Chrome can't create sandbox in Docker

**Solution**: Set `CHROMIC_PDF_NO_SANDBOX=true`

---

### Issue 4: "Permission denied"

**Cause**: Files owned by root, running as `app` user

**Solution**: Use `--chown=app:app` when copying files

---

### Issue 5: Health check failing

**Cause**: `curl` not installed in runtime image

**Symptom**: Container shows `(health: starting)` indefinitely, Docker Swarm sends `SIGTERM` after retries, resulting in restart loop and `REPLICAS 0/1`.

**Solution**: Install `curl` in the runtime stage:
```dockerfile
RUN apt-get install -y --no-install-recommends curl
```

**Note**: This issue was encountered and fixed on 2025-12-01. The Dockerfile now includes `curl` in runtime dependencies.

---

## 9. Glossary

| Term | Definition |
|------|------------|
| **Container** | A lightweight, standalone package that includes everything needed to run an application |
| **Image** | A template for creating containers (like a class vs instance) |
| **Layer** | A read-only file system change; Docker caches layers for faster builds |
| **Multi-stage build** | Using multiple `FROM` statements to create smaller final images |
| **Release** | A compiled, standalone Elixir application with embedded Erlang runtime |
| **BEAM** | The Erlang virtual machine that runs Elixir code |
| **OTP** | Open Telecom Platform - Erlang's standard library and runtime |
| **Mix** | Elixir's build tool (like npm, cargo, or gradle) |
| **Hex** | Elixir's package manager (like npm registry) |
| **Rebar** | Erlang's build tool for native extensions |
| **esbuild** | A fast JavaScript bundler |
| **Tailwind** | A utility-first CSS framework |
| **Colocated hooks** | Phoenix LiveView feature for inline JavaScript |

---

## Additional Resources

- [Phoenix Deployment Guide](https://hexdocs.pm/phoenix/releases.html)
- [Docker Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [hexpm/elixir Images](https://hub.docker.com/r/hexpm/elixir)
- [ChromicPDF Documentation](https://hexdocs.pm/chromic_pdf/ChromicPDF.html)

---

**Document Version**: 1.2
**Last Updated**: 2025-12-01
**Changelog**:
- v1.2: Updated to Elixir 1.19.4 / OTP 27.3.3 to satisfy backpex dependency requirement (~> 1.16)
- v1.1: Added `curl` to runtime dependencies for Docker HEALTHCHECK (fix for health check failure causing restart loop)
