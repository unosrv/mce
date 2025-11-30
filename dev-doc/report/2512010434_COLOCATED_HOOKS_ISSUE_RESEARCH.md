# Report: Phoenix Colocated Hooks Build Order Issue - Research Summary

**Date**: 2025-12-01 04:34 KST
**Author**: Claude Code

## Summary

Researched similar issues to the Dokploy deployment failure caused by Phoenix LiveView colocated hooks. Found this is a known, documented problem that has been reported and fixed in multiple places within the Phoenix ecosystem.

## Research Findings

### 1. Phoenix Framework GitHub Issue #6320

**URL**: https://github.com/phoenixframework/phoenix/issues/6320

| Field | Details |
|-------|---------|
| Title | Docker build error: Could not resolve "phoenix-colocated/*" |
| Reporter | suciptoid |
| Date | June 26, 2025 |
| Status | Closed (Fixed) |
| Phoenix Version | 1.8.0-rc.3 |
| LiveView Version | 1.1.0-rc.1 |

**Root Cause**: The Dockerfile template executed `mix assets.deploy` before `mix compile`. The colocated hooks module is generated during compilation.

**Resolution**: PR #6333 updated the generated Dockerfile template to run compilation before asset deployment.

### 2. Railway/Railpack Issue

**URL**: https://station.railway.com/questions/unable-to-deploy-elixir-phoenix-apps-wit-e5bfaa40

| Field | Details |
|-------|---------|
| Platform | Railway (using Railpack) |
| Error | Could not resolve "phoenix-colocated/railpack" |
| Fix | PR #231 to railwayapp/railpack |
| Status | Merged and deployed |

**Solution**: Adjusted Railpack's build order so `mix compile` runs before `mix assets.deploy`.

### 3. Official Phoenix LiveView Documentation

**URL**: https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.ColocatedJS.html

The documentation explicitly states:

> "Whenever you need to access a colocated hook, you need to ensure `mix compile` runs first. This automatically happens in development. If you have a custom mix alias, instead of `release: ["assets.deploy", "release"]` do `release: ["compile", "assets.deploy", "release"]` to ensure that all colocated hooks are extracted before esbuild or any other bundler runs."

## Comparison with Our Issue

| Aspect | Reported Issues | Our Issue |
|--------|-----------------|-----------|
| Error Message | `Could not resolve "phoenix-colocated/*"` | `Could not resolve "phoenix-colocated/mce"` |
| Build Tool | Dockerfile / Railpack | Railpack (Dokploy) |
| Root Cause | Build order: assets before compile | Build order: assets before compile |
| Official Fix | Run `mix compile` first | PR merged in Railpack |
| Our Fix | Removed unused import | Valid workaround |

## Implications

1. **Railpack Fix Available**: The fix (PR #231) has been merged into Railpack. Dokploy may need to update its Railpack version, or the fix may already be deployed.

2. **Our Workaround is Valid**: Since we don't use colocated hooks (no `.js` files in `lib/`), removing the unused import is a clean solution.

3. **Future Consideration**: If colocated hooks are needed later, we should either:
   - Verify Dokploy uses updated Railpack with the fix
   - Override build command: `BUILD_CMD=mix compile && mix assets.deploy`

## Related Links

- [Phoenix Issue #6320](https://github.com/phoenixframework/phoenix/issues/6320)
- [Phoenix PR #6333](https://github.com/phoenixframework/phoenix/pull/6333) - Dockerfile fix
- [Railpack PR #231](https://github.com/railwayapp/railpack/pull/231) - Build order fix
- [Railway Help Station](https://station.railway.com/questions/unable-to-deploy-elixir-phoenix-apps-wit-e5bfaa40)
- [Phoenix LiveView ColocatedJS Docs](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.ColocatedJS.html)
- [Phoenix Asset Management Docs](https://hexdocs.pm/phoenix/asset_management.html)

## Conclusion

Our deployment issue was a known problem in the Phoenix ecosystem related to Phoenix LiveView 1.1's new colocated hooks feature. The issue has been addressed upstream in both Phoenix's Dockerfile template and Railway's Railpack builder. Our workaround (removing the unused import) is appropriate for our use case.

## Next Steps

1. Monitor next Dokploy deployment to confirm fix works
2. If colocated hooks are needed in future, verify Dokploy's Railpack version includes the fix
3. Consider documenting this in project deployment notes for future reference
