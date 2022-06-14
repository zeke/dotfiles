# GitHub Desktop (Electron version)
gd() {
  local dir=${1:-.}
  /usr/local/bin/github $dir
}

# commit "fix all the things"
# quotes not required unless using apostrophes and suchlike
# Usage: commit all the things
commit() {
  git add .
  git commit -avm "$*" --allow-empty
}

coco() {
  local msg="$*"
  git checkout -b "${msg//[ \/:]/-}" 
  commit $msg
}

upgrade_cog() {
  sudo rm $(which cog)
  sudo curl -o /usr/local/bin/cog -L https://github.com/replicate/cog/releases/latest/download/cog_`uname -s`_`uname -m`
  sudo chmod +x /usr/local/bin/cog
}

update_cog() {
  upgrade_cog
}

# quick pull request!
# create a branch, commit, and PR all in one.
qpr() {
  local msg="$*"
  git checkout -b "${msg//[ \/:]/-}" 
  commit $msg
  pr
}

# undo local commits and unstage files
# uncommit # undoes 1 commit by default
# uncommit 3
uncommit() {
  count=$1
  git reset --soft HEAD~${count:-1}
  git reset
}

track() {
  git checkout --track $1
}

# `pr` to open a pull request from scratch
# `pr <issue-id> to convert an existing issue
pr() {
  push
  # use last commit message as PR title
  local msg=$(git reflog -1 | sed 's/^.*: //')
  echo "Creating PR: $msg"
  hub pull-request -m "$msg" -o
}

# Usage: fetch some-remote-branch
fetch() {
  git fetch origin $1:$1 && git checkout $1
}

# Blow away the local branch then fetch the remote
# Usage: fetch some-remote-branch
refetch() {
  git branch -D $1 && git fetch origin $1:$1 && git checkout $1
}

deploy() {
  if [ "$1" ]; then
    commit $*
  fi
  git push origin master
  git push heroku master
}

# Type `gd branchname` to list files that differ from current branch
gdiff() {
  git diff --name-status $(git symbolic-ref --short HEAD) $1
}

clone() {
  git clone $1
  cd $(basename $1)
  $EDITOR .
}

fork() {
  forks && clone $1
}

prune() {
  echo "Remove a git branch, locally and remotely."
  local branch=$(branches | pick)
  git branch -D $branch
  git push origin :$branch
}

# List branches in reverse chronological order. http://goo.gl/1EKFx
alias branches="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias bb=branches

# https://robots.thoughtbot.com/announcing-pick
# brew install pick
b() {
  git checkout $(branches | pick)
}

# Create a new issue with ghi
# issue() { ghi open -m "$*"; }

repo(){ open "https://github.com/$1" }

git_files_touched_by() {
  git log --no-merges --author="$1" --stat --name-only --pretty=format:"" | sort -u
}

git_files_untouched_by() {
  git log --no-merges --stat --name-only --pretty=format:"" | sort -u > /tmp/all
  git log --no-merges --author="$1" --stat --name-only --pretty=format:"" | sort -u > /tmp/user
  comm -3 /tmp/all /tmp/user
}