[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Me hate to type
alias dc='docker-compose'
alias pumalogs='tail -f ~/Library/Logs/puma-dev.log'

# Git (most common ones)
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

alias ae='vim ~/.bashrc'
alias editssh='vim ~/.ssh/config'

# Directories
alias cdd='cd ~/development/'
alias cds='cd ~/development/simplepractice'
alias cdw='cd ~/development/simplepractice/simplepractice'
alias cdf='cd ~/development/simplepractice/simplepractice/frontend'
alias cde='cd ~/development/simplepractice/ember-simplepractice'
alias cdfi='cd ~/development/simplepractice/financial-analytics'
alias cdwa='cd ~/development/simplepractice/warehouse-v0'
alias cdo='cd ~/development/open-source'
alias cdot='cd ~/dotfiles/'
alias cdmnotes='cd ~/Documents/meeting-notes/'
alias cdssh='cd ~/.ssh'

alias ngrok='~/development/ngrok'
