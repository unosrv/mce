---
description: Git commit current changes
model: haiku
---

## Staging Strategy

**Rule**: Check staging area first, then decide:

### If Staging Area HAS Files:
- ✅ **DO**: Commit ONLY the currently staged files
- ❌ **DON'T**: Add more files to staging (even if related)
- 📝 **Reason**: Keep commits atomic and logically separated
- 🔄 **Next Step**: After commit, stage and commit remaining files separately

### If Staging Area is EMPTY:
- ✅ **DO**: Stage all modified files from `git diff`
- ✅ **DO**: Commit all staged files together

### Multiple Commit:
- If the staged files originated from distinctly different tasks, or if you believe it would be better to commit them separately, feel free to split the commit into multiple stages.

### Exception (Ask User First):
**ONLY** if user explicitly requests combining changes, you may:
- Ask: "The staging area has files. Should I commit only staged files, or add [specific files] and commit together?"
- Wait for user confirmation before adding more files

### Examples:

**❌ WRONG** (What happened in our case):
```bash
git status  # Shows: 22 files staged, 3 files unstaged
git add CLAUDE.md codebook.toml  # ❌ Added more files!
git commit  # Committed all 25 files together
```

**✅ CORRECT**:
```bash
git status  # Shows: 22 files staged, 3 files unstaged
git commit  # ✅ Commit only the 22 staged files
# Then separately:
git add CLAUDE.md codebook.toml
git commit  # ✅ Commit remaining 3 files
```

## Commit Process

1. **Security Scan (CRITICAL - Always Run First)**
   - **⚠️ SCAN FOR SECRETS** before committing any files
   - Search staged files for credentials, API keys, passwords, tokens
   - Check for patterns like:
     - OAuth secrets (client IDs, client secrets)
     - API keys (PortOne, SureM, Resend, etc.)
     - Database passwords
     - JWT secrets, cookie secrets
     - Encryption keys
     - SSH passwords
   - **If secrets found:**
     - ❌ **STOP**: Do NOT commit
     - 🚨 **ALERT USER** immediately with file locations
     - 📝 **GUIDE**: Show how to move secrets to vault (`dev-note/secrets/`)
     - ✅ **VERIFY**: Secrets moved to vault before proceeding
   - **Only proceed** if no secrets detected or all secrets properly vaulted

2. **Analyse Changes**
   - Review `git status` to identify staged/unstaged files
   - Examine `git diff` (both staged and unstaged) to understand the nature of changes
   - Review recent commits (`git log`) to maintain consistent commit message style
   - **Re-verify**: No sensitive information in diffs

3. **Craft Commit Message**
   - Follow conventional commits format: `<type>: <subject>`
   - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, etc.
   - Keep subject line concise (≤72 characters), imperative mood
   - Optionally add detailed body paragraphs separated by blank lines

   **⚠️ IMPORTANT - Attribution Rules:**
   - ❌ **NEVER** add "🤖 Generated with [Claude Code]..." footer
   - ❌ **NEVER** add "Co-Authored-By: Claude <noreply@anthropic.com>" footer
   - ✅ **ALWAYS** commit as the repository's configured git user only
   - ✅ Keep commit messages clean and professional without AI attribution

   **Example (simple):**
   ```
   feat: Add user authentication flow
   ```

   **Example (with body):**
   ```
   refactor: Migrate cart service to Medusa adapter

   Replace legacy axios calls with new adapter pattern:
   - Implement cartAdapter.ts with fallback logic
   - Update CartStore to use service layer
   - Add feature flag support for gradual rollout

   Resolves inconsistent cart state handling between legacy and Medusa backends.
   ```

   **❌ WRONG - Do NOT include these lines:**
   ```
   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```

4. **Commit Execution**
   - **Final Security Check**: Verify no secrets in staged changes
   - Stage files if needed (`git add`)
   - Create commit with formatted message (use heredoc for multi-line messages)
   - Verify commit success with `git status`
   - **IMPORTANT**: Commit ONLY as the repository's configured git user
   - **NEVER** add AI attribution footers or co-author tags

## Security Checklist (Run Before Every Commit)

**⚠️ CRITICAL: Scan ALL staged files for secrets before committing**

```bash
# Example secret patterns to detect:
grep -r "CLIENT_ID=.*[A-Za-z0-9]" <staged-files>
grep -r "CLIENT_SECRET=.*[A-Za-z0-9]" <staged-files>
grep -r "API_KEY=.*[A-Za-z0-9]" <staged-files>
grep -r "PASSWORD=.*[A-Za-z0-9]" <staged-files>
grep -r "[0-9a-f]{32,}" <staged-files>  # Long hex strings (likely tokens)
```

**If ANY secrets detected:**
1. ❌ **ABORT COMMIT** immediately
2. 🚨 **REPORT** to user: "⚠️ SECURITY ALERT: Secrets detected in [files]"
3. 📝 **GUIDE** user to move secrets to `dev-note/secrets/` (gitignored)
4. ✅ **REPLACE** with placeholders like `<SECRET_NAME>`
5. 🔄 **RE-SCAN** after sanitization
6. ✅ **PROCEED** only after confirmation

**Approved Locations for Secrets:**
- ✅ `.env*` files (gitignored)
- ✅ `dev-note/secrets/` (gitignored)
- ❌ **NEVER** in documentation files (plans, reports, messages, guides)
