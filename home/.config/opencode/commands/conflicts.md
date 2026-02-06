---
description: Fix git merge conflicts while preserving both current and incoming changes
agent: code
---

I need you to help fix git merge conflicts in this repository. Please:

1. First, identify all files with merge conflicts by running: `git diff --name-only --diff-filter=U`

2. For each file with conflicts:
   - Read the file and identify the conflict markers (<<<<<<<, =======, >>>>>>>)
   - Understand the context of the conflict by examining the surrounding code
   - Analyze what the "current" change (ours) and "incoming" change (theirs) are trying to accomplish
   - Determine if both changes can coexist, or if one should take precedence
   
3. When resolving conflicts:
   - Preserve functionality from both sides whenever possible
   - If changes are in different areas of the code, keep both
   - If changes conflict logically, choose the more complete/correct implementation
   - If unsure, add comments explaining the conflict and ask for clarification
   - Remove all conflict markers cleanly

4. After resolving all conflicts:
   - Run `git diff --name-only --diff-filter=U` again to verify no conflicts remain
   - Run any available tests or linters to ensure the code still works
   - Stage the resolved files with `git add`

5. Commit and push (if appropriate):
   - Check if there's an active merge/rebase in progress: `git status`
   - If merge/rebase is in progress and all conflicts are resolved, complete it:
     - For merge: `git commit` (no message needed, Git will use the default merge message)
     - For rebase: `git rebase --continue`
   - Check if the branch already has an upstream: `git rev-parse --abbrev-ref --symbolic-full-name @{u}`
   - Only push if upstream exists (command exits 0): `git push`
   - If upstream doesn't exist, inform the user but don't push

6. Provide a summary of:
   - Which files had conflicts
   - How each conflict was resolved
   - Whether the changes were committed and pushed
   - Any potential risks or follow-up actions needed

Start by identifying all files with conflicts and then work through them systematically.
