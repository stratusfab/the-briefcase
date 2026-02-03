# Knowledge Reference Index

**Purpose:** Track external documentation saved locally to reduce token usage through reuse.

**Last Updated:** [YYYY-MM-DD]

---

## How This Works

### The Problem
Fetching the same documentation repeatedly wastes tokens and time.

### The Solution
1. Save external docs locally when first obtained
2. Validate before re-fetching (is local copy still current?)
3. Reuse existing knowledge instead of fetching new
4. Result: Token usage declines as knowledge base grows

---

## Workflow

### When Fetching External Documentation

1. **Save the document** in this directory (docs/references/)
2. **Name it descriptively** - e.g., `react-hooks-api-2025.md`
3. **Add entry below** with all metadata
4. **Commit to Git** so knowledge persists

### When You Need Documentation

1. **Check this INDEX first** - do we already have it?
2. **If found:** Validate it's still current
   - Check "Last Validated" date
   - Check if version/date in document is recent
   - Look for "Validation" notes on how to verify
3. **If outdated:** Fetch new version, update file and INDEX entry
4. **If missing:** Fetch, save, and add new INDEX entry

### Validation Guidelines

**How to check if documentation is outdated:**
- API docs: Check version number against current release
- Tutorials: Check publication date (>1 year may be outdated)
- Reference docs: Check "Last Updated" date on source
- Specifications: Check if superseded by newer spec version

**When in doubt:** Validate before using. Quick check is faster than debugging wrong info.

---

## Saved References

### Example Entry (DELETE THIS AFTER FIRST REAL ENTRY)

**File:** `example-api-documentation.md`
**Source:** https://example.com/api/docs
**Fetched:** 2025-01-15
**Purpose:** API reference for Example Service integration
**Validation:** Check version number at top of doc against https://example.com/api/version
**Last Validated:** 2025-01-15
**Status:** Current

---

### [Add your entries below this line]

---

## Statistics

**Total References:** 0
**Last Addition:** None yet
**Token Savings:** Track this over time - compare token usage on repeat tasks

---

## Related Files

- [master_plan.md](../../master_plan.md) - Operational rules for knowledge management
- [session_capture.md](../session_capture.md) - Document when you save/reuse references
- [common_tasks.md](../common_tasks.md) - Reference saved docs in task procedures

---

**Principle:** Knowledge accumulates. Token usage should decline over time as this library grows.
