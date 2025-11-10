# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/z/.zsh/completions:"* ]]; then export FPATH="/Users/z/.zsh/completions:$FPATH"; fi
autoload -Uz compinit
compinit

# source /Users/z/git/zeke/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/Users/z/git/github/awssume/bin:$PATH
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/Users/z/Library/Python/2.7/bin"
export PATH="$PATH:/Users/z/git/github/github/bin"
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH # pipx
# export PATH=~/go/bin:$PATH # for local builds of `cog`

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
  echo "{}" > package.json
  npm pkg set type=module
  npm i -D standard
  npe scripts.test "standard --fix"
  touch index.js
  echo ".env" > .gitignore
  echo ".npmrc" >> .gitignore
  echo "coverage" >> .gitignore
  echo "node_modules" >> .gitignore
  edit .
}

ts-proj() {
  git clone https://github.com/zeke/typescript-project-starter $1
  cd $1
  rm -rf .git
  git init
  npm i
  npm test
  $EDITOR .
}

alias ts-project=ts-proj

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
source ~/git/zeke/dotfiles/env.sh # secrets!

# Find all non-hidden files in the current path
ff() { find . -iname '*'$*'*' -type f ! -iname ".*" ! -path "*node_modules*"; }

# Find all non-hidden directories in the current path
# fd() { find . -iname '*'$*'*' -type d ! -iname ".*" ! -path "*node_modules*"; }

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
  mv ~/Desktop/Screenshot* ~/Google/Screenshots
  # mv ~/Desktop/Screen\ Recording* ~/Google/Screenshots
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

function get_operation() {
  OPERATION_ID=$1 
  COMMAND="curl -s https://api.replicate.com/openapi.json | jq '.paths[][] | select(.operationId==\"$OPERATION_ID\")'"
  echo $COMMAND
  echo ""
  eval "$COMMAND" | jq
}
alias operation=get_operation

function get_prediction() {
  UUID=$1
  curl -s \
    -H "Authorization: Token $REPLICATE_API_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://api.replicate.com/v1/predictions/$UUID" | jq
}
alias p=get_prediction


function predictions() {
  UUID=$1
  curl -s \
    -H "Authorization: Token $REPLICATE_API_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://api.replicate.com/v1/predictions" | jq
}

function get_model() {
  MODEL_WITH_OWNER=$1
  curl -s \
    -H "Authorization: Token $REPLICATE_API_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://api.replicate.com/v1/models/$MODEL_WITH_OWNER" | jq
}

function get_model_version() {
  MODEL_OWNER=$1
  MODEL_NAME=$2
  VERSION_ID=$3
  curl -s \
    -H "Authorization: Token $REPLICATE_API_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://api.replicate.com/v1/models/$MODEL_OWNER/$MODEL_NAME/versions/$VERSION_ID" | jq
}



# command_not_found_handler() {
#   echo "$@" >> $HOME/.mistyped_commands
#   echo "$@ command not found. saved to $HOME/.mistyped_commands"
#   exit 127
# }

# eval "$(nodenv init -)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# eval "$(rbenv init -)"
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# https://github.com/sindresorhus/pure
# fpath+=("/usr/local/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
PURE_PROMPT_SYMBOL=$
# PURE_PROMPT_SYMBOL=∴


export PATH="$PATH:/Users/z/.local/bin"
export PATH="$HOME/.poetry/bin:$PATH"

# Hishtory Config:
export PATH="$PATH:/Users/z/.hishtory"
source /Users/z/.hishtory/config.zsh

# See also https://docs.atuin.sh/ as an alternative to hishtory


# # pnpm
# export PNPM_HOME="/Users/z/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end# Added by LM Studio CLI tool (lms)

export PATH="$PATH:/Users/z/.cache/lm-studio/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export PATH="$PATH:/Users/z/.lmstudio/bin"
export PATH="$HOME/.local/bin:$PATH"


eval "$(pyenv init --path)"
# eval "$(gh copilot alias -- zsh)"

# bun completions
[ -s "/Users/z/.bun/_bun" ] && source "/Users/z/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/Users/z/.deno/env"