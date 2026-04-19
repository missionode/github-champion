#!/bin/bash

# Achievement: Pair Extraordinaire 🤝
# Requirement: Co-author a merged pull request.

# 1. Create a new branch
BRANCH_NAME="feat/pair-up-$(date +%s)"
git checkout -b $BRANCH_NAME

# 2. Make a change
echo "Adding a collaborative feature on $(date)" >> PAIR_LOG.md

# 3. Commit with a Co-author
# We'll use the GitHub Actions bot as a co-author for this demonstration.
git add PAIR_LOG.md
git commit -m "Collaborative feature: Add log entry

Co-authored-by: github-actions[bot] <github-actions[bot]@users.noreply.github.com>"

# 4. Instructions
echo "--------------------------------------------------------"
echo "✅ Commit created with a Co-author!"
echo "--------------------------------------------------------"
echo "Next Steps:"
echo "1. Push this branch: git push origin $BRANCH_NAME"
echo "2. Open a Pull Request on GitHub."
echo "3. Merge the Pull Request."
echo "4. The 'Pair Extraordinaire' badge should appear within 24-48 hours."
echo "--------------------------------------------------------"
