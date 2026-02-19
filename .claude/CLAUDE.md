## Running scripts and commands

- Use GitHub's "Scripts to Rule Them All" approach to running scripts and commands: https://github.com/github/scripts-to-rule-them-all
- If the project has a "scripts" or "script" directory, run those scripts for tasks like testing, linting, formatting, etc.
- If the project has a `script/lint` or `scripts/lint` script, run it before committing changes with Git.
- If linting fails, fix the linting errors and run the linter until all the errors are resolved.

## Working with Git

- When creating git commits, always use a semantic commit prefixes, with or without parenthetical qualifiers.
- When opening pull requests or merge requests, always use a semantic commit message as the title.

## Working with Node.js and npm

- Always use `npx` when running global npm CLIs, e.g. `npx wrangler` instead of `wrangler`

## Working with Cloudflare

- Always using JSONC for Workers configs

## Working with GitHub and GitLab

- Use `gh` for GitHub repositories and `glab` for GitLab repositories.
- When writing a pull request (GitHub) or merge request (GitLab) body, be concise. Explain the problem and the solution succinctly.
- Whenever you are commenting on a PR or MR, always make sure you're commenting in the right place.
- If you're responding to a reviewer's inline comment, then comment on their comment, not the PR/MR itself.
- After creating or updating a pull request or merge request or issue, offer to open the URL in my default browser for me.

## Writing a good PR body

Follow these guidelines when writing the body of the pull request:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"
- Start the PR body with the words "This PR..."
- Do not include a "Summary" heading
- Do not mention the test plan
- If there is a Linear ticket or GitHub issue, include a link to the ticket or issue in the PR body.
- If there is a GitLab issue, include a link to the issue in the MR body.

## Style guide

Follow these style guidelines in chat, commit messages, and prose:

- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive", "utilize", "implement", "exhaustive", "simplify", "optimize", "seamlessly"
- When writing markdown, avoid using headings smaller than H2
- When writing markdown, don't use bold.

## Types and documentation

- Prefer types over prose documentation for API contracts. Types are executable and can't drift from the implementation.
- Define schemas (e.g. Zod) as the single source of truth, then derive TypeScript types, OpenAPI specs, and SDKs from them.
- Use schema-first design: the schema defines the contract, and the implementation conforms to it. Don't generate types from runtime behavior.
- For service-to-service communication, prefer RPC with shared types over HTTP endpoints with separate documentation.
- Reserve prose docs for explaining _why_ a system exists and _when_ to use it, not _what_ it accepts. Types handle the _what_.
- If an API is too complex to type, that's a design problem worth fixing.

## Fetching data

If you make web requests to public pages and get blocked by sites like OpenAI's docs pages returning 403 status codes, use Chrome Devtools MCP to open the page and get the content.

## Important rules

- IMPORTANT: NEVER PUSH TO THE MAIN OR DEFAULT BRANCH. ALWAYS PUSH TO A FEATURE BRANCH.
- IMPORTANT: If your last message included HTTP or HTTPS URLs, offer to open those for me in my default browser.
- Don't push commits to branches with PRs that have already been merged.