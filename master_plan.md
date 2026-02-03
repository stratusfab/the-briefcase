# Master Plan - [PROJECT NAME]

**Last Updated:** [YYYY-MM-DD]
**Project Status:** [Current Phase]
**Owner:** [Your Name/Team]

---

## AI Session Startup

**You are starting a new session.** Follow this procedure:

### 0. Verify Repository (FIRST - Do This Once)

**Before doing anything else, check if you're in the template repository:**

```bash
git remote get-url origin 2>/dev/null || echo "No remote"
```

**If the remote URL contains `stratusfab/the-briefcase` or `the-briefcase.git`:**

⚠️ **STOP AND ASK USER:**

"I notice this appears to be The Briefcase template repository itself.

Are we:
A) Setting up a NEW project (you should run setup first - see README.md)
B) Contributing improvements to The Briefcase template itself
C) Something else?

The template repository should not be used directly for project work. See README.md 'Getting Started' for correct workflow."

**Wait for user response before proceeding.**

**If the remote URL is different (your project repo) OR no remote exists yet:**
- ✅ Correct - this is a project repository, continue with startup
- You only need to do this check once per session

### 1. Load Context
Read these files in order:
- This file (master_plan.md) - you're reading it now
- docs/todo.md - see what work is available
- docs/session_capture.md - check for recent context (if it exists)

### 2. Understand the Project
From this file, identify:
- Project name and mission
- Current phase and status
- Strategic decisions (constraints you must work within)
- Key systems and how to access them

### 3. Report to User
Provide a concise report with:
- **Project:** Name and current phase
- **Your role:** What you can do (based on access available)
- **Priority work:** Top 3 items from todo.md
- **Status:** Any blockers or issues noted in session_capture.md
- **Ready:** Confirm you're ready to work or ask what they want to focus on

### 4. Get Direction
Either:
- Work on specific task the user mentions
- Suggest working on highest priority item from todo.md
- Ask user what they want to focus on

### 5. Operational Rules (Read These)

**When you need credentials:**
- Check `.credentials/CREDENTIALS_INVENTORY.md` for credential locations
- That file tells you WHERE credentials are stored, not the actual values
- Ask user for credential if you need it
- NEVER commit actual credentials to git

**When asked for status or validation:**
- NEVER give answers based solely on what documentation says
- Documentation provides breadcrumbs for HOW to validate - follow them
- Actually CHECK: run commands, verify files exist, test connections, validate timestamps
- If you can't validate: say so clearly, don't assume documentation is current
- Example: "Is backup working?" → Check backup files exist, not just read "Status: OK" from notes
- No pseudo-action: Don't pretend to check when you're just reading old notes
- Documentation tells you WHERE to look and HOW to verify, not WHAT the answer is

**When you hit an error or make a direction change:**
1. Document it immediately in docs/session_capture.md:
   - What you tried
   - Why it didn't work
   - What you're doing instead
2. After solving, update relevant documentation so next session doesn't repeat the mistake:
   - If it's a known limitation → update this file under "Known Issues"
   - If it's a better approach → update docs/common_tasks.md
   - If it affects strategy → update "Strategic Decisions" section
3. Commit the documentation update with clear message

**When you complete work:**
- Update docs/todo.md (mark items complete)
- Update docs/session_capture.md with what was accomplished
- Commit changes with clear message: `[category] Description`
- Push to remote: `git push origin main`

**When you fetch external documentation:**
- Save it in docs/references/ with source URL and fetch date
- Add entry to docs/references/INDEX.md
- Never fetch the same documentation twice without validation

**When you need documentation:**
1. Check docs/references/INDEX.md first - do we already have it?
2. If yes: Validate it's still current (check date noted in INDEX.md)
3. If outdated: Fetch new, update local copy and INDEX.md
4. If missing: Fetch, save for future use, add to INDEX.md

**Before implementing any solution:**
1. Research official documentation FIRST - never code based on assumptions or hallucinated knowledge
2. Check docs/references/INDEX.md for official docs related to the task
3. If missing: Fetch official/current documentation, save it, then review thoroughly
4. Verify the approach is current (check for deprecated methods, outdated patterns)
5. Document research findings in docs/session_capture.md before starting
6. ONLY THEN begin implementation based on verified official guidance
7. Priority order: Official docs > Saved references > Verified blog posts > Never guess

**When solving a task:**
- Check session_capture.md and git log for similar past tasks
- Reference previous approaches rather than starting from scratch
- Document your solution clearly so future sessions can reference it
- Success metric: Token usage should decline over time as knowledge accumulates

**That's it. You now have full context. Everything else in this file is reference material.**

---

## Quick Project Overview

**Mission:** [One sentence describing what this project does or aims to achieve]

**Core Principle:** [Fundamental rule or philosophy guiding this project]

**Current Phase:** [Phase Name - Status]

---

## Reference Documents by Task Type

### Getting Started
| Task Type | Reference Document | Purpose |
|-----------|-------------------|---------|
| **New AI joining this project?** | ai_integration_guide.md | Complete onboarding for any AI |
| **Brand new to this system?** | setup.md | Installation + first 30 minutes |
| **Lost? Need terminology help?** | glossary.md | Definitions and concepts |

### Finding Procedures
| Task Type | Reference Document | Purpose |
|-----------|-------------------|---------|
| **How do I do [task]?** | common_tasks.md | Quick procedures |
| **Something's broken** | troubleshooting.md | Common issues with solutions |

### Working on Specific Domains
| Task Type | Reference Document | Purpose |
|-----------|-------------------|---------|
| **What needs to be done?** | todo.md | Persistent todo list |
| **What came up today?** | session_capture.md | In-the-moment notes |
| **System improvement ideas** | improvements.md | Capture suggestions, reviewed weekly |
| **Git/version control** | git_usage_guide.md | Git workflow, commit standards |
| **External docs saved locally** | references/INDEX.md | Reusable documentation to reduce token usage |

**When starting a new session:**
0. Verify repository (check git remote - are we in template or project repo?)
1. Read master_plan.md (this file) - Get oriented
2. Read todo.md - See what work is available
3. Choose direction or follow suggestions
4. Update session_capture.md with progress
5. Commit changes before ending session

---

## Strategic Decisions

These decisions have been made and shape how this project operates:

1. **[Decision 1]** - [Why this matters, what it constrains]
2. **[Decision 2]** - [Why this matters, what it constrains]
3. **[Decision 3]** - [Why this matters, what it constrains]

These are not up for discussion — they define how work gets done here.

---

## 📋 Documentation Structure & Methodology

### Hierarchical Documentation Model

Documentation is organized in 3 levels, each serving a specific purpose:

**LEVEL 1: Navigation & Overview (master_plan.md)**
- High-level view of all systems
- Access information
- Reference table for where to find domain-specific info
- **Contains:** Just enough to navigate to the right place
- **Audience:** AI starting a new session

**LEVEL 2: Domain-Specific Context (e.g., INFRASTRUCTURE.md, API_GUIDE.md)**
- Current state of that domain
- Detailed procedures and workflows
- What's been completed
- What needs to be done
- **Contains:** Everything needed to work within that domain
- **Audience:** AI working on specific tasks

**LEVEL 3: System-Specific Details (e.g., config files, READMEs)**
- Granular technical details
- File organization
- Integration-specific procedures
- **Contains:** Implementation specifics
- **Audience:** AI implementing specific changes

### Core Standards

1. **Concise yet human-readable** - Necessary info only, no noise
2. **Current and correct** - Updated when anything changes
3. **Single source of truth** - No duplicate info across documents
4. **Navigable** - Clear references between levels
5. **Git versioned** - All documentation under revision control
6. **Timestamp-aware** - Each doc shows when it was last updated
7. **Validation-oriented** - Document HOW to verify status, not just what status was. Provide commands, file paths, validation procedures so AI can CHECK rather than assume

### When to Create/Update Documentation

**Create new documentation:**
- First time accessing a new system
- First time working with a new service type
- When a domain becomes complex enough to need its own guide

**Update documentation:**
- After significant work is completed
- When access methods change
- When status changes (e.g., "complete" vs. "in progress")
- When procedures are proven to work/fail

**Delete documentation:**
- When it becomes obsolete/superseded
- When it's duplicate information
- When it's noise that doesn't serve navigation or context

---

## Current Status and Recovery

**Last Work Session:** [YYYY-MM-DD]
**Current Phase:** [Phase Name]
**Current Focus:** [What you're working on]

**If disconnected, resume by:**
1. Read todo.md for current work items
2. Check session_capture.md for recent context
3. Check git logs for recent commits
4. Pick up where you left off

---

## Key Systems and Access

### [System 1 Name]
- **Purpose:** [What this system does]
- **Access:** [How to access - URL, SSH, etc.]
- **Documentation:** [Link to Level 2 doc]
- **Status:** [Active/Planned/Deprecated]

### [System 2 Name]
- **Purpose:** [What this system does]
- **Access:** [How to access]
- **Documentation:** [Link to Level 2 doc]
- **Status:** [Active/Planned/Deprecated]

### [Add more systems as needed]

---

## Important Mappings

### Git Repositories
| System | URL | Status | Location |
|--------|-----|--------|----------|
| [Repo 1] | [GitHub URL] | Active ✅ | [Local path] |
| [Repo 2] | [GitHub URL] | Active ✅ | [Local path] |

### Commit Message Categories
- `[doc]` - Documentation changes
- `[config]` - Configuration updates
- `[fix]` - Bug fixes
- `[feature]` - New features
- `[refactor]` - Code refactoring
- `[test]` - Testing
- `[cleanup]` - Code cleanup

---

## Project Phases

### ✅ Phase 1: [Phase Name] (COMPLETE)
- [x] [Milestone 1]
- [x] [Milestone 2]
- [x] [Milestone 3]

### ⏳ Phase 2: [Phase Name] (ACTIVE)
- [x] [Completed milestone]
- [ ] [In progress milestone]
- [ ] [Planned milestone]

### 📚 Phase 3: [Phase Name] (PLANNED)
- [ ] [Future milestone]
- [ ] [Future milestone]

---

## Technology Stack

**Core:**
- [Technology 1] - [Purpose]
- [Technology 2] - [Purpose]

**Infrastructure:**
- [Infrastructure 1] - [Purpose]
- [Infrastructure 2] - [Purpose]

**Development:**
- [Tool 1] - [Purpose]
- [Tool 2] - [Purpose]

---

## Known Issues and Limitations

### Blockers
1. **[Blocker 1]** - [Description, impact]

### Risks (Mitigated)
- [Risk] - [How it's mitigated]

### TODO (High Priority)
See [todo.md](docs/todo.md) for full list. Top 3:
1. [High priority item 1]
2. [High priority item 2]
3. [High priority item 3]

---

## Security Notes

### Never Commit
- Secrets, API keys, tokens, passwords
- SSH keys, certificates
- Database files (*.db)
- Log files (*.log)
- `.env` files with credentials

### Best Practices
- Always review changes before committing
- Use meaningful commit messages
- Keep repositories private (if needed)
- Test changes before production
- Commit baseline BEFORE making changes

---

## Next Steps

**IMMEDIATE:**
1. [Next step 1]
2. [Next step 2]

**SHORT TERM:**
1. [Short term goal 1]
2. [Short term goal 2]

**MEDIUM TERM:**
1. [Medium term goal 1]
2. [Medium term goal 2]

---

## Updating This File

**When to Update:**
- New systems added
- Repository URLs change
- Phase status changes
- Strategic decisions made
- Access information changes

**How to Update:**
```bash
# 1. Edit this file
nano master_plan.md

# 2. Make your changes

# 3. Commit and push
git add master_plan.md
git commit -m "[doc] Updated master plan with [change]"
git push origin main
```

---

## Related Documents

- **[README.md](README.md)** - Project overview and philosophy
- **[todo.md](docs/todo.md)** - Current work items
- **[improvements.md](docs/improvements.md)** - Enhancement suggestions
- **[session_capture.md](docs/session_capture.md)** - In-session notes
- **[ai_integration_guide.md](docs/ai_integration_guide.md)** - AI onboarding

---

**Last Updated:** [YYYY-MM-DD]
**Next Review:** [When to review this document next]
