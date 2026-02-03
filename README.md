# The Briefcase

**AI Project Memory Framework**

> *"What's in the briefcase? Your project's context."*

## What is The Briefcase?

The Briefcase is a Git-based persistent memory system for AI-assisted projects. It addresses AI context loss between sessions by storing project knowledge, decisions, and progress in version-controlled documentation.

### Problems It Addresses

- AI assistants lose context between sessions
- Documentation scattered across files, chat logs, and wikis
- Time wasted re-explaining project context
- Forgotten decisions and rationale
- Multiple AIs working with inconsistent information

### Approach

- Use Git as single source of truth for project context
- Structure documentation in a consistent hierarchy
- Store decisions and rationale alongside code
- Enable any AI to load project context from documentation
- Maintain continuity across sessions through version control

## Quick Start

New users should see [setup.md](setup.md) for installation (approximately 30 minutes).

### Workflow

1. AI loads context from master_plan.md and todo.md
2. Make changes and track decisions
3. Commit with descriptive message
4. Push to remote repository

## Documentation Structure

### Three-Level Hierarchy

**Level 1: Navigation**
- master_plan.md provides project overview
- Links to relevant documentation
- Current status and phase information

**Level 2: Domain-Specific**
- Detailed procedures for specific domains
- Current state and progress tracking
- Examples: INFRASTRUCTURE.md, API_GUIDE.md

**Level 3: System-Specific**
- Implementation details
- Configuration files
- Integration documentation

### Core Files

| File | Purpose | Usage |
|------|---------|-------|
| master_plan.md | Project overview | Read at session start |
| todo.md | Work items | Read at session start |
| improvements.md | Suggestions | Review weekly |
| session_capture.md | Session notes | Update during work |
| ai_integration_guide.md | AI onboarding | Read when joining project |
| glossary.md | Terminology | Reference as needed |
| common_tasks.md | Procedures | Reference for routine tasks |

## Features

**Persistent Memory**
- Context preserved in Git between sessions
- No need to re-explain project each time
- History shows how project evolved

**Multi-AI Support**
- Works with Claude, Copilot, ChatGPT, or custom AIs
- All AIs reference same documentation
- Methodology consistent across tools

**Credential Management**
- Track what credentials exist and where they're stored
- Never commit actual secrets
- Inventory system without exposing values

**Validation**
- Test suite verifies documentation consistency
- Health checks identify issues
- Automated validation on commit

**Session Management**
- Clear start and end procedures
- Git commits mark session boundaries
- Clean handoffs between sessions

## Use Cases

- Software development: architecture, decisions, progress tracking
- Infrastructure management: systems, procedures, credentials
- Research: findings, references, methodology
- Business processes: procedures, decisions, workflows
- Multi-repo projects: unified view across repositories

## Design Principles

1. Version control everything except secrets
2. Single source of truth for all information
3. Keep documentation current
4. Clear navigation between documents
5. Readable by both humans and AIs
6. Include only necessary information

## Getting Started

### For New Projects

1. Clone this repository
2. Follow setup.md (30 minutes)
3. Customize master_plan.md
4. Read ai_integration_guide.md
5. Begin work

### For Existing Projects

1. Clone to new directory
2. Copy existing documentation into structure
3. Run validation: `bash .test_suite/run_validation_tests.sh`
4. Address any issues
5. Commit and begin using methodology

## Documentation

- [setup.md](setup.md) - Installation and configuration
- [ai_integration_guide.md](ai_integration_guide.md) - AI onboarding process
- [git_usage_guide.md](git_usage_guide.md) - Git workflow
- [troubleshooting.md](troubleshooting.md) - Common issues
- [system_health_check.md](system_health_check.md) - Maintenance procedures

## Requirements

- Git
- GitHub, GitLab, or similar (for remote storage)
- Text editor
- AI assistant (optional but recommended)

## License

MIT License - See [LICENSE](LICENSE)

## Contributing

Improvements welcome via issues or pull requests.

## Credits

Developed from patterns observed in AI-assisted project work.
