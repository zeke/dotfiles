If the project has a "scripts" or "script" directory, favor those scripts for tasks like testing, linting, formatting, etc.

When creating git commits, always use a semantic commit prefixes, with or without parenthetical qualifiers.

When opening pull requests, always use a semantic commit message as the title.

When writing a pull request body, be concise. Explain the problem and the solution succinctly.

If the project has a script/lint or scripts/lint script, run it before committing changes.

If linting fails, fix the linting errors and run the linter until all the errors are resolved.

IMPORTANT: NEVER PUSH TO THE MAIN OR DEFAULT BRANCH. ALWAYS PUSH TO A FEATURE BRANCH.

## Writing a good PR body

Observe the following when writing the body of the pull request:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"
- Start the PR body with the words "This PR..."
- Do not include a "Summary" heading
- Do not mention the test plan
- Include a section in the PR body called "Testing locally" that includes instructions for cloning the repo with gh, checking out the branch, setting up the environment, and reproducing the changes from the PR.
- Include a section at the end of the PR body called "Prompts" that combines all user prompts verbatim from the Claude Code session as a blockquote at the bottom of the PR body, with the heading "Prompts"
- If there is a Linear ticket or GitHub issue, include a link to the ticket or issue in the PR body.