source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# https://github.com/sindresorhus/pure
fpath+=("/usr/local/share/zsh/site-functions")
autoload -Uz promptinit && promptinit
prompt pure
PURE_PROMPT_SYMBOL=$

# PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/Users/z/git/github/awssume/bin:$PATH
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/Users/z/Library/Python/2.7/bin"
export PATH="$PATH:/Users/z/git/github/github/bin"

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

command_not_found_handler() {
  echo "$@" >> $HOME/.mistyped_commands
  echo "$@ command not found. saved to $HOME/.mistyped_commands"
  exit 127
}

eval "$(nodenv init -)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# eval "$(rbenv init -)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/crowdin@3/bin:$PATH"
