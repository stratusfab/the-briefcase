# Credential Management

**CRITICAL:** This directory documents WHAT credentials exist and WHERE they're stored, NOT the credential values themselves.

---

## Purpose

The `.credentials/` directory provides:

1. **Inventory** - Track what credentials exist
2. **Location** - Document where they're securely stored
3. **Status** - Monitor expiration and rotation needs
4. **Recovery** - Know how to recover lost credentials

**This directory does NOT contain:**
- ❌ Actual passwords, API keys, tokens
- ❌ SSH private keys
- ❌ Certificates
- ❌ Any sensitive values

---

## 📂 Directory Structure

```
.credentials/
├── README.md                    # This file - how to use
├── CREDENTIALS_INVENTORY.md     # What exists, where stored
├── .gitignore                   # Prevents committing secrets
└── [NO OTHER FILES]             # Never add credential files here!
```

---

## How to Use

### Adding a New Credential

1. **Store the actual credential securely:**
   - Password manager (1Password, Bitwarden, LastPass, etc.)
   - OS keychain (macOS Keychain, Windows Credential Manager)
   - Environment variables (for local development)
   - Encrypted vault (for team sharing)

2. **Document in CREDENTIALS_INVENTORY.md:**
   - Name: What is this credential for?
   - Purpose: Why do we need it?
   - Location: Where is it stored? (password manager, keychain, etc.)
   - Status: Active, Expired, Needs Rotation
   - Last Updated: When was it created/changed?
   - Recovery: How to regenerate if lost?

3. **Never commit the actual credential to Git**

### Updating a Credential

1. Update the actual credential in secure storage
2. Update CREDENTIALS_INVENTORY.md with:
   - New "Last Updated" date
   - Status change if needed
   - Note in changelog

### Rotating Credentials

**When to rotate:**
- Scheduled rotation (e.g., every 90 days)
- After team member leaves
- After suspected compromise
- Before expiration date

**How to rotate:**
1. Generate new credential
2. Store new credential securely
3. Update all systems using old credential
4. Delete/revoke old credential
5. Update CREDENTIALS_INVENTORY.md

---

## Security Best Practices

### DO:
- ✅ Use password managers for passwords
- ✅ Use OS keychains for local credentials
- ✅ Use environment variables for development
- ✅ Document credential locations
- ✅ Rotate credentials regularly
- ✅ Use strong, unique credentials
- ✅ Enable MFA where possible

### DON'T:
- ❌ Commit credentials to Git
- ❌ Store credentials in plain text files
- ❌ Share credentials via email/chat
- ❌ Reuse credentials across services
- ❌ Store credentials in code
- ❌ Ignore expiration warnings

---

## If Credentials Are Accidentally Committed

**STOP IMMEDIATELY!**

1. **Do not push** if you haven't yet
2. **Remove from Git history:**
   ```bash
   # Using git filter-repo (recommended)
   git filter-repo --path path/to/secret --invert-paths

   # Or using BFG Repo-Cleaner
   bfg --delete-files secret-file.txt
   ```

3. **Rotate the compromised credential immediately**
   - Generate new credential
   - Update all systems
   - Revoke old credential

4. **Force push (if already pushed):**
   ```bash
   git push --force origin main
   ```
   - ⚠️ Coordinate with team first!

5. **Document the incident:**
   - What was exposed?
   - When was it exposed?
   - How was it fixed?
   - Lessons learned?

---

## Recommended Tools

### Password Managers
- **1Password** - Team sharing, CLI access
- **Bitwarden** - Open source, self-hostable
- **LastPass** - Popular, feature-rich
- **pass** - Unix password manager (Git-based)

### OS Keychains
- **macOS Keychain** - Built into macOS
- **Windows Credential Manager** - Built into Windows
- **GNOME Keyring** - Linux desktop keyring
- **KeePassXC** - Cross-platform, local storage

### Environment Variables
- **direnv** - Auto-load .envrc files per directory
- **dotenv** - Load .env files in applications
- **.env files** - But add to .gitignore!

### Team Sharing (Encrypted)
- **HashiCorp Vault** - Enterprise secrets management
- **AWS Secrets Manager** - Cloud-based secrets
- **Azure Key Vault** - Microsoft cloud secrets
- **Doppler** - Developer secrets platform

---

## Backup & Recovery

### Backing Up Credentials

1. **Password Manager:**
   - Most have built-in backup/export
   - Export to encrypted file
   - Store backup securely (offline, encrypted)

2. **OS Keychain:**
   - macOS: Keychain Access → File → Export
   - Windows: Export from Credential Manager
   - Encrypt backup file

3. **Environment Variables:**
   - Document in CREDENTIALS_INVENTORY.md
   - Backup .env files (encrypted)

### Recovery Procedures

**If credential is lost:**

1. Check CREDENTIALS_INVENTORY.md for:
   - Where it was stored
   - Recovery procedures
   - Regeneration steps

2. If stored credential is truly lost:
   - Follow regeneration steps (if documented)
   - Or contact service provider for reset
   - Update CREDENTIALS_INVENTORY.md

3. Update all systems using new credential

---

## Credential Inventory Template

See [CREDENTIALS_INVENTORY.md](CREDENTIALS_INVENTORY.md) for the full inventory.

**Template for each credential:**

```markdown
### [Credential Name]

- **Purpose:** [What this credential is for]
- **Type:** [API Key / Password / SSH Key / Certificate / Token]
- **Location:** [Where stored - e.g., "1Password - Work Vault"]
- **Status:** [Active / Expired / Needs Rotation]
- **Created:** [YYYY-MM-DD]
- **Last Updated:** [YYYY-MM-DD]
- **Expires:** [YYYY-MM-DD or "Never"]
- **Rotation Schedule:** [Every 90 days / Annually / As needed]
- **Recovery:** [How to regenerate if lost]
- **Used By:** [What systems use this credential]
```

---

## Regular Maintenance

### Weekly
- [ ] Check for expiration warnings
- [ ] Review credential usage logs (if available)

### Monthly
- [ ] Review CREDENTIALS_INVENTORY.md for accuracy
- [ ] Check for credentials needing rotation
- [ ] Verify backup procedures working

### Quarterly
- [ ] Audit all credentials (are they all still needed?)
- [ ] Rotate high-value credentials
- [ ] Review access logs for anomalies

### Annually
- [ ] Full credential audit
- [ ] Update security procedures
- [ ] Review and update this documentation

---

## Related Documentation

- [CREDENTIALS_INVENTORY.md](CREDENTIALS_INVENTORY.md) - The actual inventory
- [.gitignore](../.gitignore) - Prevents committing secrets
- [GIT_USAGE_GUIDE.md](../GIT_USAGE_GUIDE.md) - Git workflow and safety
- [master_plan.md](../master_plan.md) - Project overview

---

**Remember:** This directory tracks credentials, it does NOT store them!
