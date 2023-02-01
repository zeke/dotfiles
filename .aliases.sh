alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias build='npm run build'
alias c='git checkout'
alias cherry='git cherry-pick'
alias co='git checkout'
alias cod=code
alias comit=commit
alias commits=glog
alias config='edit ~/.zshrc'
alias cont='git add -A && git rebase --continue'
alias copy='pbcopy'
alias cp='cp -r'
alias d='cd ~/Desktop'
alias dev='npm run dev'
alias down='cd ~/Downloads'
alias exiot=exit
alias exot=exit
alias forks='cd ~/git/forks'
alias fpush='git push -f origin HEAD'
alias git=hub
alias github='cd ~/git/github'
alias global='npm install --global'
alias glog='git log --pretty=oneline'
alias gs='git status -sb'
alias h=/usr/local/bin/heroku
alias home='cd ~'
alias i='npm install'
alias la='ls -A1'
alias m='git checkout main'
alias main='git checkout main'
alias paste=pbpaste
alias pop='git stash pop'
alias pull='git pull'
alias push='git push -u origin HEAD'
alias refresh='source ~/.zshrc; echo ".zshrc sourced"'
alias s='npm start'
alias settings=config
alias stash='git stash'
alias status='git status'
alias t='npm test'

alias try='trymodule --clear && trymodule'
alias x='exit'
alias z='cd ~/git/zeke'
alias zeke='cd ~/git/zeke'
alias camera_restart="sudo killall VDCAssistant"
alias watch_repo='watch-gh-repos'
alias unwatch_repo='watch-gh-repos --unwatch'

alias ghs='GH_SSL=1 ENABLE_EMAIL_PREVIEWS=1 script/server'
alias ghd='GH_SSL=1 ENABLE_EMAIL_PREVIEWS=1 bin/server' # --debug
alias strap='script/bootstrap --local && bin/rake db:migrate db:test:prepare'

# alias t='./bin/rails test; ./bin/rspec'
# time ./bin/rspec spec/services/dotcom/file_sync_service_spec.rb:1
# time ./bin/rails test test/components/pricing/price_tag_test.rb:38

alias standup="$EDITOR ~/git/zeke/replicate-stuff/standups/standup-$(date '+%Y-%m-%d').md"
alias standup_tomorrow="$EDITOR ~/git/zeke/replicate-stuff/standups/standup-$(date -v+1d '+%Y-%m-%d').md"
alias standup_yesterday="$EDITOR ~/git/zeke/replicate-stuff/standups/standup-$(date -v-1d '+%Y-%m-%d').md"
alias standup_day_before_yesterday="$EDITOR ~/git/zeke/replicate-stuff/standups/standup-$(date -v-2d '+%Y-%m-%d').md"

alias standups="$EDITOR ~/git/zeke/replicate-stuff/standups"
alias today=standup
alias tomorrow=standup_tomorrow
alias yesterday=standup_yesterday
alias day_before_yesterday=standup_day_before_yesterday

alias fig="docker compose"