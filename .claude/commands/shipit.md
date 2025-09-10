Create a branch off main, unless you're already on a branch.

Commit the changes atomically with semantic messages.

Push the branch to the remote repository.

Use the gh CLI to create a PR, or update existing PR if one exists.

Use a semantic PR title.

Tips for writing a good PR body:
- Be concise and descriptive
- Don't oversell the changes. It's not an advertisement.
- Don't use fancy words like "comprehensive" or "utilize" or "implement"
- Start the PR body with the words "This PR..."
- Do not include a "Summary" heading
- Do not mention the test plan
- Combine all user prompts verbatim from the Claude Code session as a blockquote at the bottom of the PR body, with the heading "Prompts"

Open the PR in the browser.