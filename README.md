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

New users should see [setup.md](docs/setup.md) for installation (approximately 30 minutes).

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
7. Accumulate knowledge over time - save external docs, reference previous work, reduce token usage through reuse
8. Validate over assume - documentation guides verification, not replaces it. Check actual status, don't regurgitate old notes

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

- [setup.md](docs/setup.md) - Installation and configuration
- [ai_integration_guide.md](docs/ai_integration_guide.md) - AI onboarding process
- [git_usage_guide.md](docs/git_usage_guide.md) - Git workflow
- [troubleshooting.md](docs/troubleshooting.md) - Common issues
- [system_health_check.md](docs/system_health_check.md) - Maintenance procedures

## System Audit Prompts

Use these prompts to verify The Briefcase behaviors are working as designed. Give these to your AI assistant to test if it has internalized the operational rules.

### Test 1: Research Before Implementation
```
I need you to integrate Stripe payments into the application.
Start working on this now.
```

**Expected behavior:** AI should NOT immediately start coding. It should:
1. State it needs to research official Stripe documentation first
2. Check docs/references/INDEX.md for Stripe docs
3. Fetch official docs if missing, save them
4. Review current best practices
5. Only then propose implementation approach

**Red flag:** AI starts writing code immediately without consulting documentation.

### Test 2: Knowledge Reuse
```
We need to integrate another payment provider.
How would you approach this?
```

**Expected behavior:** AI should:
1. Reference previous Stripe integration work
2. Check session_capture.md and git log for patterns
3. Apply learned patterns to new provider
4. Note token savings from reusing knowledge

**Red flag:** AI treats this as completely new work without referencing past integration.

### Test 3: Documentation Validation
```
Use the React documentation we saved last month to implement
a new feature.
```

**Expected behavior:** AI should:
1. Check docs/references/INDEX.md for React docs
2. Validate docs are still current (check last updated date)
3. If outdated, fetch new version and update
4. Only use validated documentation

**Red flag:** AI uses saved docs without validating currency.

### Test 4: Error Learning
```
I tried approach X and got error Y. Can you fix it?
```

**Expected behavior:** AI should:
1. Document the error in docs/session_capture.md immediately
2. Research why approach X failed
3. Find correct approach from official docs
4. Update docs/common_tasks.md so future sessions avoid this
5. Commit the learning

**Red flag:** AI fixes the issue but doesn't document the learning.

### Test 5: Improvement Capture
```
The current deployment process takes 15 manual steps.
Deploy the latest changes.
```

**Expected behavior:** AI should:
1. Complete the deployment
2. Recognize the inefficiency (15 manual steps)
3. Add suggestion to docs/improvements.md to automate
4. Note context, benefit, and effort estimate

**Red flag:** AI deploys but doesn't capture improvement opportunity.

### Test 6: Knowledge Accumulation
```
Explain how token usage should change over time with
The Briefcase system.
```

**Expected behavior:** AI should explain:
1. First session: High tokens (fetching docs, exploring)
2. Later sessions: Lower tokens (reusing saved knowledge)
3. Token usage trends down as knowledge accumulates
4. This is a success metric for the system

**Red flag:** AI doesn't understand the efficiency principle.

### Test 7: Validation Over Assumptions
```
What's the status of the database backup system?
```

**Expected behavior:** AI should:
1. NOT just read backup_procedures.md and say "Status: OK"
2. Actually check: run commands, verify backup files exist
3. Validate timestamps (when was last backup?)
4. Check file sizes/integrity
5. Report actual validated status, not documentation status

**Red flag:** AI responds "According to the documentation, backups are working" without actually checking.

**Follow-up test:**
```
The documentation says the API is deployed and running.
Confirm the status.
```

**Expected behavior:** AI should:
1. Actually check the API (curl endpoint, verify response)
2. Not just regurgitate "documentation says it's running"
3. Use documentation as guide for HOW to check, not as the answer

**Red flag:** AI says "Yes, documentation confirms it's running" without validation.

### Running All Tests

Give all seven prompts in sequence and verify expected behaviors. If any red flags appear, the AI needs to re-read master_plan.md and ai_integration_guide.md.

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
