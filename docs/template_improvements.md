# Template Improvement Suggestions

**Purpose:** Capture suggestions for improving The Briefcase framework itself (not your project-specific improvements - those go in improvements.md)

**Last Updated:** [YYYY-MM-DD]

---

## What Goes Here

**This file is for suggestions to improve THE BRIEFCASE TEMPLATE:**
- New Design Principles that would benefit all users
- Better operational rules
- New audit tests
- Documentation improvements
- Framework features

**NOT for:**
- Your project-specific improvements (use improvements.md)
- Your project features
- Bugs in your code

---

## How to Contribute Back to Template

When you have a good suggestion for The Briefcase framework:

### 1. Document It Here First

Add entry below with:
- **What:** What would you add/change?
- **Why:** How does it improve the framework?
- **Who benefits:** Would this help other Briefcase users?
- **How:** Rough idea of implementation

### 2. Validate It Works

- Test in your project first
- Prove it solves a real problem
- Document results

### 3. Submit to Template Repository

**Option A: Create Issue**
```bash
# Go to: https://github.com/stratusfab/the-briefcase/issues
# Click "New Issue"
# Title: [Suggestion] Your improvement
# Body: Copy your entry from this file
```

**Option B: Submit Pull Request**
```bash
# Fork the template repo
git clone https://github.com/YOUR_USERNAME/the-briefcase.git briefcase-fork
cd briefcase-fork
git checkout -b feature/your-improvement

# Make changes (keep generic, no project-specific content)
# Test that setup.md still works
# Commit with clear message

git push origin feature/your-improvement
# Open PR on GitHub
```

### 4. Reference This File

In your issue or PR, mention:
- "Discovered while working on [your project]"
- "Tested in production for [timeframe]"
- "See attached/pasted documentation from template_improvements.md"

---

## Current Suggestions

### [YYYY-MM-DD]: [Suggestion Title]

**Suggested By:** [Your name/team]

**What:** [Describe the improvement to The Briefcase framework]

**Why:** [What problem does this solve for Briefcase users?]

**Who Benefits:** [Who would find this useful?]

**Tested In:** [Your project name, how long you've used it]

**Implementation Notes:**
- [How might this be added to the template?]
- [What files would need updating?]
- [Any risks or considerations?]

**Status:**
- [ ] Captured here
- [ ] Validated in our project
- [ ] Issue created on template repo
- [ ] PR submitted
- [ ] Merged into template

---

## Example Entry

### 2025-02-03: Add Docker Validation to Test Suite

**Suggested By:** Jesse @ Stratusfab

**What:** Add validation test that checks if Docker is running before tests that need it

**Why:** Setup tests fail cryptically if Docker isn't running. Better to check explicitly and give clear error.

**Who Benefits:** Anyone using The Briefcase for projects with Docker

**Tested In:** homelab-docs project, 3 months

**Implementation Notes:**
- Add to .test_suite/run_validation_tests.sh
- Check: `docker info > /dev/null 2>&1`
- If fails: "Docker not running. Some tests require Docker."
- Low risk, backward compatible

**Status:**
- [x] Captured here
- [x] Validated in our project
- [ ] Issue created on template repo
- [ ] PR submitted
- [ ] Merged into template

---

## Guidelines for Good Suggestions

**Good suggestions are:**
- ✅ Generic (help all Briefcase users, not just your project)
- ✅ Tested (you've used it and it works)
- ✅ Documented (clear explanation)
- ✅ Low risk (won't break existing setups)

**Avoid:**
- ❌ Project-specific features
- ❌ Untested ideas
- ❌ Breaking changes without migration path
- ❌ Highly opinionated choices

---

## Contribution Stats

**Total Suggestions:** 0
**Submitted to Template:** 0
**Merged:** 0
**Rejected:** 0
**Pending:** 0

---

## Related Files

- [improvements.md](improvements.md) - Your project improvements (stay in your repo)
- [CONTRIBUTING.md](../CONTRIBUTING.md) - How to contribute to template
- [master_plan.md](../master_plan.md) - Strategic decisions

---

**Remember:** This file helps improve The Briefcase for everyone. Your project improvements go in improvements.md.
