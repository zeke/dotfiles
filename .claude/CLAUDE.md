## Running scripts and commands

Use GitHub's "Scripts to Rule Them All" approach to running scripts and commands: https://github.com/github/scripts-to-rule-them-all

If the project has a "scripts" or "script" directory, run those scripts for tasks like testing, linting, formatting, etc.

If the project has a `script/lint` or `scripts/lint` script, run it before committing changes with Git.

If linting fails, fix the linting errors and run the linter until all the errors are resolved.

## Working with Git

When creating git commits, always use a semantic commit prefixes, with or without parenthetical qualifiers.

When opening pull requests or merge requests, always use a semantic commit message as the title.

## Working with Linear

Whenever you are using Linear MCP tools to review tickets, always review the comments on the ticket too, as they often contain important context or suggestions.

## Working with GitHub and GitLab

Use `gh` for GitHub repositories and `glab` for GitLab repositories.

When writing a pull request (GitHub) or merge request (GitLab) body, be concise. Explain the problem and the solution succinctly.

Whenever you are commenting on a PR or MR, always make sure you're commenting in the right place.

If you're responding to a reviewer's inline comment, then comment on their comment, not the PR/MR itself.

## Writing a good PR body

Follow these guidelines when writing the body of the pull request:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"
- Start the PR body with the words "This PR..."
- Do not include a "Summary" heading
- Do not mention the test plan
- Include a section in the PR body called "Testing locally" that includes instructions for cloning the repo with gh (or glab), checking out the branch, setting up the environment, and reproducing the changes from the PR.
- If there is a Linear ticket or GitHub issue, include a link to the ticket or issue in the PR body.
- If there is a GitLab issue, include a link to the issue in the MR body.

## Style guide

Follow these style guidelines in chat, commit messages, and prose:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"

## Fetching data

If you make web requests to public pages and get blocked by sites like OpenAI's docs pages return 403 status codes, use Chrome Devtools MCP to open the page and get the content.

## Important rules

IMPORTANT: NEVER PUSH TO THE MAIN OR DEFAULT BRANCH. ALWAYS PUSH TO A FEATURE BRANCH.
- Don't push commits to branches with PRs that have already been merged.