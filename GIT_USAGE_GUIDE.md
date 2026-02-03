# Git Usage Guide

**Purpose:** Git workflow, commit standards, and best practices for The Briefcase

**Last Updated:** [YYYY-MM-DD]

---

## Commit Message Standards

### Format
```
[category] Brief description of change

Optional: Longer explanation if needed
```

### Categories
- `[doc]` - Documentation changes
- `[config]` - Configuration updates
- `[fix]` - Bug fixes
- `[feature]` - New features
- `[refactor]` - Code refactoring
- `[test]` - Testing
- `[cleanup]` - Code cleanup
- `[project]` - Project planning/setup

### Examples
```bash
git commit -m "[doc] Update TODO.md with new tasks"
git commit -m "[fix] Correct broken link in master_plan.md"
git commit -m "[feature] Add validation test for credentials"
```

---

## Daily Workflow

### Session Start
```bash
# 1. Pull latest changes
git pull

# 2. Check status
git status

# 3. Load context (AI reads docs)
# Read: master_plan.md, TODO.md, SESSION_CAPTURE.md
```

### During Work
```bash
# Commit frequently at stable points
git add .
git commit -m "[category] What you did"
```

### Session End
```bash
# 1. Update SESSION_CAPTURE.md
# 2. Mark completed TODOs
# 3. Final commit
git add .
git commit -m "[doc] Session wrap-up: [summary]"

# 4. Push to remote
git push origin main

# 5. Verify clean
git status  # Should show "nothing to commit, working tree clean"
```

---

## Safety Rules

### Never Commit
- Credentials (passwords, API keys, tokens)
- SSH keys
- Certificates
- Database files (*.db)
- Log files (*.log)
- .env files

### Always
- Review changes before committing: `git diff`
- Write clear commit messages
- Commit at stable points
- Push regularly to remote

---

## Removing Sensitive Data

### If you accidentally committed a secret:

**Option 1: Remove from latest commit (not yet pushed)**
```bash
# Remove file
git rm --cached path/to/secret-file

# Amend commit
git commit --amend --no-edit
```

**Option 2: Remove from history (already pushed)**
```bash
# Using git filter-repo (recommended)
git filter-repo --path path/to/secret --invert-paths

# Force push
git push --force origin main

# CRITICAL: Rotate the compromised credential immediately!
```

---

## Branching Strategy

For simple projects, main branch is sufficient.

For complex projects:
```bash
# Create feature branch
git checkout -b feature/new-feature

# Work on feature
# Commit changes

# Merge back to main
git checkout main
git merge feature/new-feature
git push origin main
```

---

## Common Issues

### Merge Conflicts
```bash
# Pull shows conflicts
git pull

# Edit conflicted files (look for <<<<<<< markers)
# Resolve conflicts

# Stage resolved files
git add .

# Complete merge
git commit

# Push
git push
```

### Diverged Branches
```bash
# If local and remote diverged
git pull --rebase  # Rebase local commits on top of remote

# Or
git pull --no-rebase  # Create merge commit
```

---

**Last Updated:** [YYYY-MM-DD]
