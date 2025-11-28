# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Mce is a Phoenix 1.8 web application with LiveView support, using PostgreSQL for persistence.

## Development Commands

```bash
# Initial setup
mix setup                    # Install deps, create DB, run migrations, setup assets

# Development server
mix phx.server               # Start Phoenix server at localhost:4000
iex -S mix phx.server        # Start with interactive shell

# Database
mix ecto.create              # Create database
mix ecto.migrate             # Run migrations
mix ecto.reset               # Drop + create + migrate + seed

# Testing
mix test                     # Run all tests
mix test test/path_test.exs  # Run specific test file
mix test --failed            # Re-run previously failed tests

# Pre-commit (run before completing changes)
mix precommit                # Compile with warnings-as-errors, unlock unused deps, format, test
```

## Architecture

### Application Structure

- `lib/mce/` - Business logic (contexts, schemas, repo)
  - `application.ex` - OTP application supervisor tree
  - `repo.ex` - Ecto repository
  - `mailer.ex` - Email via Swoosh

- `lib/mce_web/` - Web layer
  - `router.ex` - Route definitions (browser scope aliased to `MceWeb`)
  - `endpoint.ex` - HTTP endpoint configuration
  - `components/` - Reusable UI components
    - `core_components.ex` - Form inputs, buttons, icons (`<.icon name="hero-*">`)
    - `layouts.ex` - App shell (`<Layouts.app>`) and flash groups
  - `controllers/` - Traditional request/response controllers
  - `live/` - LiveView modules (to be added)

### Key Configuration

- PostgreSQL on port 5433 (non-standard)
- Dev routes enabled: `/dev/dashboard` (LiveDashboard), `/dev/mailbox` (Swoosh preview)
- Assets: Tailwind CSS + esbuild

### Module Naming

- Business logic: `Mce.*` (e.g., `Mce.Accounts`)
- Web modules: `MceWeb.*` (e.g., `MceWeb.UserLive`)
- LiveViews: Use `*Live` suffix (e.g., `MceWeb.DashboardLive`)

### Dependencies

- HTTP client: Use `Req` (already included) - avoid HTTPoison, Tesla, HTTPc

@AGENTS.md
