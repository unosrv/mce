---
description: Read memory from @CLAUDE.md and Serena
---

## Purpose

Restore context about the current state of the project and ongoing tasks by reading project documentation and Serena memories.

## What to Read

1. **@CLAUDE.md**
   - Project overview and guidelines
   - Migration status and priorities
   - Environment configuration requirements
   - Code standards and conventions

2. **Serena Memories**
   - Use `mcp__serena__list_memories` to see available memories
   - Read relevant memories based on current task context:
     - Migration progress snapshots (e.g., `medusa_migration_progress_*`)
     - Current status updates (e.g., `*_status_2025-*`)
     - Plan documents (e.g., `*_plan_*`)
     - Backend refactoring progress
     - Architecture decisions and documentation

## When to Use

- At the start of a new conversation or task
- When resuming work after an interruption
- When uncertain about project context or recent changes
- Before making significant architectural decisions
- When investigating existing implementations or patterns

## Process

1. Read `@CLAUDE.md` for project-wide context
2. List available Serena memories
3. Identify and read 2-5 most relevant memories based on task
4. Summarise key context before proceeding with work
