# System Health Check

**Purpose:** Weekly verification procedures to ensure The Briefcase is functioning correctly

**Frequency:** Weekly (recommended: Thursdays)

**Duration:** 10-15 minutes

**Last Run:** [YYYY-MM-DD]

---

## Checklist

### 1. Git Repository Health (5 min)

```bash
# Check working tree is clean
git status
# Expected: "nothing to commit, working tree clean"

# Check in sync with remote
git fetch origin
git status
# Expected: "Your branch is up to date with 'origin/main'"

# Check recent activity
git log --oneline -10
# Review: Recent commits make sense
```

**✅ PASS:** Working tree clean, synced with remote
**❌ FAIL:** Uncommitted changes or out of sync → Investigate

---

### 2. Run Validation Tests (3 min)

```bash
bash .test_suite/run_validation_tests.sh
```

**✅ PASS:** All tests pass
**⚠️ WARN:** Warnings present → Review and address
**❌ FAIL:** Tests fail → Fix issues

---

### 3. Documentation Freshness (2 min)

Check when key files were last updated:

```bash
ls -la master_plan.md todo.md improvements.md session_capture.md
```

**Review:**
- master_plan.md: Updated within 30 days?
- todo.md: Updated within 7 days?
- improvements.md: Reviewed within 14 days?
- session_capture.md: Current session or archived?

**Action:** Update stale documentation

---

### 4. todo.md Review (2 min)

```bash
cat todo.md
```

**Check:**
- [ ] High priority items still relevant?
- [ ] Completed items moved to archive?
- [ ] New work items added?
- [ ] Status emojis accurate?

**Action:** Update todo.md if needed

---

### 5. Credentials Audit (2 min)

```bash
cat .credentials/CREDENTIALS_INVENTORY.md
```

**Check:**
- [ ] Any credentials expiring soon?
- [ ] Any credentials need rotation?
- [ ] Inventory accurate and complete?
- [ ] No actual credentials in inventory?

**Action:** Rotate expiring credentials

---

### 6. Backup Verification (1 min)

**Verify:**
- [ ] Changes pushed to remote (GitHub)?
- [ ] Remote repository accessible?
- [ ] Local backups current (if applicable)?

```bash
git remote -v
git ls-remote origin
```

**✅ PASS:** Remote accessible, backups current
**❌ FAIL:** Remote issues → Investigate

---

### 7. Process Improvement Check (2 min)

Review improvements.md:

```bash
cat improvements.md
```

**Check:**
- [ ] New suggestions since last review?
- [ ] Any ready for triage?
- [ ] Follow-up needed on any items?

**Action:** Schedule weekly triage if suggestions pending

---

## Health Score

**Calculate score:**
- Each section: PASS = 1 point, WARN = 0.5 points, FAIL = 0 points
- Total: _____ / 7 points

**Interpretation:**
- 7 points: ✅ Excellent health
- 5-6 points: ⚠️ Good, minor issues
- 3-4 points: ⚠️ Attention needed
- <3 points: ❌ Requires immediate action

---

## Action Items from This Check

**Found Issues:**
1. [Issue 1] → [Action needed]
2. [Issue 2] → [Action needed]

**Follow-up:**
- [ ] [Action item 1]
- [ ] [Action item 2]

---

## Health Check History

| Date | Score | Notes | Action Taken |
|------|-------|-------|--------------|
| YYYY-MM-DD | 7/7 | All checks passed | None needed |
| YYYY-MM-DD | 5.5/7 | Doc freshness warning | Updated master_plan.md |

---

## Automation (Optional)

Create a weekly reminder:

```bash
# Add to crontab for automated reminder
# Every Thursday at 10 AM
0 10 * * 4 echo "Time for weekly Briefcase health check!" | mail -s "Health Check Reminder" you@example.com
```

---

**Last Updated:** [YYYY-MM-DD]
**Next Check Due:** [Next Thursday]
