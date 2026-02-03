# Troubleshooting Guide

**Purpose:** Solutions to common issues with The Briefcase

**Last Updated:** [YYYY-MM-DD]

---

## Documentation Issues

### AI Can't Understand Project Structure
**Problem:** AI seems confused about project organization

**Solutions:**
1. Ensure master_plan.md is complete and current
2. Ask AI to read master_plan.md explicitly
3. Check that reference table links are correct
4. Verify documentation follows 3-level hierarchy

---

### Broken Links in Documentation
**Problem:** Links between documents don't work

**Solutions:**
```bash
# Run validation tests
bash .test_suite/run_validation_tests.sh

# Check for broken links
# Fix paths in markdown files
git commit -m "[fix] Repair broken documentation links"
```

---

### Documentation Out of Date
**Problem:** Docs don't reflect current state

**Solutions:**
1. Review all *.md files, check timestamps
2. Update "Last Updated" fields
3. Follow common_tasks.md for update procedures
4. Run validation tests after updates

---

## Git Issues

### Accidentally Committed Secrets
**Problem:** Credentials or secrets committed to Git

**IMMEDIATE ACTIONS:**
1. **DO NOT PUSH** if you haven't yet
2. Remove from latest commit:
   ```bash
   git rm --cached path/to/secret
   git commit --amend --no-edit
   ```
3. **ROTATE THE CREDENTIAL** immediately
4. See git_usage_guide.md for removing from history

---

### Merge Conflicts
**Problem:** Git pull shows merge conflicts

**Solutions:**
```bash
# 1. Check what conflicts
git status

# 2. Edit conflicted files
# Look for <<<<<<< HEAD and >>>>>>> markers
# Choose which version to keep

# 3. Stage resolved files
git add .

# 4. Complete merge
git commit

# 5. Push
git push
```

---

### Can't Push to Remote
**Problem:** `git push` fails with authentication error

**Solutions:**
1. Check remote URL: `git remote -v`
2. Verify credentials (SSH key or token)
3. Test access: `ssh -T git@github.com` (for GitHub)
4. Update credentials if needed

---

## Credential Management Issues

### Lost Credential
**Problem:** Can't find a credential

**Solutions:**
1. Check CREDENTIALS_INVENTORY.md for location
2. Check password manager/keychain
3. Follow "Recovery" instructions in inventory
4. If unrecoverable, regenerate per documentation

---

### .gitignore Not Working
**Problem:** Sensitive files showing as untracked

**Solutions:**
```bash
# 1. Verify .gitignore rules
cat .gitignore | grep "pattern"

# 2. If files were previously tracked:
git rm --cached path/to/file

# 3. Commit
git commit -m "[fix] Remove tracked sensitive file"

# 4. Verify
git status  # Should not show sensitive files
```

---

## Validation Test Failures

### Tests Fail on Fresh Clone
**Problem:** Running tests immediately after cloning fails

**Expected:** Template needs customization

**Solutions:**
1. Follow setup.md to customize template
2. Fill in [placeholder] values in master_plan.md
3. Re-run tests after customization

---

### False Positive Test Failures
**Problem:** Tests fail but everything seems fine

**Solutions:**
1. Review test output carefully
2. Check if test expectations match your project
3. Adjust test thresholds in run_validation_tests.sh
4. Add exceptions for your specific setup

---

## AI Integration Issues

### AI Doesn't Remember Previous Sessions
**Problem:** AI forgets context between sessions

**Expected Behavior:** This is normal - The Briefcase uses Git as memory

**Solutions:**
1. AI must read master_plan.md + todo.md at session start
2. Check session_capture.md for recent context
3. Ensure changes were committed before ending last session
4. Pull latest changes: `git pull`

---

### Multiple AIs Conflicting
**Problem:** Different AIs making inconsistent changes

**Solutions:**
1. All AIs must read latest documentation: `git pull`
2. Follow ai_integration_guide.md procedures
3. Use session_capture.md to note conflicts
4. Establish clear ownership if needed

---

## Setup Issues

### Missing Required Files
**Problem:** Validation tests report missing files

**Solutions:**
```bash
# Check what's missing
bash .test_suite/run_validation_tests.sh test_required_files

# Create missing files from templates
# Or copy from The Briefcase template repository
```

---

### Can't Run Validation Tests
**Problem:** Permission denied or script not found

**Solutions:**
```bash
# Make script executable
chmod +x .test_suite/run_validation_tests.sh

# Run from project root
cd /path/to/project
bash .test_suite/run_validation_tests.sh
```

---

## Getting More Help

**Still stuck?**
1. Review [README.md](README.md) for overview
2. Check [ai_integration_guide.md](docs/ai_integration_guide.md) for AI-specific help
3. Review [git_usage_guide.md](docs/git_usage_guide.md) for Git issues
4. Open an issue on The Briefcase GitHub repository

---

**Last Updated:** [YYYY-MM-DD]
