# Report: Dokploy Deployment Fix - Phoenix Colocated Hooks Error

**Date**: 2025-12-01 04:21 KST
**Author**: Claude Code

## Summary

Fixed a production deployment failure on Dokploy caused by Railpack build order incompatibility with Phoenix LiveView's colocated JavaScript hooks feature.

## Tasks Completed

- Analysed deployment error log from `dev-doc/private/deployment/LOG_2512010408.md`
- Identified root cause: Railpack runs `mix assets.deploy` before `mix compile`
- Verified no colocated JS files exist in the project (`lib/**/*.js` - none found)
- Removed unused `phoenix-colocated/mce` import from `assets/js/app.js`
- Verified asset build succeeds after fix
- Confirmed all 249 tests pass

## Root Cause Analysis

### The Error
```
✘ [ERROR] Could not resolve "phoenix-colocated/mce"

    js/app.js:27:38:
      27 │ import {hooks as colocatedHooks} from "phoenix-colocated/mce"
```

### Build Order Issue
Railpack's build sequence in the deployment log:
```
▸ build
$ mix assets.deploy   ← esbuild runs HERE (before compile!)
$ mix compile         ← colocated module generated HERE
$ mix release
```

Phoenix LiveView's `:phoenix_live_view` compiler generates the `phoenix-colocated/mce` module during `mix compile`. Since Railpack runs asset deployment before compilation, the module doesn't exist when esbuild attempts to bundle `app.js`.

## Code Changes

- **`assets/js/app.js`**:
  - Removed: `import {hooks as colocatedHooks} from "phoenix-colocated/mce"`
  - Changed: `hooks: {...colocatedHooks, ...Hooks}` → `hooks: Hooks`

## Test Results

- **Asset Build**: Pass (completed in 32ms)
- **Unit Tests**: 249 tests, 0 failures
- **Precommit**: Pass

## Issues Encountered

| Issue | Resolution |
|-------|------------|
| `phoenix-colocated/mce` module not found during asset deploy | Removed unused import since no colocated JS files exist in project |

## Alternative Solution (Not Applied)

If colocated hooks are needed in the future, override Railpack build command in Dokploy environment variables:
```
BUILD_CMD=mix compile && mix assets.deploy
```

## Next Steps

1. Commit the fix
2. Push to remote and trigger new Dokploy deployment
3. Verify deployment succeeds

## Files Referenced

- `dev-doc/private/deployment/LOG_2512010408.md` - Deployment error log
- `dev-doc/context/dokploy.md` - Dokploy deployment context
- `assets/js/app.js` - Fixed file
- `config/config.exs` - esbuild configuration
- `mix.exs` - Project configuration with `:phoenix_live_view` compiler
