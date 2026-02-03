# Bugbot PR Review Workflow

## Objective
Review bugbot comments on the current PR, triage issues, and respond appropriately.

## Steps

1. **Fetch PR comments** using `gh pr view --comments` to get all bugbot feedback
2. **Analyze each bugbot comment** to determine:
   - Is this a legitimate issue that should be fixed?
   - Is it a false positive or stylistic preference that can be ignored?
   - Does it improve code quality, security, or maintainability?
3. **Respond to each bugbot comment** by replying directly to the comment:
   - Reply "fixing" for issues you'll address
   - Reply "wontfix" for issues you're intentionally not addressing (with brief justification if needed)
4. **Fix legitimate issues** identified in the bugbot comments
5. **Verify fixes** by running relevant linters/tests
6. **Commit changes** if any fixes were made

## Notes
- Focus on substantive issues (bugs, security, performance) over style preferences
- Be pragmatic - not every suggestion needs to be implemented
- Document reasoning for "wontfix" decisions when non-obvious
