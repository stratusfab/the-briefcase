# Common Tasks

**Purpose:** Quick reference for frequently performed procedures

**Last Updated:** [YYYY-MM-DD]

---

## Git Operations

### Start a New Session
```bash
cd /path/to/project
git pull  # Get latest changes
# AI: Read master_plan.md + todo.md
```

### End a Session
```bash
git add .
git commit -m "[category] Description of changes"
git push origin main
git status  # Verify clean working tree
```

### Check Repository Status
```bash
git status              # Current changes
git log --oneline -10   # Recent commits
git remote -v           # Remote repositories
```

---

## Documentation Tasks

### Update master_plan.md
1. Edit master_plan.md
2. Update "Last Updated" timestamp
3. Commit: `git commit -m "[doc] Update master plan with [change]"`

### Add New Todo Item
1. Edit todo.md
2. Add under appropriate priority section
3. Include: Category, Priority, Status, Description
4. Commit: `git commit -m "[doc] Add TODO: [brief description]"`

### Weekly Health Check
```bash
# Run validation tests
bash .test_suite/run_validation_tests.sh

# Check all repos
git status  # Should be clean

# Review documentation timestamps
ls -la *.md  # Check modification dates
```

---

## Credential Management

### Add New Credential
1. Store actual credential in password manager
2. Edit `.credentials/CREDENTIALS_INVENTORY.md`
3. Add metadata (name, purpose, location, status)
4. Never commit actual credential values
5. Commit inventory: `git commit -m "[doc] Add credential inventory entry"`

### Rotate Credential
1. Generate new credential
2. Update all systems using old credential
3. Update inventory with new "Last Updated" date
4. Revoke/delete old credential
5. Test access with new credential

---

## Project-Specific Tasks

[Add your common procedures here]

### Example: Deploy Changes
```bash
# 1. Commit changes
git add .
git commit -m "[feature] Description"

# 2. Push to remote
git push origin main

# 3. Deploy (customize for your project)
# ./deploy.sh
```

---

**Last Updated:** [YYYY-MM-DD]
