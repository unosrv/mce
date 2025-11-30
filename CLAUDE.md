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

## MCP Servers

- Context7, Serena (config in `.serena/`)

## Use playwright-skill plugin for UI testing

- Check UI functionality after create or modify any UI related code.
- [Important] Check the UI as aspect of aesthetics as well as functionality.

### Login Page Structure (CRITICAL)

The login page (`/users/log-in`) has **TWO separate login forms**. DO NOT mix them up:

1. **Magic Link Login Form** (TOP section - email only)
   - Form ID: `#login_form_magic`
   - Email field: `#login_form_magic input[name="user[email]"]`
   - Submit button: `#login_form_magic button` (no type attribute set)

2. **Password Login Form** (BOTTOM section - email + password)
   - Form ID: `#login_form_password`
   - Email field: `#login_form_password input[name="user[email]"]`
   - Password field: `#login_form_password input[name="user[password]"]`
   - Submit buttons: Two `<button>` elements (first = remember, second = one-time)
   - **Note:** Buttons do NOT have `type="submit"` attribute (Phoenix `<.button>` component default)

**Playwright Login Code Pattern (ALWAYS use this):**
```javascript
// For password login - use EXACT form ID selectors
await page.fill('#login_form_password input[name="user[email]"]', 'user@example.com');
await page.fill('#login_form_password input[name="user[password]"]', 'password123');
// Click the first button (Log in and stay logged in) - DO NOT use [type="submit"]
await page.locator('#login_form_password button').first().click();
```

**Test Credentials (from seeds.exs):**
- Admin: `admin@anysite.kr` / `AdminPassword123!`
- Test User: `jason@anysite.kr` / `jason12345678`

## Local Development Database
  - Database files: @/Users/jwpark/Library/Application Support/com.tinyapp.DBngin/Engines/postgresql/
  - Database binary: @/Users/Shared/DBngin/postgresql/17.0/
  
## Documentation Standards

**Document File Naming:** `YYMMDDHHMM_[DESCRIPTIVE_NAME].md`
- Note the SNAKE_CASE with UPPERCASE for descriptive name.

**Get timestamp:** Run `date "+%y%m%d%H%M"` and use EXACT output - never estimate or round.
- Use this command to get precise timestamps for other titles, labels, document contents as well.

**Organization:**
- Plans: `dev-doc/plan`
- Reports: `dev-doc/report`
- Messages from other teams: Target team's `dev-doc/inbox`
- Date subdirectories: `2511/` for November 2025
  - Do not need to create this date subdirectories, user will create when needed.
  - Find it in data subdirectories if a document not exist in the directory.

## Commits

- Convention: `feat:`, `fix:`, `chore:`, `refactor:`, `doc:`
- **⚠️ NEVER add AI attribution** - No Claude/AI tags

## Development Guidelines

- **ASK MODE:** Prompt starts with `ASK:` → instructions only, no modifications

## LLM Context documentations for AI agents

- Use documents in @dev-doc/context
  - Request to the user if you need any llm documentations
- Use Context7 MCP server for up-to-date docs if you need
- Proactively use web search to find relevant information when needed
  - https://hexdocs.pm/phoenix/overview.html
  - https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html
  - https://daisyui.com/docs/intro/
  - https://hexdocs.pm/backpex/readme.html
  - https://tailwindcss.com/docs/installation/using-vite

## Language
  - Always keep synchronise when writing texts: titles, labels, messages, etc.
  - Always keep synchronise when refactor frontend UI.
  - The primary UI interface language of the project is Korean. The UI targe languages are Korean, English(US), and Portuguese(Brazil).
  - English is strictly used for development including code comments, commit messages, and documentation.
  - Clear and technically precise language is preferred.
  - British English spelling and conventions are preferred.

## Uncertainty Map

- Add this section at the end of your response: label it "Uncertainty Map" and use it to describe what you are least confident about, what you may be oversimplifying, and what questions or follow-ups would change your opinion.

@AGENTS.md

The AGENTS.md file contains comprehensive guidelines for:
- Elixir language patterns and common pitfalls
- Phoenix/Ecto best practices
- HEEx template syntax (interpolation, conditionals, class lists)
- LiveView streams and form handling
- Testing with `Phoenix.LiveViewTest` and `LazyHTML`
- The result of context research files:
- document files in @dev-doc/prd/2511290312_RESEARCH/
