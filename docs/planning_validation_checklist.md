# Planning Validation Checklist

**Purpose:** Validate proposed changes against overall project plan before implementing

**When to Use:** Before starting any significant feature, purchase, or direction change

---

## Purpose

**Problem:** It's easy to pursue interesting ideas that conflict with project goals, strategic decisions, or existing work.

**Solution:** Run this checklist BEFORE significant work to catch conflicts early.

---

## Validation Checklist

### 1. Strategic Alignment

**Check master_plan.md → Strategic Decisions**

- [ ] Does this align with documented strategic decisions?
- [ ] Does this conflict with any established constraints?
- [ ] Is this consistent with the project's core principle?

**If conflicts exist:**
- Document the conflict
- Get explicit approval to override strategic decision
- Update master_plan.md if decision changes

---

### 2. Scope & Phase Alignment

**Check master_plan.md → Project Phases**

- [ ] Is this work part of the current phase?
- [ ] Or is it jumping ahead to future phases?
- [ ] Does it block or unblock current phase work?

**If out of scope:**
- Can it wait until the appropriate phase?
- Or is there a compelling reason to do it now?
- Update master_plan.md if phase priorities change

---

### 3. Resource & Dependency Check

- [ ] Do we have the required tools/access?
- [ ] Are there unmet dependencies?
- [ ] What skills/knowledge are needed?
- [ ] Is there sufficient time to complete this?

**If resources missing:**
- Add "acquire resources" as prerequisite task
- Or defer until resources available

---

### 4. Documentation Impact

- [ ] What documentation needs to be created?
- [ ] What existing docs need updates?
- [ ] Is there a clear plan to maintain documentation?

**Common impacts:**
- New system → New Level 2 doc required
- Changed workflow → Update common_tasks.md
- New decisions → Update master_plan.md
- New terminology → Update glossary.md

---

### 5. Ripple Effect Analysis

**What else does this affect?**

- [ ] Other systems or services
- [ ] Existing workflows or procedures
- [ ] Team members or other AIs
- [ ] Documentation in multiple places
- [ ] Future work or dependencies

**For each ripple effect:**
- Document in todo.md as follow-up task
- Assign priority (HIGH/MEDIUM/LOW)
- Note which can be batched together

---

### 6. Alternatives Considered

- [ ] Have we considered alternative approaches?
- [ ] Why is this approach better than alternatives?
- [ ] What are the tradeoffs?

**Document:**
- Chosen approach and why
- Rejected alternatives and why
- Tradeoffs accepted

---

### 7. Success Criteria

- [ ] How will we know this worked?
- [ ] What are the acceptance criteria?
- [ ] How will we test/validate?

**Define:**
- Measurable success criteria
- Testing approach
- Rollback plan if it fails

---

### 8. Effort vs. Value

- [ ] Estimated effort (time, complexity)?
- [ ] Expected value/benefit?
- [ ] Is the ROI worth it?

**Rough estimates:**
- Effort: Low (<1 hr), Medium (1-4 hrs), High (>4 hrs)
- Value: Low (nice-to-have), Medium (helpful), High (critical)

**Decision matrix:**
- High value + Low effort = Do now
- High value + High effort = Plan carefully
- Low value + High effort = Probably skip
- Low value + Low effort = Do if already in that area

---

### 9. Risk Assessment

**What could go wrong?**

- [ ] Technical risks (complexity, unknowns)
- [ ] Process risks (workflow disruption)
- [ ] Data risks (loss, corruption)
- [ ] Security risks (new vulnerabilities)

**For each risk:**
- Severity: Low/Medium/High
- Mitigation: How to prevent
- Recovery: How to recover if it happens

---

### 10. Approval & Documentation

- [ ] Who needs to approve this change?
- [ ] Where will the decision be documented?
- [ ] When should this decision be reviewed?

**Document in:**
- master_plan.md (if strategic)
- todo.md (if tactical)
- Relevant Level 2 doc (if domain-specific)

---

## Example: Evaluating a New Feature

**Proposal:** Add automated backup system

**Validation:**

1. **Strategic Alignment:** ✅ Aligns with "safety first" principle
2. **Scope:** ⚠️ Not in current phase, but unblocks future work → Approved
3. **Resources:** ✅ Have tools and knowledge
4. **Documentation:** → Need to create BACKUP_PROCEDURES.md
5. **Ripple Effects:**
   - Update master_plan.md (add backup system)
   - Update system_health_check.md (verify backups weekly)
   - Update DISASTER_RECOVERY.md (restore procedures)
6. **Alternatives:** Considered manual backups (rejected: too error-prone)
7. **Success Criteria:** Backups run daily, can restore within 1 hour
8. **Effort vs. Value:** Medium effort (2-3 hours), High value → Approved
9. **Risks:** Could fail silently → Mitigation: Add monitoring
10. **Approval:** Approved by user, document in master_plan.md

**Decision:** APPROVED - Add to todo.md as HIGH priority

---

## Related Files

- [master_plan.md](../master_plan.md) - Strategic decisions, current phase
- [todo.md](todo.md) - Where approved items go
- [improvements.md](improvements.md) - Where suggestions start
- [session_capture.md](session_capture.md) - Capture ripple effects during work

---

## Decision Matrix

| Strategic Alignment | Scope Match | High Value | Low Risk | → Decision |
|---------------------|-------------|------------|----------|------------|
| ✅ | ✅ | ✅ | ✅ | **DO NOW** |
| ✅ | ✅ | ✅ | ⚠️ | Plan carefully, mitigate risks |
| ✅ | ⚠️ | ✅ | ✅ | Get approval to adjust scope |
| ❌ | * | * | * | **REJECT** or get approval to change strategy |
| ✅ | ✅ | ⚠️ | ✅ | Defer or batch with other work |
| ✅ | ✅ | ⚠️ | ⚠️ | **SKIP** unless already in the area |

---

**Last Updated:** [YYYY-MM-DD]
**Usage:** Run this checklist before starting any significant work
