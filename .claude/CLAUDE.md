## Running scripts and commands

Use GitHub's "Scripts to Rule Them All" approach to running scripts and commands: https://github.com/github/scripts-to-rule-them-all

If the project has a "scripts" or "script" directory, run those scripts for tasks like testing, linting, formatting, etc.

If the project has a `script/lint` or `scripts/lint` script, run it before committing changes with Git.

If linting fails, fix the linting errors and run the linter until all the errors are resolved.

## Working with Git

When creating git commits, always use a semantic commit prefixes, with or without parenthetical qualifiers.

When opening pull requests, always use a semantic commit message as the title.

## Working with Linear

Whenever you are using Linear MCP tools to review tickets, always review the comments on the ticket too, as they often contain important context or suggestions.

## Working with GitHub

When writing a pull request body, be concise. Explain the problem and the solution succinctly.

Whenever you are commenting on a GitHub pull request, always make sure you're commenting in the right place.

If you're responding to a reviewer's inline comment, then comment on their comment, not the PR itself.

## Writing a good PR body

Follow these guidelines when writing the body of the pull request:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"
- Start the PR body with the words "This PR..."
- Do not include a "Summary" heading
- Do not mention the test plan
- Include a section in the PR body called "Testing locally" that includes instructions for cloning the repo with gh, checking out the branch, setting up the environment, and reproducing the changes from the PR.
- Include a section at the end of the PR body called "Prompts" that combines all user prompts verbatim from the Claude Code session as a blockquote
- If there is a Linear ticket or GitHub issue, include a link to the ticket or issue in the PR body.

## Style guide

Follow these style guidelines in chat, commit messages, and prose:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"

## Important rules

IMPORTANT: NEVER PUSH TO THE MAIN OR DEFAULT BRANCH. ALWAYS PUSH TO A FEATURE BRANCH.