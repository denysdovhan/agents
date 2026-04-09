#!/bin/bash

# Validation script using official skills-ref library
# https://github.com/agentskills/agentskills/tree/main/skills-ref

SKILLS_DIR="skills"
SKILLS_REPO_DIR=".skill-ref"
SKILLS_REF_DIR=".skill-ref/skills-ref"

echo "🔍 Validating Skills Using Official skills-ref Library"
echo "========================================================"
echo "Reference: https://github.com/agentskills/agentskills"
echo ""

# Remember repository root and use absolute paths to avoid cd/OLDPWD issues
REPO_ROOT="$(pwd)"
SKILLS_REF_VENV="$REPO_ROOT/$SKILLS_REF_DIR/.venv"
SKILLS_REF_BIN="$SKILLS_REF_VENV/bin/skills-ref"

# Check if skills-ref is already installed
if [ ! -d "$SKILLS_REF_VENV" ]; then
    echo "📦 Installing skills-ref library..."
    echo ""

    if [ ! -d "$SKILLS_REPO_DIR" ]; then
        git clone --depth 1 https://github.com/agentskills/agentskills.git "$SKILLS_REPO_DIR"
    fi

    cd "$SKILLS_REF_DIR" || exit
    cd skills-ref || exit

    if command -v uv &> /dev/null; then
        echo "Using uv to install..."
        uv sync
    else
        echo "Using pip to install..."
        python3 -m venv .venv
        source .venv/bin/activate
        pip install -e .
    fi
    echo ""

    cd "$REPO_ROOT" || exit
fi

# Validate each skill with the installed binary directly
if [ ! -x "$SKILLS_REF_BIN" ]; then
    echo "❌ skills-ref executable not found at $SKILLS_REF_BIN"
    exit 1
fi

# Track results
PASSED=0
FAILED=0
FAILED_SKILLS=()

echo "Running validation..."
echo ""

# Validate each skill
for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    printf "  %-30s" "$skill_name"

    output=$("$SKILLS_REF_BIN" validate "$skill_dir" 2>&1)
    if echo "$output" | grep -q "Valid skill"; then
        echo "✓"
        ((PASSED+=1))
    else
        echo "✗"
        ((FAILED+=1))
        FAILED_SKILLS+=("$skill_name")
        echo "${output//^/    }" # output with indentation
    fi
done

echo ""
echo "========================================================"
echo "Summary:"
echo "  ✓ Passed: $PASSED"
echo "  ✗ Failed: $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "✅ All skills are valid!"
    exit 0
else
    echo "❌ Failed skills:"
    for skill in "${FAILED_SKILLS[@]}"; do
        echo "  - $skill"
    done
    exit 1
fi
