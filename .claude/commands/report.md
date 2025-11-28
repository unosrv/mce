---
description: Generate a detailed report of latest tasks or tests
---

## Report Generation Command

**Directory Path**: $ARGUMENTS (default: `dev-doc/report/`)

### Instructions

1. **Determine Output Directory**
   - If argument provided: Use the given directory path
   - If no argument: Use `dev-doc/report/`
   - Ensure the directory exists (create if necessary)

2. **Generate Timestamp**
   - Run: `date "+%y%m%d%H%M"`
   - Use the EXACT output - never estimate or round

3. **Analyze Recent Activity**
   - Review the conversation history for completed tasks
   - Identify tests that were run and their results
   - Note any code changes, bug fixes, or feature implementations
   - Gather error messages and how they were resolved

4. **Create Report Document**
   - **File Name Format**: `YYMMDDHHMM_[DESCRIPTIVE_NAME].md`
     - Use the timestamp from step 2
     - Choose a descriptive name based on the main task/topic (e.g., `2411281530_form_validation_tests.md`)

   - **Report Structure**:
     ```markdown
     # Report: [Brief Title]

     **Date**: [Full date and time]
     **Author**: Claude Code

     ## Summary
     [Brief overview of what was accomplished]

     ## Tasks Completed
     - [Task 1]
     - [Task 2]
     ...

     ## Test Results (if applicable)
     - [Test name]: [Pass/Fail]
     - [Details of any failures]

     ## Code Changes
     - [File]: [Description of change]

     ## Issues Encountered
     - [Issue description and resolution]

     ## Next Steps (if any)
     - [Recommended follow-up tasks]
     ```

5. **Save Report**
   - Write the report to the determined directory with the generated filename
   - Confirm the file location to the user

### Notes
- Reports should be written in English (per project guidelines)
- Focus on factual, objective information
- Include relevant file paths and line numbers where applicable
