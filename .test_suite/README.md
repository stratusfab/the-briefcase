# Validation Test Suite

**Purpose:** Automated tests to verify The Briefcase setup and documentation consistency

**Run Tests:** `bash .test_suite/run_validation_tests.sh`

---

## What Gets Tested

### Documentation Consistency
- All referenced files exist
- No broken links between documents
- Master plan references are valid
- Required files are present

### Git Safety
- .gitignore prevents credential commits
- No secrets in Git history
- No large binary files committed

### Structure Validation
- Required directories exist
- File naming follows conventions
- Markdown files are well-formed

### Credential Management
- .credentials/ properly configured
- Inventory file exists
- No actual credentials in inventory

---

## Test List

| Test | What It Checks | Severity |
|------|----------------|----------|
| **test_required_files** | Core files exist (README, master_plan, TODO, etc.) | CRITICAL |
| **test_documentation_links** | Internal links work | HIGH |
| **test_gitignore_rules** | .gitignore protects secrets | CRITICAL |
| **test_credentials_safe** | No credentials in Git | CRITICAL |
| **test_markdown_format** | Markdown files valid | MEDIUM |
| **test_todo_format** | todo.md follows template | LOW |
| **test_master_plan_complete** | master_plan.md has required sections | MEDIUM |

---

## Running Tests

### Run All Tests
```bash
bash .test_suite/run_validation_tests.sh
```

### Run Specific Test
```bash
bash .test_suite/run_validation_tests.sh test_required_files
```

### Continuous Integration
Add to your CI/CD pipeline:
```yaml
# .github/workflows/validate.yml
name: Validate Documentation
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run validation tests
        run: bash .test_suite/run_validation_tests.sh
```

---

## Exit Codes

- **0** - All tests passed
- **1** - One or more tests failed
- **2** - Test suite error (missing files, etc.)

---

## Adding New Tests

### Create a New Test Function

Edit `run_validation_tests.sh` and add:

```bash
test_your_new_test() {
    echo "Running: Your New Test"

    # Your test logic here
    if [ condition ]; then
        echo "  ✅ PASS: Your test passed"
        return 0
    else
        echo "  ❌ FAIL: Your test failed"
        return 1
    fi
}
```

### Register the Test

Add to the test list in `run_validation_tests.sh`:

```bash
TESTS=(
    # ... existing tests
    "test_your_new_test"
)
```

---

## Test Development Tips

### Good Test Practices
- Test one thing per test function
- Clear, descriptive test names
- Helpful error messages
- Fast execution (<1 second per test)

### Test Categories
- **CRITICAL** - Must pass (Git safety, security)
- **HIGH** - Should pass (broken links, missing files)
- **MEDIUM** - Nice to pass (formatting, style)
- **LOW** - Optional (cosmetic issues)

---

## Troubleshooting

**Tests fail on fresh clone:**
- Expected - customize template files first
- Run `test_required_files` to see what's missing

**False positives:**
- Adjust test thresholds in run_validation_tests.sh
- Add exceptions for your project

**Tests pass but something is wrong:**
- Tests may not cover your specific case
- Add a new test for it!

---

## Test Results

Tests output:
- ✅ PASS - Test succeeded
- ❌ FAIL - Test failed
- ⚠️ WARN - Non-critical issue
- ℹ️ INFO - Informational message

Summary shows:
- Total tests run
- Passed / Failed / Warnings
- Overall result

---

## Related Documentation

- [setup.md](../docs/setup.md) - Setup guide (includes test running)
- [git_usage_guide.md](../docs/git_usage_guide.md) - Git workflow
- [master_plan.md](../master_plan.md) - Project overview

---

**Last Updated:** [YYYY-MM-DD]
**Tests Count:** [N]
