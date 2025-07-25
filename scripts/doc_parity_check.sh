#!/usr/bin/env bash
set -euo pipefail

# Determine the base branch to diff against. Default to origin/main.
BASE_BRANCH="${BASE_BRANCH:-origin/main}"

# Attempt to fetch the base branch. Fallback to the previous commit if unavailable.
if git show-ref --quiet "$BASE_BRANCH" || git fetch origin main "$BASE_BRANCH" >/dev/null 2>&1; then
    BASE_REF="$BASE_BRANCH"
elif git rev-parse --verify HEAD~1 >/dev/null 2>&1; then
    BASE_REF="HEAD~1"
else
    BASE_REF="HEAD"
fi

# List files changed compared to the chosen base reference
CHANGED_FILES=$(git diff --name-only "$BASE_REF"...HEAD)

# Flags for docs
AGENTS_CHANGED=false
WORKFLOW_CHANGED=false

if echo "$CHANGED_FILES" | grep -Fxq "AGENTS.md"; then
    AGENTS_CHANGED=true
fi
if echo "$CHANGED_FILES" | grep -Fxq "WORKFLOW.md"; then
    WORKFLOW_CHANGED=true
fi

# If roles or workflow definitions changed, ensure both docs changed
if echo "$CHANGED_FILES" | grep -qE '^(roles/|\.github/workflows/)'; then
    if [ "$AGENTS_CHANGED" != true ] || [ "$WORKFLOW_CHANGED" != true ]; then
        echo "Doc parity check failed: Changes to roles or CI workflows require updates to AGENTS.md and WORKFLOW.md." >&2
        exit 1
    fi
fi

echo "Doc parity check passed." 
