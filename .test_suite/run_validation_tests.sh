#!/usr/bin/env bash
#
# The Briefcase - Validation Test Suite
#
# Purpose: Verify project structure and documentation consistency
# Usage: bash .test_suite/run_validation_tests.sh [test_name]
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0
WARNINGS=0

# Project root (parent of .test_suite)
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "========================================"
echo "The Briefcase - Validation Test Suite"
echo "========================================"
echo "Project: $PROJECT_ROOT"
echo ""

# ============================================================================
# Test: Required Files Exist
# ============================================================================
test_required_files() {
    echo "Running: Required Files Exist"
    local failed=0

    required_files=(
        "README.md"
        "SETUP.md"
        "master_plan.md"
        "TODO.md"
        "IMPROVEMENTS.md"
        "SESSION_CAPTURE.md"
        "AI_INTEGRATION_GUIDE.md"
        "PLANNING_VALIDATION_CHECKLIST.md"
        ".gitignore"
        ".credentials/README.md"
        ".credentials/CREDENTIALS_INVENTORY.md"
        ".credentials/.gitignore"
        ".test_suite/README.md"
        ".test_suite/run_validation_tests.sh"
    )

    for file in "${required_files[@]}"; do
        if [ -f "$PROJECT_ROOT/$file" ]; then
            echo "  ✅ Found: $file"
        else
            echo "  ❌ Missing: $file"
            failed=1
        fi
    done

    if [ $failed -eq 0 ]; then
        echo "  ${GREEN}✅ PASS${NC}: All required files exist"
        return 0
    else
        echo "  ${RED}❌ FAIL${NC}: Some required files missing"
        return 1
    fi
}

# ============================================================================
# Test: Git Ignore Rules Protect Secrets
# ============================================================================
test_gitignore_rules() {
    echo "Running: Git Ignore Rules"
    local failed=0

    gitignore="$PROJECT_ROOT/.gitignore"

    if [ ! -f "$gitignore" ]; then
        echo "  ${RED}❌ FAIL${NC}: .gitignore not found"
        return 1
    fi

    # Check for critical patterns
    patterns=(
        "*.key"
        "*.pem"
        "secrets.yaml"
        ".env"
        "*.log"
    )

    for pattern in "${patterns[@]}"; do
        if grep -q "$pattern" "$gitignore"; then
            echo "  ✅ Protected: $pattern"
        else
            echo "  ⚠️  Warning: $pattern not in .gitignore"
            ((WARNINGS++))
        fi
    done

    # Check .credentials/ is protected (except whitelisted files)
    if grep -q ".credentials/\*" "$gitignore" || grep -q ".credentials/" "$gitignore"; then
        echo "  ✅ Protected: .credentials/ directory"
    else
        echo "  ${RED}❌ FAIL${NC}: .credentials/ not protected"
        failed=1
    fi

    if [ $failed -eq 0 ]; then
        echo "  ${GREEN}✅ PASS${NC}: .gitignore protects secrets"
        return 0
    else
        echo "  ${RED}❌ FAIL${NC}: .gitignore insufficient"
        return 1
    fi
}

# ============================================================================
# Test: No Credentials in Git
# ============================================================================
test_no_credentials_in_git() {
    echo "Running: No Credentials in Git"

    cd "$PROJECT_ROOT"

    # Check for common secret patterns in tracked files
    secret_patterns=(
        "password.*=.*"
        "api[_-]?key.*=.*"
        "secret.*=.*"
        "token.*=.*"
        "BEGIN.*PRIVATE KEY"
    )

    local found_secrets=0

    for pattern in "${secret_patterns[@]}"; do
        if git grep -iE "$pattern" 2>/dev/null | grep -v ".test_suite" | grep -v "CREDENTIALS_INVENTORY.md" | grep -q .; then
            echo "  ⚠️  Warning: Found pattern '$pattern' in tracked files"
            ((WARNINGS++))
            found_secrets=1
        fi
    done

    if [ $found_secrets -eq 0 ]; then
        echo "  ${GREEN}✅ PASS${NC}: No obvious secrets found"
        return 0
    else
        echo "  ${YELLOW}⚠️  WARN${NC}: Potential secrets detected (review manually)"
        return 0  # Don't fail, just warn
    fi
}

# ============================================================================
# Test: Credentials Directory Safe
# ============================================================================
test_credentials_directory() {
    echo "Running: Credentials Directory Safety"
    local failed=0

    creds_dir="$PROJECT_ROOT/.credentials"

    # Check directory exists
    if [ ! -d "$creds_dir" ]; then
        echo "  ${RED}❌ FAIL${NC}: .credentials/ directory missing"
        return 1
    fi

    # Check only safe files exist
    safe_files=("README.md" "CREDENTIALS_INVENTORY.md" ".gitignore")

    for file in "$creds_dir"/*; do
        if [ ! -e "$file" ]; then
            continue  # No files
        fi

        basename_file=$(basename "$file")

        if [[ ! " ${safe_files[@]} " =~ " ${basename_file} " ]]; then
            echo "  ⚠️  Warning: Unexpected file in .credentials/: $basename_file"
            ((WARNINGS++))
        fi
    done

    # Check .gitignore exists
    if [ ! -f "$creds_dir/.gitignore" ]; then
        echo "  ${RED}❌ FAIL${NC}: .credentials/.gitignore missing"
        failed=1
    else
        echo "  ✅ .credentials/.gitignore exists"
    fi

    if [ $failed -eq 0 ]; then
        echo "  ${GREEN}✅ PASS${NC}: Credentials directory configured safely"
        return 0
    else
        echo "  ${RED}❌ FAIL${NC}: Credentials directory issues"
        return 1
    fi
}

# ============================================================================
# Test: Documentation Links (Basic Check)
# ============================================================================
test_documentation_links() {
    echo "Running: Documentation Links"
    local broken_links=0

    cd "$PROJECT_ROOT"

    # Find all markdown files
    while IFS= read -r mdfile; do
        # Extract relative links like [text](file.md)
        links=$(grep -oE '\]\([^http][^)]+\)' "$mdfile" 2>/dev/null | sed 's/](\(.*\))/\1/' || true)

        for link in $links; do
            # Remove anchors (#section)
            file_part="${link%%#*}"

            # Resolve relative path
            dir=$(dirname "$mdfile")
            target="$dir/$file_part"

            if [ ! -f "$target" ] && [ ! -d "$target" ]; then
                echo "  ⚠️  Broken link in $mdfile: $link"
                ((broken_links++))
                ((WARNINGS++))
            fi
        done
    done < <(find . -name "*.md" -not -path "./.git/*")

    if [ $broken_links -eq 0 ]; then
        echo "  ${GREEN}✅ PASS${NC}: No broken links found"
        return 0
    else
        echo "  ${YELLOW}⚠️  WARN${NC}: Found $broken_links potential broken links"
        return 0  # Don't fail, just warn
    fi
}

# ============================================================================
# Test: Master Plan Completeness
# ============================================================================
test_master_plan_complete() {
    echo "Running: Master Plan Completeness"
    local failed=0

    master_plan="$PROJECT_ROOT/master_plan.md"

    if [ ! -f "$master_plan" ]; then
        echo "  ${RED}❌ FAIL${NC}: master_plan.md not found"
        return 1
    fi

    # Check for required sections
    required_sections=(
        "Quick Project Overview"
        "Reference These Documents First"
        "Strategic Decisions"
        "Documentation Structure"
        "Key Systems"
    )

    for section in "${required_sections[@]}"; do
        if grep -qi "$section" "$master_plan"; then
            echo "  ✅ Found section: $section"
        else
            echo "  ⚠️  Missing section: $section"
            ((WARNINGS++))
        fi
    done

    echo "  ${GREEN}✅ PASS${NC}: master_plan.md structure looks good"
    return 0
}

# ============================================================================
# Test: TODO Format
# ============================================================================
test_todo_format() {
    echo "Running: TODO Format"

    todo_file="$PROJECT_ROOT/TODO.md"

    if [ ! -f "$todo_file" ]; then
        echo "  ⚠️  Warning: TODO.md not found"
        ((WARNINGS++))
        return 0
    fi

    # Check for basic structure
    if grep -q "## 📌 High Priority" "$todo_file"; then
        echo "  ✅ Has High Priority section"
    else
        echo "  ⚠️  Missing High Priority section"
        ((WARNINGS++))
    fi

    echo "  ${GREEN}✅ PASS${NC}: TODO.md format acceptable"
    return 0
}

# ============================================================================
# Test Runner
# ============================================================================

# List of all tests
TESTS=(
    "test_required_files"
    "test_gitignore_rules"
    "test_no_credentials_in_git"
    "test_credentials_directory"
    "test_documentation_links"
    "test_master_plan_complete"
    "test_todo_format"
)

# Run specific test or all tests
if [ $# -gt 0 ]; then
    # Run specific test
    test_name="$1"
    if declare -f "$test_name" > /dev/null; then
        ((TESTS_RUN++))
        if $test_name; then
            ((TESTS_PASSED++))
        else
            ((TESTS_FAILED++))
        fi
    else
        echo "${RED}Error: Test '$test_name' not found${NC}"
        exit 2
    fi
else
    # Run all tests
    for test in "${TESTS[@]}"; do
        ((TESTS_RUN++))
        echo ""
        if $test; then
            ((TESTS_PASSED++))
        else
            ((TESTS_FAILED++))
        fi
    done
fi

# ============================================================================
# Summary
# ============================================================================
echo ""
echo "========================================"
echo "Test Summary"
echo "========================================"
echo "Tests Run:    $TESTS_RUN"
echo "Passed:       ${GREEN}$TESTS_PASSED${NC}"
echo "Failed:       ${RED}$TESTS_FAILED${NC}"
echo "Warnings:     ${YELLOW}$WARNINGS${NC}"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo "${GREEN}✅ ALL TESTS PASSED${NC}"
    exit 0
else
    echo "${RED}❌ SOME TESTS FAILED${NC}"
    exit 1
fi
