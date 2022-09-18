source /Users/z/git/zeke/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/Users/z/git/github/awssume/bin:$PATH
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/Users/z/Library/Python/2.7/bin"
export PATH="$PATH:/Users/z/git/github/github/bin"
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH # pipx
# export PATH=~/go/bin:$PATH # for local builds of `cog`

# gcloud
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.history
export NODE_REPL_HISTORY_FILE=$HOME/.node_repl_history
setopt append_history
hist() { cat $HISTFILE | grep "$*"; }

export EDITOR="code"

# brew install tree
tree() {
  command tree -I 'node_modules' "$@"
}

# https://wilsonmar.github.io/maximum-limits/
# inotify instance limit reached
# sudo launchctl limit maxfiles 65536 200000

dir() {
  mkdir -p $1
  cd $1
}

proj() {
  mkdir -p $1
  cd $1
  yarn init --yes
  npm i -D jest standard standard-markdown
  npe scripts.test "jest && standard --fix && standard-markdown"
  npe scripts.watch "jest --watch --notify --notifyMode=change --coverage"
  npe standard.env.jest true
  touch index.js test.js
  echo ".env" > .gitignore
  echo ".npmrc" >> .gitignore
  echo "coverage" >> .gitignore
  echo "node_modules" >> .gitignore
  edit .
}

add-npm-script() {
  set -x
  local filename=script/$1.js
  mkdir -p script
  echo "#!/usr/bin/env node" >> $filename
  echo "" >> $filename
  chmod +x $filename
  npe scripts.$1 "node $filename"
}

alias aliases='edit ~/git/zeke/dotfiles/.aliases.sh'
source ~/git/zeke/dotfiles/.aliases.sh
source ~/git/zeke/dotfiles/.git_helpers.sh
source ~/git/zeke/dotfiles/.npm_completion.sh
source ~/git/zeke/dotfiles/.gcp_helpers.sh
source ~/git/zeke/dotfiles/env.sh # secrets!

# Find all non-hidden files in the current path
ff() { find . -iname '*'$*'*' -type f ! -iname ".*" ! -path "*node_modules*"; }

# Find all non-hidden directories in the current path
fd() { find . -iname '*'$*'*' -type d ! -iname ".*" ! -path "*node_modules*"; }

# Find all files and directories in the current path,
# ignoring hidden files and node_modules
# f() { find . -iname '*'$*'*' ! -iname ".*" ! -path "*node_modules*"; }
f() { find . -iname '*'$*'*' ! -iname ".*"; }
alias fa=f

in() {
  mdfind \"$*\" -onlyin .
}

# Find files matching pattern $1 and copy them to directory $2
# fcopy svg ~/Desktop
fcopy() {
  ff $1 | xargs -I {} cp {} $2
}

edit() {
  code ${1:-.} # default to .
}

serve() {
  port=$1
  python -m SimpleHTTPServer ${port:=8000}
}


# Convert
# https://goo.gl/iOCPs9
# Usage: mov2gif some.mov
# The gif will be named after the mov
mov2gif(){
  infile=$1
  outfile=${infile/.mov/.gif}
  echo "ffmpeg -i $infile -pix_fmt rgb24 -r 15 -f gif - | gifsicle --optimize=3 --delay=3 > $outfile"
  ffmpeg -i $infile -pix_fmt rgb24 -r 15 -f gif - | gifsicle --optimize=3 --delay=3 > $outfile
}

review_pr() {
  git fetch origin refs/pull/$1/head && git checkout -b pr-$1 FETCH_HEAD
}

mv_screenshots() {
  mv ~/Desktop/Screen\ Shot* ~/Google/Screenshots
  mv ~/Desktop/Screen\ Recording* ~/Google/Screenshots
}

# set up a tiny project to try out an npm module
try_npm_module() {
  module=$1
  cd ~/Desktop
  mkdir -p "$module-test"
  cd "$module-test"
  echo "{}" > package.json
  printf "const $module = require('$module')\n\n" > index.js
  npm i $module
  $EDITOR .
}

function pip-install-save { 
    pip install $1 && pip freeze | grep $1 >> requirements.txt
}

command_not_found_handler() {
  echo "$@" >> $HOME/.mistyped_commands
  echo "$@ command not found. saved to $HOME/.mistyped_commands"
  exit 127
}

# eval "$(nodenv init -)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# eval "$(rbenv init -)"
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# BEGIN PYENV

# https://github.com/sindresorhus/pure
# fpath+=("/usr/local/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
# PURE_PROMPT_SYMBOL=$
PURE_PROMPT_SYMBOL=∴


# (The below instructions are intended for common
# shell setups. See the README for more guidance
# if they don't apply and/or don't work for you.)

# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# If your ~/.profile sources ~/.bashrc,
# the lines need to be inserted before the part
# that does that. See the README for another option.

# If you have ~/.bash_profile, make sure that it
# also executes the above lines -- e.g. by
# copying them there or by sourcing ~/.profile

# Load pyenv into the shell by adding
# the following to ~/.bashrc:

eval "$(pyenv init -)"

# Make sure to restart your entire logon session
# for changes to profile files to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

# END PYENV

# Created by `pipx` on 2021-09-21 04:18:31
export PATH="$PATH:/Users/z/.local/bin"

export PATH="$HOME/.poetry/bin:$PATH"