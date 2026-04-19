#!/bin/bash

# Achievement: Pull Shark 🦈 (Tier Booster)
# Requirement: Merge 16 (Bronze), 128 (Silver), or 1024 (Gold) PRs.

# Check for gh (GitHub CLI)
if ! command -v gh &> /dev/null
then
    echo "⚠️ GitHub CLI (gh) is NOT installed."
    echo "   Install it for better automation: brew install gh"
    exit 1
fi

# Check authentication
gh auth status || { echo "❌ Please run: gh auth login"; exit 1; }

# Ask for number of PRs to create
read -p "How many PRs would you like to create? (e.g., 5): " NUM_PRS

for ((i=1; i<=NUM_PRS; i++))
do
  BRANCH="shark-boost-$(date +%s)-$i"
  echo "🚀 Generating PR #$i on branch $BRANCH..."

  # Create branch and change
  git checkout -b $BRANCH
  echo "Shark Boost #$i on $(date)" >> SHARK_LOG.md
  git add SHARK_LOG.md
  git commit -m "Shark Boost: Merge #$i"

  # Push and create PR
  git push origin $BRANCH
  gh pr create --title "🦈 Shark Boost #$i" --body "Automated PR for achievement hunting." --base main --head $BRANCH

  # Immediately merge if YOLO is desired (though user already has it)
  # gh pr merge --merge --delete-branch

  # Return to main
  git checkout main
done

echo "✅ Generated $NUM_PRS PRs! Go to GitHub to merge them."
