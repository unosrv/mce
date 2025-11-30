# Guide: Dokploy Build Order Configuration

**Date**: 2025-12-01
**Context**: Phoenix LiveView colocated hooks require `mix compile` to run before `mix assets.deploy`

## Problem

When deploying Phoenix 1.8+ applications with LiveView 1.1+ to Dokploy, the default Railpack/Nixpacks build order may cause asset compilation to fail with:

```
✘ [ERROR] Could not resolve "phoenix-colocated/mce"
```

This happens because colocated hooks are generated during `mix compile`, but Railpack runs `mix assets.deploy` first.

## Solution Options

### Option 1: Override Build Command (Railpack)

In Dokploy's **Environment Variables** tab for your application, add:

```
BUILD_CMD=mix compile && mix assets.deploy
```

This tells Railpack to run `mix compile` first, then `mix assets.deploy`.

### Option 2: If Using Nixpacks

```
NIXPACKS_BUILD_CMD=mix compile && mix assets.deploy
```

### Option 3: Use a Custom Dockerfile

Create a `Dockerfile` in your project root. Dokploy will automatically use it instead of Railpack/Nixpacks:

```dockerfile
# Simplified example - adjust based on your needs
FROM elixir:1.15-alpine AS build

WORKDIR /app
ENV MIX_ENV=prod

# Install dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod

# Compile first, then assets
COPY . .
RUN mix compile
RUN mix assets.deploy
RUN mix release

# ... runtime stage
```

## Recommendation

Since the fix has been merged into Railpack ([PR #231](https://github.com/railwayapp/railpack/pull/231)), you could:

1. **First**: Try redeploying without changes - Dokploy may have already updated Railpack
2. **If still fails**: Add `BUILD_CMD=mix compile && mix assets.deploy` to environment variables
3. **Alternative**: Remove unused colocated hooks import from `assets/js/app.js` if not using the feature

## Related Documentation

- [Dokploy Environment Variables](https://docs.dokploy.com/docs/core/applications/build-type)
- [Phoenix LiveView ColocatedJS](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.ColocatedJS.html)
- [Railpack PR #231](https://github.com/railwayapp/railpack/pull/231) - Build order fix
- [Phoenix Issue #6320](https://github.com/phoenixframework/phoenix/issues/6320) - Original issue report

## See Also

- `dev-doc/report/2512010421_DOKPLOY_DEPLOYMENT_FIX.md` - Root cause analysis
- `dev-doc/report/2512010434_COLOCATED_HOOKS_ISSUE_RESEARCH.md` - Ecosystem research
- `dev-doc/context/dokploy.md` - Dokploy deployment reference
