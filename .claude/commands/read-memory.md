---
description: Read session context from memory to restore previous session state
---

## Read Memory Command

Read session context from `dev-doc/memory/` to efficiently restore context from a previous session.

**Memory File**: $ARGUMENTS (default: most recent file in `dev-doc/memory/`)

### Instructions

1. **Locate Memory File**
   - If argument provided: Read the specified file from `dev-doc/memory/`
   - If no argument: Find the most recent file in `dev-doc/memory/`
     - List files: `ls -t dev-doc/memory/`
     - Select the first (most recent) file

2. **Read Memory Document**
   - Read the full contents of the memory file
   - Parse the structured information

3. **Restore Context**
   Present the restored context to the user, highlighting:

   - **Current Branch**: Verify it matches or note if different
   - **Previous Tasks**: What was completed in the previous session
   - **Uncommitted Changes**: Files that may still need attention
   - **Technical Insights**: Important patterns or solutions discovered
   - **Next Steps**: Recommended tasks to continue

4. **Verify Current State**
   After reading memory, run these commands to compare with current state:
   - `git branch --show-current` - Check if still on the same branch
   - `git status` - Compare uncommitted files with memory

5. **Present Summary**
   Provide a brief summary to the user:
   ```
   ## Session Context Restored

   **Memory File**: [filename]
   **Previous Session Date**: [date from memory]
   **Current Branch**: [branch] (matches/differs from memory)

   ### Key Context
   - [Most important items from the previous session]

   ### Pending Work
   - [Uncommitted files or next steps]

   ### Ready to Continue
   [Brief statement about what the user can do next]
   ```

### Notes
- Memory files follow the naming convention: `YYMMDDHHMM_SESSION_CONTEXT.md`
- If the memory file references documentation, offer to read those files as well
- Highlight any differences between the memory state and current repository state
- If multiple memory files exist, the user can specify which one to read by passing the filename as an argument
