#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
if which ruby >/dev/null && which gem >/dev/null; then
    export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
fi
export PATH="${HOME}/usr/bin:/usr/lib/ccache/bin/:${PATH}"

# Aliases
alias ls='ls --color=auto'
alias prettyjson='python -m json.tool'
alias agp='ag --python'
alias agj='ag --js'
alias agc='ag --cpp --cc'
alias git-daemon='git daemon --reuseaddr --base-path=${HOME}/src'
alias tmux='tmux -2'
export PYTHONDONTWRITEBYTECODE=1
export ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python2
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Prompt
# PS1='[\u@\h \W]\$ '
source /usr/share/git/completion/git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "[\u@\h \w ]" " \\\\$ "'
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

# Misc
export HISTTIMEFORMAT="%d/%m/%y %T "
export EDITOR='vim'
# TERM="screen-256color"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
