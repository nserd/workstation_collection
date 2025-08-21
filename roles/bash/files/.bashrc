# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.local/my/bin:$PATH"
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

unset rc

# Prompt
git-branch() {
    git branch --show-current 2>/dev/null | sed 's/^/ /'
}

export PS1='\[\e[1;94m\]\u\[\e[m\]\[\e[37m\][\[\e[m\]\w\[\e[33m\]$(git-branch)\[\e[37m\]]\[\e[m\]> '

# History
shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
export HISTCONTROL="ignoredups"
export HISTSIZE=10000