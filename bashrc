# Tools
# ==============================
# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VISUAL=vim
export EDITOR="$VISUAL"

# rg
alias rg='rg --hidden' # search hidden files (.rubocop)

# tmux
alias tmux='tmux -2'
alias tat='tmux attach -t '

# Docker
alias dc='docker-compose'

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

# Git (most common ones)
# ==============================
alias ga='git add -A'
alias gam='git commit --amend'
alias gb='git branch -v'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git l'
alias gr1='git reset --soft HEAD~1'
alias gr2='git reset --soft HEAD~2'
alias gr='git rebase'
alias gs='git status'

# aliases
# ==============================
alias ae='vim ~/.bashrc'
alias editssh='vim ~/.ssh/config'

# Directories
# ==============================
alias cdd='cd ~/dev/'
alias cdw='cd ~/dev/ehr_backend'
alias cdot='cd ~/dotfiles/'
alias cdssh='cd ~/.ssh'
