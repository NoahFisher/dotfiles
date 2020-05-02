[[ -s ~/.bashrc ]] && source ~/.bashrc

# git commands auto completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git branch autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/redis@4.0/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

# python
export PATH="~/.pyenv/versions/3.5.2/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export CPPFLAGS=-I$(brew --prefix openssl)/include
export LDFLAGS=-L$(brew --prefix openssl)/lib

# Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="$HOME/.cargo/bin:$PATH"

# Colors
export TERM=xterm-256color

export BASH_SILENCE_DEPRECATION_WARNING=1

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# Hombrew doctor addition
export PATH="/usr/local/sbin:$PATH"

export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
