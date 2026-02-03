# Master Plan - [PROJECT NAME]

**Last Updated:** [YYYY-MM-DD]
**Project Status:** [Current Phase]
**Owner:** [Your Name/Team]

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
| **New AI joining this project?** | AI_INTEGRATION_GUIDE.md | Complete onboarding for any AI |
| **Brand new to this system?** | SETUP.md | Installation + first 30 minutes |
| **Lost? Need terminology help?** | GLOSSARY.md | Definitions and concepts |

### Finding Procedures
| Task Type | Reference Document | Purpose |
|-----------|-------------------|---------|
| **How do I do [task]?** | COMMON_TASKS.md | Quick procedures |
| **Something's broken** | TROUBLESHOOTING.md | Common issues with solutions |

### Working on Specific Domains
| Task Type | Reference Document | Purpose |
|-----------|-------------------|---------|
| **Starting a new session** | SESSION_STARTUP_GUIDE.md | Context loading, suggested actions |
| **What needs to be done?** | TODO.md | Persistent todo list |
| **What came up today?** | SESSION_CAPTURE.md | In-the-moment notes |
| **System improvement ideas** | IMPROVEMENTS.md | Capture suggestions, reviewed weekly |
| **Git/version control** | GIT_USAGE_GUIDE.md | Git workflow, commit standards |

**When starting a new session:**
1. Read master_plan.md (this file) - Get oriented
2. Read TODO.md - See what work is available
3. Choose direction or follow suggestions
4. Update SESSION_CAPTURE.md with progress
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
1. Read TODO.md for current work items
2. Check SESSION_CAPTURE.md for recent context
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
See [TODO.md](TODO.md) for full list. Top 3:
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
- **[TODO.md](TODO.md)** - Current work items
- **[IMPROVEMENTS.md](IMPROVEMENTS.md)** - Enhancement suggestions
- **[SESSION_CAPTURE.md](SESSION_CAPTURE.md)** - In-session notes
- **[AI_INTEGRATION_GUIDE.md](AI_INTEGRATION_GUIDE.md)** - AI onboarding

---

**Last Updated:** [YYYY-MM-DD]
**Next Review:** [When to review this document next]
