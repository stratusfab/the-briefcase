# System Improvements & Suggestions

**Purpose:** Capture enhancement ideas from conversations, triage them into actionable todos

**Last Updated:** [YYYY-MM-DD]

---

## How It Works

1. **During any session:** If improvement ideas emerge, add them here
2. **Weekly review:** Triage suggestions, move actionable items to todo.md
3. **Completed improvements:** Document and archive

---

## Current Suggestions (Awaiting Triage)

### [YYYY-MM-DD]: [Suggestion Title]

**Suggested By:** [User/AI name]

**Context:** [What prompted this idea? What problem does it solve?]

**Benefit:** [Why would this help? What improves?]

**Effort Estimate:** [Low / Medium / High]

**Implementation Approach:** [How might this be built?]

**Status:** Captured, awaiting triage

**Triage Questions:**
- Is it actionable? (Can we build it?)
- Is it valuable? (Does it improve the system?)
- What's the effort? (Time/complexity estimate)
- Any conflicts? (Does it conflict with strategic decisions?)

---

### Example Suggestion Template

**Suggested By:** Claude

**Context:** Level 2 documents could auto-update with latest work summary instead of manual updates

**Benefit:** Documentation stays current without manual effort, reduces maintenance burden

**Effort Estimate:** Medium (requires template system)

**Implementation Approach:**
1. Create document templates with placeholders
2. Build script to inject current state into templates
3. Add to git commit hook or weekly automation

**Status:** Captured, awaiting triage

---

## Triage Workflow

**When reviewing suggestions:**

1. **Read** - Understand the suggestion fully
2. **Evaluate:**
   - Is it actionable? (Can we build it?)
   - Is it valuable? (Does it improve the system?)
   - What's the effort? (Small, medium, large?)
3. **Validate (if significant):**
   - Check planning_validation_checklist.md for major changes
   - Does it conflict with strategic decisions?
   - What are ripple effects?
4. **Decide:**
   - **YES:** Add to todo.md with priority
   - **MAYBE:** Keep here, revisit next review
   - **NO:** Document why, archive the suggestion
5. **Move to todo.md** when approved

---

## Triaged Suggestions

### [YYYY-MM-DD]: [Suggestion Name] - APPROVED

**Decision:** Approved, added to todo.md as [Task ID]

**Rationale:** [Why approved]

---

### [YYYY-MM-DD]: [Suggestion Name] - DEFERRED

**Decision:** Deferred until [condition or date]

**Rationale:** [Why deferred]

---

### [YYYY-MM-DD]: [Suggestion Name] - REJECTED

**Decision:** Not pursuing

**Rationale:** [Why rejected - conflicts, not valuable, too complex, etc.]

---

## How This Integrates

**Conversation → Improvement → Todo → Done:**

1. During work, user or AI notices improvement opportunity
2. **Add to improvements.md** (this file) with context
3. **Weekly triage** - Review, move actionable to todo.md
4. **Session startup** - todo.md shows pending work
5. **Work on todos** - Track progress, mark complete
6. **Archive completed** - Move to archive with date

---

## 🎯 Categories for Todos

When moving suggestions to todo.md, use these categories:

- `feature` - New functionality
- `improvement` - Enhance existing feature
- `documentation` - Docs need updating
- `maintenance` - Regular upkeep
- `investigation` - Explore potential issue
- `health-check` - Recurring verification

---

## Triage Schedule

- **Daily:** Add suggestions as they emerge
- **Weekly:** [Day] - Triage suggestions, update todo.md
- **Monthly:** Review completed, archive old items
- **Quarterly:** System health assessment, long-term planning

---

## Related Files

- [todo.md](todo.md) - Actionable items (created from suggestions)
- [system_health_check.md](system_health_check.md) - Weekly verification
- [session_capture.md](session_capture.md) - In-session observations
- [master_plan.md](master_plan.md) - Strategic decisions (check for conflicts)

---

**Last Updated:** [YYYY-MM-DD]
**Status:** Active - Collecting suggestions
**Next Triage:** [Next week's date]
**Total Pending:** [N]
