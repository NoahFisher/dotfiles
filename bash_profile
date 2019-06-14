[[ -s ~/.bashrc ]] && source ~/.bashrc

# git auto completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/redis@4.0/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

# python
export PATH="~/.pyenv/versions/3.5.2/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
