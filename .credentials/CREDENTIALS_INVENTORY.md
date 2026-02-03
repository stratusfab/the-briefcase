# Credentials Inventory

**Purpose:** Track what credentials exist and where they're stored

**CRITICAL:** This file contains NO actual credential values, only metadata

**Last Updated:** [YYYY-MM-DD]

---

## Inventory Overview

| Credential | Type | Status | Location | Expires | Last Rotated |
|------------|------|--------|----------|---------|--------------|
| [Example API Key] | API Key | ✅ Active | 1Password | Never | YYYY-MM-DD |
| [Example SSH Key] | SSH Key | ✅ Active | ~/.ssh/ | Never | YYYY-MM-DD |
| [Example Password] | Password | ⚠️ Expiring Soon | 1Password | YYYY-MM-DD | YYYY-MM-DD |

**Legend:**
- ✅ Active - Currently valid
- ⚠️ Expiring Soon - Expires within 30 days
- ❌ Expired - Needs immediate rotation
- 🔄 Rotation Needed - Past rotation schedule

---

## 🔑 Detailed Inventory

### [Example: GitHub Personal Access Token]

- **Purpose:** Git push/pull access to private repositories
- **Type:** Personal Access Token (PAT)
- **Location:** 1Password - "Development Vault" → "GitHub PAT"
- **Status:** ✅ Active
- **Scope/Permissions:** repo, read:org, workflow
- **Created:** 2024-01-15
- **Last Updated:** 2024-01-15
- **Expires:** 2025-01-15 (1 year from creation)
- **Rotation Schedule:** Annually, or on team change
- **Recovery:** Regenerate at https://github.com/settings/tokens
  1. Go to GitHub → Settings → Developer settings → Personal access tokens
  2. Generate new token with same scopes
  3. Update token in all systems
  4. Revoke old token
- **Used By:**
  - Local development machine (.gitconfig credential helper)
  - CI/CD pipeline (environment variable)

---

### [Example: Database Password]

- **Purpose:** PostgreSQL database admin access
- **Type:** Password
- **Location:** 1Password - "Infrastructure Vault" → "PostgreSQL Admin"
- **Status:** ✅ Active
- **Created:** 2024-02-01
- **Last Updated:** 2024-02-01
- **Expires:** Never (but rotate quarterly)
- **Rotation Schedule:** Every 90 days
- **Next Rotation:** 2024-05-01
- **Recovery:** Cannot recover, must reset via:
  ```sql
  ALTER USER admin WITH PASSWORD 'new-password';
  ```
- **Used By:**
  - Application servers (environment variable)
  - Database admin tools (saved connection)
  - Backup scripts (encrypted config file)

---

### [Example: SSH Key for Server Access]

- **Purpose:** SSH access to production servers
- **Type:** SSH Key (ed25519)
- **Location:** ~/.ssh/id_ed25519_production
- **Public Key Location:** Deployed to server ~/.ssh/authorized_keys
- **Status:** ✅ Active
- **Created:** 2024-01-10
- **Last Updated:** 2024-01-10
- **Expires:** Never
- **Passphrase:** Protected by OS keychain
- **Rotation Schedule:** Annually, or on security incident
- **Recovery:** Cannot recover private key, must generate new pair:
  ```bash
  ssh-keygen -t ed25519 -C "admin@example.com" -f ~/.ssh/id_ed25519_production
  # Then deploy public key to servers
  ```
- **Used By:**
  - Manual SSH connections
  - Automated deployment scripts
  - Backup procedures

---

## Template (Copy for New Credentials)

```markdown
### [Credential Name]

- **Purpose:** [What this credential is for]
- **Type:** [API Key / Password / SSH Key / Certificate / Token / etc.]
- **Location:** [Where stored - password manager, keychain, file path]
- **Status:** [✅ Active / ⚠️ Expiring Soon / ❌ Expired / 🔄 Rotation Needed]
- **Scope/Permissions:** [What access this credential grants]
- **Created:** [YYYY-MM-DD]
- **Last Updated:** [YYYY-MM-DD]
- **Expires:** [YYYY-MM-DD or "Never"]
- **Rotation Schedule:** [Frequency - daily/weekly/monthly/quarterly/annually/as-needed]
- **Next Rotation:** [YYYY-MM-DD or "As needed"]
- **Recovery:** [Step-by-step instructions to regenerate if lost]
- **Used By:** [List of systems, scripts, people who use this]
- **Notes:** [Any additional important information]
```

---

## Rotation Log

**Track credential rotations here for audit purposes**

| Date | Credential | Action | Reason | Updated By |
|------|------------|--------|--------|------------|
| 2024-02-01 | Database Password | Rotated | Quarterly schedule | [User] |
| 2024-01-15 | GitHub PAT | Created | New token for project | [User] |

---

## Expiration Alerts

**Credentials expiring within 30 days:**

- **[Credential Name]** - Expires YYYY-MM-DD (N days remaining)
- **[Credential Name]** - Expires YYYY-MM-DD (N days remaining)

---

## Statistics

| Metric | Count |
|--------|-------|
| Total Credentials | [N] |
| Active | [N] |
| Expiring Soon | [N] |
| Expired | [N] |
| Rotation Needed | [N] |

---

## Compromised Credentials Log

**If a credential is compromised, document here:**

### [YYYY-MM-DD]: [Credential Name] Compromised

- **When Discovered:** [YYYY-MM-DD HH:MM]
- **How Discovered:** [Accidental commit, breach notification, etc.]
- **Exposure:** [How it was exposed - Git history, logs, etc.]
- **Impact:** [What access was potentially compromised]
- **Response:**
  1. [Action taken - revoked, rotated, etc.]
  2. [Systems updated]
  3. [Logs reviewed for unauthorized access]
- **Prevention:** [What changes prevent recurrence]
- **Resolution:** [YYYY-MM-DD] - New credential deployed, old revoked

---

## Related Documentation

- [.credentials/README.md](README.md) - How to manage credentials
- [GIT_USAGE_GUIDE.md](../GIT_USAGE_GUIDE.md) - Preventing credential commits
- [master_plan.md](../master_plan.md) - Project overview

---

**Last Updated:** [YYYY-MM-DD]
**Next Audit:** [YYYY-MM-DD]
**Credentials Count:** [N]
