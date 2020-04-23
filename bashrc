# Tools
# ==============================
# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# rg
alias rg='rg --hidden' # search hidden files (.rubocop)

# tmux
alias tmux='tmux -2'
alias tat='tmux attach -t '

# Docker
alias dc='docker-compose'

# Ngrok
alias ngrok='~/development/ngrok'

# Bundler
alias be='bundle exec'

# History file changes
# https://www.shellhacks.com/tune-command-line-history-bash/
# ==============================
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTFILESIZE=10000
export PROMPT_COMMAND='history -a'
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="ls:ps:history"
shopt -s cmdhist

alias pumalogs='tail -f ~/Library/Logs/puma-dev.log'

# Git (most common ones)
# ==============================
alias ga='git add -A'
alias gam='git commit --amend'
alias gb='git branch -v'
alias gc='git commit'
alias gcn='git commit --no-verify'
alias gco='git checkout'
alias gd='git diff'
alias gl='git l'
alias gr1='git reset --soft HEAD~1'
alias gr2='git reset --soft HEAD~2'
alias gr='git rebase'
alias gs='git status'
# `gdmb` (g)it (d)elete (m)erged (b)ranches - Deletes all branches already merged on
# current branch
# FIXME: broken since squash and merge...
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# aliases
# ==============================
alias ae='vim ~/.bashrc'
alias editssh='vim ~/.ssh/config'

# Directories
# ==============================
alias cdd='cd ~/development/'
alias cds='cd ~/development/simplepractice'
alias cdw='cd ~/development/simplepractice/simplepractice'
alias cdf='cd ~/development/simplepractice/simplepractice/frontend'
alias cde='cd ~/development/simplepractice/ember-simplepractice'
alias cda='cd ~/development/simplepractice/simplepractice-events'
alias cdv='cd ~/development/simplepractice/simplepractice-video'
alias cdwa='cd ~/development/simplepractice/warehouse-v0'
alias cdi='cd ~/development/simplepractice/infrastructure'
alias cddb='cd ~/development/simplepractice/simplepractice-dbt'
alias cdk='cd ~/development/simplepractice/simplepractice-kanban'
alias cdo='cd ~/development/open-source'
alias cdot='cd ~/dotfiles/'
alias cdmnotes='cd ~/Documents/meeting-notes/'
alias cdssh='cd ~/.ssh'
alias cdq='cd ~/development/simplepractice/quartet'
alias cdehr='cd ~/dev/cvid/ehr_web'

# Workflow
# ==============================
# open pivotal or if you pass a link, open web pivotal at that story
alias pivotal='function _pivotal() {
  if [ -z "$1" ]
    then
      open -a "Brave Browser" https://www.pivotaltracker.com/n/projects/281125
    else
      open -a "Brave Browser" https://www.pivotaltracker.com/n/projects/281125/stories/$1
  fi
};_pivotal'
# open semaphore for the current branch (only works on main web repo)
alias semaphore='function _semaphore() {
  local branch="$(git symbolic-ref --short -q HEAD | tr / -)"
  echo "${branch}"
  open -a "Brave Browser" "https://simplepractice.semaphoreci.com/projects/simplepractice/branches"
};_semaphore'

# open asana on TE board (most common use case)
alias asana='open -a "Google Chrome" https://app.asana.com/0/578533578074205/list'

# Slava's update command
alias sp_update="bundle install && yarn install && be rails db:migrate && cd frontend && yarn && cd .."

# stripe testing cards:
# Charge
# 4242424242424242
# Inquiry
# 4000000000001976
# Dispute
# 4000000000000259
