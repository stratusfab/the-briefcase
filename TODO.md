# Project Todo List

**Purpose:** Persistent tracking of actionable work items across sessions

**Last Updated:** [YYYY-MM-DD]

---

## 📋 How to Use This Todo List

### Task Categories

- `fix` - Bug fixes
- `feature` - New functionality
- `improvement` - Enhance existing features
- `documentation` - Documentation updates
- `investigation` - Research or exploration
- `maintenance` - Regular upkeep
- `health-check` - Recurring verification

### Task Status

| Status | Meaning | When to Use |
|--------|---------|-------------|
| 📋 **Scheduled** | Not started, has date | Tasks with specific timeline |
| 🔄 **Recurring** | Happens on schedule | Weekly/monthly tasks |
| 🏗️ **In Progress** | Actively working | Currently being worked on |
| ✅ **Completed** | Done | Task finished |

### Priority Levels

| Level | When to Do | Examples |
|-------|-----------|----------|
| **HIGH** | Soon (before next work) | Blockers, security issues, critical bugs |
| **MEDIUM** | When touching that area | Enhancements, nice-to-have updates |
| **LOW** | Sometime, or ignore | Cosmetic changes, optional improvements |

---

## 📌 High Priority (Do Next)

### 1. [Example Task Name]

**Category:** `feature` | **Priority:** HIGH | **Status:** 🏗️ In Progress
**Created:** YYYY-MM-DD | **Due:** YYYY-MM-DD (if applicable)

**Problem/Goal:**
[Describe what needs to be done and why]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Next Steps:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Blockers:** [Any dependencies or blockers]

**Reference:** [Link to relevant documentation]

---

## 📝 Medium Priority

### 1. [Example Medium Priority Task]

**Category:** `improvement` | **Priority:** MEDIUM | **Status:** 📋 Scheduled
**Created:** YYYY-MM-DD

**What:** [Brief description]

**Why:** [Why this matters]

**When:** [When to tackle this]

---

## 🔍 Low Priority

### 1. [Example Low Priority Task]

**Category:** `documentation` | **Priority:** LOW | **Status:** 📋 Pending

**What:** [Brief description]

**Can Be Batched With:** [What other work makes this worthwhile]

---

## 🔄 Recurring Tasks

### 1. Weekly System Health Check

**Category:** `health-check` | **Priority:** High | **Recurring:** Weekly (Thursdays)
**Created:** YYYY-MM-DD | **Status:** 🔄 Recurring

**What to do:**
1. Run validation tests: `bash .test_suite/run_validation_tests.sh`
2. Check git status across all repos
3. Review documentation timestamps (update stale docs)
4. Verify backup procedures working

**Why:** Catch issues early, ensure system health

**Reference:** [SYSTEM_HEALTH_CHECK.md](SYSTEM_HEALTH_CHECK.md)

**Next due:** [Next Thursday's date]

---

### 2. Weekly Improvement Triage

**Category:** `maintenance` | **Priority:** Medium | **Recurring:** Weekly (Fridays)
**Created:** YYYY-MM-DD | **Status:** 🔄 Recurring

**What to do:**
1. Review [IMPROVEMENTS.md](IMPROVEMENTS.md) for new suggestions
2. For each: Is it actionable? Valuable? What's the effort?
3. Move approved items to appropriate priority sections here
4. Update suggestion status in IMPROVEMENTS.md

**Why:** Keeps improvement pipeline organized

**Next due:** [Next Friday's date]

---

## 📊 Investigations (Research Needed)

### 1. [Example Investigation]

**Category:** `investigation` | **Priority:** MEDIUM | **Status:** 📋 Pending
**Created:** YYYY-MM-DD

**Question:** [What needs investigation]

**Why:** [Why this matters]

**Approach:**
1. [Research step 1]
2. [Research step 2]
3. Document findings in [relevant doc]

**Time box:** [Maximum time to spend]

---

## ✅ Completed (Recent)

### Completed [This Week/Month]

- ✅ **[Task name]** ([Category]) - Completed YYYY-MM-DD
  - [Brief summary of what was done]

- ✅ **[Task name]** ([Category]) - Completed YYYY-MM-DD
  - [Brief summary]

---

## 📅 Calendar View

```
Week of [Date]:
  Mon: (work)
  Tue: (work)
  Wed: (work)
  Thu: 🔧 SYSTEM HEALTH CHECK
  Fri: 📋 TRIAGE IMPROVEMENTS
  Sat: (work)
  Sun: (work)
```

---

## 📊 Statistics

| Metric | Count |
|--------|-------|
| High Priority | [N] |
| Medium Priority | [N] |
| Low Priority | [N] |
| In Progress | [N] |
| Completed This Week | [N] |
| Recurring Tasks | [N] |

---

## 🔗 Related Files

- [IMPROVEMENTS.md](IMPROVEMENTS.md) - Suggestions awaiting triage
- [SESSION_CAPTURE.md](SESSION_CAPTURE.md) - In-the-moment notes
- [SYSTEM_HEALTH_CHECK.md](SYSTEM_HEALTH_CHECK.md) - Weekly verification procedures
- [master_plan.md](master_plan.md) - Overall project status

---

## 📝 How to Use This File

**Adding a new todo:**
1. Choose appropriate priority section
2. Use format: **Title** | Category | Priority | Status
3. Add description, acceptance criteria, next steps
4. Reference relevant documentation

**Updating status:**
- Change status emoji: 📋 → 🏗️ → ✅
- Update description as work progresses
- Move to "Completed" when done

**Removing todos:**
- Move to "Completed" section with date
- Archive completed section monthly

---

**Last Updated:** [YYYY-MM-DD]
**Total Open:** [N high] + [N medium] + [N low] = [N total]
**Completed This Session:** [N]
