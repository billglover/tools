# References
# https://github.com/jessfraz/dotfiles/blob/master/.bashrc
export BASH_CONF="bashrc"

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Directory listing aliases
alias ls='ls -G'
alias ll='ls -lh'
alias lla='ll -A'
alias lsa='ls -A'

# Add bash completion
for file in /usr/local/etc/bash_completion.d/* ; do
   source $file
done

# use a tty for gpg
GPG_TTY=$(tty)
export GPG_TTY

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	gpg-connect-agent /bye >/dev/null 2>&1
	gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# add alias for ssh to update the tty
alias ssh="gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
