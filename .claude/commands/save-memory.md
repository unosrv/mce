---
description: Save session context to memory for future sessions
---

## Save Memory Command

Save the current session context to `dev-doc/memory/` for efficient context restoration in future sessions.

### Instructions

1. **Generate Timestamp**
   - Run: `date "+%y%m%d%H%M"`
   - Use the EXACT output - never estimate or round

2. **Gather Session Context**
   Collect the following information from the current session:

   - **Current Branch**: Run `git branch --show-current`
   - **Completed Tasks**: Review conversation for tasks that were finished
   - **Uncommitted Changes**: Run `git status` to capture pending changes
   - **Key Technical Insights**: Document important discoveries, patterns, or solutions
   - **Files Modified**: List significant files that were created or changed
   - **Relevant Commits**: Recent commits made during this session
   - **Server Status**: Note if server is running and on which port
   - **Next Steps**: Recommended follow-up tasks if applicable

3. **Create Memory Document**
   - **Directory**: `dev-doc/memory/`
   - **File Name Format**: `YYMMDDHHMM_SESSION_CONTEXT.md`

   - **Document Structure**:
     ```markdown
     # Session Context Memory - [Full date and time]

     ## Current Branch
     `[branch-name]`

     ## Completed Tasks

     ### 1. [Task Name] (COMPLETED)
     **Issue:** [Brief description of the problem]
     **Solution Applied:** [What was done to fix it]
     **Files Modified:** [List of files]
     **Commit:** `[hash]` - "[message]" (if committed)

     ## Remaining Uncommitted Files
     [Output from git status showing modified/untracked files]

     ## Key Technical Insights
     [Important discoveries, patterns, gotchas, or solutions that would help future sessions]

     ## Server Status
     [Phoenix server port, running status, database connection notes]

     ## Test Credentials (if relevant)
     [Login credentials used during testing]

     ## Next Steps (If Applicable)
     1. [Recommended follow-up task]
     2. [Another task]
     ```

4. **Save Memory**
   - Write the document to `dev-doc/memory/` with the generated filename
   - Confirm the file location to the user

### Notes
- Memory documents are written in English (per project guidelines)
- Focus on information that would help quickly resume work in a new session
- Include code snippets for complex technical solutions
- Reference relevant documentation files created during the session
