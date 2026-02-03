# The Briefcase - Setup Guide

**Time Required:** 30 minutes

This guide will help you set up The Briefcase for your project.

---

## Prerequisites

Before starting, ensure you have:

- [ ] Git installed (`git --version`)
- [ ] GitHub account (or GitLab, Bitbucket, etc.)
- [ ] Text editor or IDE
- [ ] Basic Git knowledge (clone, commit, push)

---

## Step 1: Clone or Fork (5 minutes)

### Option A: New Project from Template

```bash
# Clone The Briefcase template
git clone https://github.com/YOUR_USERNAME/the-briefcase.git my-project-name
cd my-project-name

# Remove template Git history
rm -rf .git
git init
git branch -m main

# Create new repository on GitHub first, then:
git remote add origin https://github.com/YOUR_USERNAME/my-project-name.git
```

### Option B: Add to Existing Project

```bash
# In your existing project directory
git clone https://github.com/YOUR_USERNAME/the-briefcase.git .briefcase-template

# Copy template files (review each before copying)
cp .briefcase-template/master_plan.md ./
cp .briefcase-template/todo.md ./
cp .briefcase-template/improvements.md ./
# ... copy other templates as needed

# Remove template
rm -rf .briefcase-template
```

---

## Step 2: Customize master_plan.md (10 minutes)

Edit `master_plan.md` and customize these sections:

### Required Changes

1. **Project Name & Purpose**
   ```markdown
   # Master Plan - [YOUR PROJECT NAME]

   **Project Status:** [Phase X Active]
   **Owner:** [Your Name/Team]
   **Last Updated:** [Today's Date]
   ```

2. **Strategic Decisions**
   - List project-specific constraints and decisions
   - Document technology choices
   - Note what's not up for debate

3. **Key Systems & Access**
   - List systems/services in your project
   - Document access methods (URLs, ports, SSH)
   - Note credential locations (NOT the credentials themselves)

4. **Current Phase & Status**
   - Define your project phases
   - Mark current phase
   - List recent accomplishments

### Keep Generic

- Documentation methodology (3-level hierarchy)
- Session startup procedure
- Git workflow standards
- Reference table structure

---

## Step 3: Set Up Credential Management (5 minutes)

The Briefcase uses `.credentials/` directory for sensitive information.

### Create Credential Inventory

```bash
# Already done by template, but verify
cat .credentials/CREDENTIALS_INVENTORY.md
```

### Add Your Credentials

1. **List what credentials exist:**
   - Edit `.credentials/CREDENTIALS_INVENTORY.md`
   - Add: Name, Purpose, Location, Status
   - **Never add actual credential values!**

2. **Store actual credentials securely:**
   - Use password manager (1Password, Bitwarden, etc.)
   - Use OS keychain (macOS Keychain, Windows Credential Manager)
   - Use encrypted files outside Git repo
   - Use environment variables

3. **Verify .gitignore is working:**
   ```bash
   # Try to stage a test secret
   echo "test-secret" > .credentials/test.key
   git status
   # Should NOT show .credentials/test.key as untracked
   rm .credentials/test.key
   ```

---

## Step 4: Initialize todo.md (5 minutes)

Start with a clean slate:

```bash
# todo.md comes with examples - customize for your project
```

Add your first todos:

1. Current work items
2. Blockers or issues
3. Next milestones

Use categories from template:
- `fix` - Bug fixes
- `feature` - New functionality
- `improvement` - Enhance existing
- `documentation` - Doc updates
- `investigation` - Research needed

---

## Step 5: Create Initial Commit (2 minutes)

```bash
# Stage everything
git add .

# Initial commit
git commit -m "[project] Initialize project with The Briefcase framework"

# Push to remote
git push -u origin main
```

---

## Step 6: Test AI Integration (3 minutes)

### For Claude Code (CLI)

```bash
# Start Claude Code in your project directory
claude

# Claude Code will auto-load master_plan.md and context
```

### For Claude Desktop / Web

1. Open Claude Desktop or claude.ai
2. Start conversation: "I'm working on [project name]. Read master_plan.md, todo.md, and ai_integration_guide.md to understand the project."
3. Claude reads files via MCP or file upload
4. Verify Claude understands the project structure

### For GitHub Copilot (VS Code)

1. Open project in VS Code
2. Open `master_plan.md`
3. Use Copilot Chat: "@workspace explain the structure of this project"
4. Copilot will reference The Briefcase files

---

## Step 7: Run Validation Tests (optional, 2 minutes)

```bash
# Run test suite to verify setup
bash .test_suite/run_validation_tests.sh
```

Fix any issues reported.

---

## Post-Setup Checklist

Verify after setup:

- [ ] master_plan.md customized for your project
- [ ] .credentials/CREDENTIALS_INVENTORY.md lists credentials
- [ ] .gitignore prevents committing secrets
- [ ] Initial commit pushed to remote
- [ ] AI assistant can read and understand project
- [ ] todo.md contains first tasks
- [ ] Validation tests pass (if run)

---

## Next Steps

1. Read [ai_integration_guide.md](docs/ai_integration_guide.md) for AI integration
2. Review [git_usage_guide.md](docs/git_usage_guide.md) for commit standards
3. Start first session (AI reads master_plan.md + todo.md)
4. Work on first TODO item
5. Commit changes with clear message
6. Push to remote at session end

---

## Customization Tips

### Add Domain-Specific Documentation

Create Level 2 docs for your project domains:

```bash
# Examples (customize for your project):
touch INFRASTRUCTURE.md      # If managing infrastructure
touch API_GUIDE.md          # If building APIs
touch ARCHITECTURE.md       # System architecture
touch DEPLOYMENT.md         # Deployment procedures
```

Reference these in `master_plan.md` → "Reference These Documents First"

### Add Custom Validation Tests

Add project-specific tests to `.test_suite/`:

```bash
# Example: Verify API endpoints are documented
touch .test_suite/test_api_coverage.sh
```

---

## Troubleshooting

**Issue:** AI doesn't understand project structure
- **Fix:** Verify master_plan.md is clear and complete
- **Fix:** Explicitly ask AI to read master_plan.md

**Issue:** Credentials accidentally committed
- **Fix:** See [git_usage_guide.md](docs/git_usage_guide.md) → "Removing Sensitive Data"
- **Fix:** `git filter-branch` or `git filter-repo` to scrub history
- **Fix:** Rotate compromised credentials immediately

**Issue:** Documentation feels overwhelming
- **Fix:** Start minimal - just master_plan.md + todo.md
- **Fix:** Add more documentation as needed, not all at once

---

## Getting Help

- Open an issue on GitHub
- Check [troubleshooting.md](docs/troubleshooting.md)
- Read [ai_integration_guide.md](docs/ai_integration_guide.md) for AI-specific questions

