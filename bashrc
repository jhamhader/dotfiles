#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
PATH="/usr/lib/ccache/bin/:${PATH}"

# Aliases
alias ls='ls --color=auto'
alias prettyjson='python -m json.tool'
alias agp='ag --python'
alias agj='ag --js'
alias agc='ag --cpp --cc'
ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python2

# Prompt
# PS1='[\u@\h \W]\$ '
source /usr/share/git/completion/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "[\u@\h \w ]" " \\\\$ "'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1

# Misc
HISTTIMEFORMAT="%d/%m/%y %T "
EDITOR='vim'
# TERM="screen-256color"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
