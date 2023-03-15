# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# if [ -f $HOME/.bash_profile ]; then
# 	. $HOME/.bash_profile
# fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# Modify PS variables
PS1="\[\e[0;37m\]\A\[\e[0m\] - \[\e[0;37m\]\u@\H\[\e[0m\] \[\e[1;33m\]<\$(git branch 2> /dev/null | grep '^*' | colrm 1 2)>\[\e[0m\] \[\e[1;32m\][\W]\[\e[0m\] \$ "

export EDITOR='vim'
export VISUAL='gvim'

# list
alias ls="exa -l --color=always --group-directories-first"
alias la="exa -la --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"

unset rc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ruben/.local/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ruben/.local/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ruben/.local/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ruben/.local/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH
