# AI Integration Guide

**Purpose:** Instructions for AI assistants working with The Briefcase methodology.

**Reading Time:** 5-10 minutes

---

## Overview

This guide explains how to work with The Briefcase framework. Read this document before beginning work on the project.

---

## What is The Briefcase?

The Briefcase is a **Git-based persistent memory system** that solves the context loss problem between AI sessions. All project knowledge, decisions, and progress are stored in version-controlled documentation that you'll read at the start of each session.

---

## Your Role

You are an AI assistant helping with this project. Your job is to:

1. **Load context** at session start by reading key documentation files
2. **Work on tasks** from todo.md or user requests
3. **Update documentation** as work progresses
4. **Commit changes** to Git before ending sessions
5. **Maintain consistency** with the established methodology

---

## Session Startup Procedure

### Every Session, Follow These Steps:

**Step 1: Load Context (2-3 minutes)**

Read these files in priority order:

1. **master_plan.md** (REQUIRED)
   - Project overview
   - Current status
   - Reference table
   - Strategic decisions

2. **todo.md** (REQUIRED)
   - Current work items
   - Priorities
   - Blockers

3. **session_capture.md** (if exists)
   - Recent observations
   - In-progress context
   - Blockers from last session

4. **improvements.md** (optional)
   - Pending suggestions
   - Enhancement ideas

5. **Domain-specific docs** (as needed)
   - Read Level 2 docs for your task domain
   - Check master_plan.md reference table

**Step 2: Confirm Understanding**

After reading, confirm you understand:
- What this project does
- Current phase and status
- Available work items
- Strategic constraints

**Step 3: Choose Direction**

Either:
- Work on specific TODO item
- Respond to user's request
- Suggest next logical step based on context

---

## Documentation Hierarchy (How to Navigate)

The Briefcase uses 3 levels of documentation:

### Level 1: Navigation (master_plan.md)
- **Purpose:** High-level overview, entry point
- **Read:** Every session start
- **Contains:** Just enough to navigate to the right place

### Level 2: Domain-Specific (e.g., INFRASTRUCTURE.md, API_GUIDE.md)
- **Purpose:** Detailed procedures, current state
- **Read:** When working in that domain
- **Contains:** Everything needed for that domain
- **Update:** When domain state changes

### Level 3: System-Specific (config files, READMEs)
- **Purpose:** Granular technical details
- **Read:** When implementing specific changes
- **Contains:** Implementation specifics
- **Update:** When system configuration changes

**Navigation Rule:** Always start at master_plan.md, follow references to Level 2, then Level 3 as needed.

---

## Core Files Reference

| File | Purpose | Read When | Update When |
|------|---------|-----------|-------------|
| **master_plan.md** | Project overview | Every session | Major changes |
| **todo.md** | Work items | Every session | Add/complete tasks |
| **improvements.md** | Suggestions | Weekly review | New ideas emerge |
| **session_capture.md** | In-session notes | During work | During work |
| **glossary.md** | Terminology | When confused | New terms added |
| **common_tasks.md** | Procedures | When doing task | New procedures |
| **git_usage_guide.md** | Git workflow | When committing | Workflow changes |
| **troubleshooting.md** | Problem-solving | When stuck | New issues solved |
| **references/INDEX.md** | Saved external docs | Before fetching docs | When saving new docs |

---

## Git Workflow

### Commit Standards

**When to commit:**
- After completing a discrete unit of work
- Before ending a session
- After major changes
- When reaching a stable state

**Commit message format:**
```
[category] Brief description of change

Optional: More detailed explanation if needed
```

**Categories:**
- `[doc]` - Documentation changes
- `[config]` - Configuration updates
- `[fix]` - Bug fixes
- `[feature]` - New features
- `[refactor]` - Code refactoring
- `[test]` - Testing
- `[cleanup]` - Code cleanup

**Examples:**
- `[doc] Update todo.md with new tasks from session`
- `[fix] Correct typo in API endpoint documentation`
- `[feature] Add validation script for credential inventory`

### Session End Procedure

Before ending every session:

1. **Update session_capture.md** with any observations
2. **Update todo.md** status (mark completed items)
3. **Commit all changes:**
   ```bash
   git add .
   git commit -m "[doc] Session wrap-up: [what was accomplished]"
   ```
4. **Push to remote:**
   ```bash
   git push origin main
   ```
5. **Verify clean working tree:**
   ```bash
   git status  # Should show "nothing to commit, working tree clean"
   ```

---

## Working with todo.md

### Task Status Values
- 📋 **Scheduled** - Has a date, not started
- 🔄 **Recurring** - Happens on schedule
- 🏗️ **In Progress** - Actively being worked
- ✅ **Completed** - Done, ready to archive

### Task Categories
- `fix` - Bug fixes
- `feature` - New functionality
- `improvement` - Enhance existing
- `documentation` - Doc updates
- `investigation` - Research needed
- `maintenance` - Regular upkeep

### When Working on a Task

1. **Start:** Note task ID, read full description
2. **During:** Update session_capture.md with progress
3. **Complete:** Mark task as ✅ Completed in todo.md
4. **Document:** If approach or solution is notable, add to relevant Level 2 doc

---

## Working with improvements.md

### When to Add Suggestions

During work, if you notice:
- A better way to do something
- Documentation that could be improved
- A useful new feature
- A process inefficiency

Add it to improvements.md with:
- **Context:** What prompted this idea
- **Benefit:** Why it would help
- **Effort:** Rough estimate (Low/Medium/High)
- **Status:** Captured, awaiting triage

**Don't implement immediately** - let the weekly triage process decide.

---

## Documentation Standards

### Writing Style
- **Concise:** Necessary information only
- **Clear:** Avoid ambiguity
- **Current:** Update immediately when things change
- **Timestamped:** Note "Last Updated: YYYY-MM-DD"

### Single Source of Truth
- Never duplicate information across files
- Reference other docs instead of copying
- Keep related information together

### Markdown Formatting
- Use headers for structure (##, ###)
- Use tables for structured data
- Use code blocks for commands
- Use **bold** for emphasis
- Use `code` for technical terms

---

## Credential Management

### CRITICAL: Never Commit Secrets

The `.credentials/` directory is gitignored. It exists to document **what** credentials exist and **where** they're stored, NOT the credential values themselves.

### Working with Credentials

**DO:**
- Update `.credentials/CREDENTIALS_INVENTORY.md` with credential metadata
- Document: Name, Purpose, Location (password manager, keychain, etc.)
- Note status (Active, Expired, Needs Rotation)

**DON'T:**
- Write actual passwords, keys, tokens in any file
- Commit files containing secrets
- Store secrets in Git history

**If secrets are accidentally committed:**
- Stop immediately
- Follow git_usage_guide.md → "Removing Sensitive Data"
- Rotate compromised credentials

---

## Strategic Decisions

The project has documented **Strategic Decisions** in master_plan.md. These are:
- Established constraints
- Technology choices
- Methodological decisions
- Not up for re-debate

**Your job:** Work within these constraints, don't question them unless user explicitly asks for alternatives.

---

## Multi-AI Coordination

You might not be the only AI working on this project. Stay coordinated:

### Rules for Coordination
1. **Git is the source of truth** - Always pull latest before starting
2. **Read before writing** - Check existing docs before creating new ones
3. **Follow established patterns** - Maintain consistency with existing documentation
4. **Document changes** - Update relevant files so other AIs understand

### If You Notice Conflicts
- Note in session_capture.md
- Ask user for clarification
- Don't silently override another AI's work

---

## AI-Specific Tips

### For Claude (Code/Desktop)
- Use MCP servers if available for system access
- Read full context at session start
- Follow session startup procedure strictly
- Commit frequently

### For GitHub Copilot (VS Code)
- Use `@workspace` to reference project context
- Read master_plan.md in editor for context
- Follow commit message standards
- Check todo.md for current work items

### For ChatGPT / Web-based AIs
- Request file contents from user if you can't read directly
- Maintain context by referencing conversation history
- Ask user to paste key files at session start
- Remind user to commit your changes

### For Custom AIs
- Follow the session startup procedure
- Use Git as memory layer
- Read→Work→Document→Commit cycle
- Stay aligned with methodology

---

## Common Pitfalls to Avoid

1. **Skipping context loading** - Always read master_plan.md + todo.md
2. **Creating duplicate docs** - Check if documentation exists first
3. **Ignoring strategic decisions** - Work within established constraints
4. **Not committing changes** - Commit before session ends
5. **Committing secrets** - Never commit credentials
6. **Working on wrong priority** - Check todo.md for priorities
7. **Over-engineering** - Keep solutions simple and focused

---

## Getting Unstuck

**If you're confused about the project:**
- Re-read master_plan.md
- Check glossary.md for terminology
- Ask user for clarification

**If you're not sure what to work on:**
- Check todo.md for high priority items
- Ask user what they need
- Suggest next logical step based on current phase

**If documentation is unclear:**
- Note issue in session_capture.md
- Add to improvements.md
- Ask user for clarification
- Update documentation once clarified

---

## Integration Checklist

Integration is complete when you can:

- Start a session and understand project context within 3 minutes
- Navigate the 3-level documentation hierarchy
- Update documentation during work
- Write clear commit messages
- Maintain consistency with established patterns
- Work without requiring context re-explanation each session

---

## Reference

**For methodology questions:**
- This guide
- git_usage_guide.md for Git workflow
- troubleshooting.md for common issues
- User if information is unclear

**For project questions:**
- master_plan.md for overview
- Level 2 documentation for domain details
- session_capture.md for recent context
- User if information is not documented

---

## Starting Work

1. Read master_plan.md for project understanding
2. Read todo.md for available work
3. Select a task
4. Update session_capture.md with progress
5. Complete the work following methodology
6. Commit changes before ending session
