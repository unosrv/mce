---
description: Save current task status to Serena
---

## Purpose

Persist important context and progress to Serena memory so work can be resumed efficiently in future sessions.

## What to Save

Create a timestamped memory with relevant information:

1. **Task Summary**
   - What was accomplished in this session
   - Current state/status of the work
   - Any blockers or issues encountered

2. **Next Steps**
   - Specific action items to resume work
   - Dependencies or prerequisites
   - Priority order of remaining tasks

3. **Key Decisions**
   - Architectural choices made
   - Trade-offs considered
   - Rationale for approach taken

4. **Technical Context**
   - Files modified or created
   - Relevant configuration changes
   - Integration points affected

## Memory Naming Convention

Use descriptive, timestamped names:
- Use the date command to retrieve exact current timestamp: `date "+%y%m%d%H%M"`
- Format: `YYMMDDHHMM_<descriptive_name>`
- Example: `2510241530_medusa_cart_migration_complete`
- Use concise but meaningful descriptions

## When to Write

- After completing a significant task or milestone
- Before ending a long working session
- When pausing complex work that will resume later
- After discovering important project insights
- When documenting architectural decisions

## Best Practices

- Keep entries focused and scannable
- Use bullet points for clarity
- Include concrete file paths and line numbers where relevant
- Cross-reference related memories or documentation
- Avoid duplicating information already in `@CLAUDE.md`

## After Saving Memory

**Always commit the memory to git** to preserve it permanently:

1. **Save the memory** using Serena's write_memory tool
2. **Commit the memory** using `/commit` command
   - The memory will be saved to `.serena/memories/<memory_name>.md`
   - Example commit message: `docs: Add <descriptive_name> memory`

**Workflow:**
- Claude Code custom slash command: `/commit`

**Why commit?**
- Preserves memory across different machines/environments
- Enables version control of project knowledge
- Ensures memory survives local cache clearing
- Creates audit trail of project decisions and progress
