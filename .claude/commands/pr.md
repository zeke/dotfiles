Create a branch off main, unless you're already on a branch.

Commit the changes atomically with semantic messages.

Push the branch to the remote repository.

Use the gh CLI to create a PR, or update existing PR if one exists.

If the repo is a fork, use the canonical repo as the base repo.

Use a semantic PR title.

Open the PR in the browser.

After the PR is opened, continually monitor the CI status every 10 seconds. If anything is failing then fix it, commit, push, and keep monitoring until all checks are passing.