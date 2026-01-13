Create a branch off main, unless you're already on a branch.

Commit the changes atomically with semantic messages.

Push the branch to the remote repository.

Use `gh` for GitHub repositories and `glab` for GitLab repositories.

Create a PR (GitHub) or MR (GitLab), or update the existing one if one exists.

If the repo is a fork, target the upstream repository:
- GitHub: `gh pr create --repo <upstream-owner>/<repo>`
- GitLab: `glab mr create --repo <upstream-owner>/<repo>`

Use a semantic PR/MR title.

Open the PR/MR in the browser.

After the PR/MR is opened, continually monitor the CI status every 10 seconds. If anything is failing then fix it, commit, push, and keep monitoring until all checks are passing.