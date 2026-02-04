# Security Lessons Learned

**Date:** 2026-02-04
**Incident:** Credentials exposed in git repository
**Severity:** HIGH
**Status:** Resolved

---

## What Happened

A credentials inventory markdown file was created with the INTENTION of documenting WHERE credentials are stored, but accidentally included ACTUAL credential values instead of just references to storage locations.

**The Mistake:**
```markdown
# WRONG - Actual credential in file
| API Key | sk-proj-abc123xyz... |
```

**Should Have Been:**
```markdown
# CORRECT - Reference to where it's stored
| API Key Location | 1Password → Dev Vault → API Keys |
| How to Access    | `op read 'op://Dev/API Key'`      |
```

---

## Root Cause

**Ambiguous field naming** in the markdown table format:
- Field named "API Key" could mean "the key itself" OR "where the key is stored"
- When adding new credentials, the wrong interpretation was used
- Actual values were added instead of storage location references

---

## Impact

**6 credentials exposed in git history:**
1. Cloudflare DDNS API Key
2. Wyze Home Assistant Integration API Key
3. OpenAI API Key (Mealie)
4. Home Assistant Token
5. BookStack APP_KEY
6. Frigate NVR Admin Password Hash

**All must be rotated** (generate new ones, revoke old).

---

## What Was Done

### Immediate Response (2026-02-04)

1. **Extracted credentials to safe storage:**
   - Created individual files in `.claude/` directory (gitignored)
   - Credentials no longer only in git-tracked files

2. **Cleaned the inventory file:**
   - Removed all actual credential values
   - Replaced with references to storage locations

3. **Added protections:**
   - Updated `.gitignore` to exclude credential files
   - Created pre-commit hook to scan for credential patterns
   - Committed and pushed clean version

4. **Created rotation task list:**
   - All 6 credentials marked for rotation
   - Documented steps for each rotation

### Long-term Prevention

1. **Pre-commit hook** (`.git/hooks/pre-commit`):
   - Scans staged files for credential patterns
   - BLOCKS commit if potential credentials found
   - Uses regex patterns (NOT actual values)

2. **Clear documentation** (`.credentials/README.md`):
   - Explicitly states what NEVER goes in this directory
   - Shows correct format for documenting credentials
   - Provides examples

3. **Clearer field names:**
   - Changed: `API Key` → `API Key Location`
   - Changed: `Token` → `Token Location`
   - Added: `How to Access` field

---

## Lessons Learned

### 1. Ambiguous Documentation is Dangerous

**Problem:** Field name "API Key" was ambiguous
**Solution:** Use explicit names like "API Key Location" or "Stored In"

### 2. Examples Matter

**Problem:** No clear examples showing WHAT NOT TO DO
**Solution:** Show both GOOD and BAD examples in documentation

### 3. Automation Prevents Mistakes

**Problem:** No automated scanning before commit
**Solution:** Pre-commit hook that scans for credential patterns

### 4. Defense in Depth

**Problem:** Single point of failure (human judgment)
**Solution:** Multiple layers:
- Clear documentation
- Explicit naming conventions
- Automated scanning
- Peer review
- Regular audits

### 5. Credentials in Git = Burned

**Reality:** Once in git history, assume compromised
**Action:** Always rotate immediately, never try to "clean" history

---

## Prevention Checklist

When creating credential documentation:

- [ ] Use explicit field names ("Location" not just "Key")
- [ ] Show GOOD and BAD examples
- [ ] Store actual credentials in gitignored locations
- [ ] Use pre-commit hooks for scanning
- [ ] Review staged files before committing
- [ ] Regular audits of documentation files

---

## Testing the Pre-commit Hook

To verify the hook works:

```bash
# Create a test file with a fake credential
echo "api_key = sk-test-abcdefghijklmnopqrstuvwxyz12345678" > test.txt

# Try to commit it
git add test.txt
git commit -m "test"

# Expected: Hook should BLOCK the commit with warning
# Clean up: git restore --staged test.txt && rm test.txt
```

---

## Resources

- [.credentials/README.md](../.credentials/README.md) - Credential management guide
- [.credentials/CREDENTIALS_INVENTORY.md](../.credentials/CREDENTIALS_INVENTORY.md) - Template with examples
- [OWASP: Secrets Management](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [Git Security Best Practices](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github)

---

## Related Incidents

None previous. This is the first documented security incident.

---

**Last Updated:** 2026-02-04
**Reviewed By:** Security team
**Status:** Protections implemented, monitoring ongoing
