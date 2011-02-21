# $Id: .zshrc,v 1.10 2002/08/22 19:04:53 niemeyer Exp $

if [[ -f ~/.profile ]]; then
  . ~/.profile
fi

# Set prompt, without screen hack (%{^[k^[\%}).
PS1="[%n@%m %20<..<%~]%% "

# Set history file
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000

# Append custom functions to search path
fpath=($fpath "$HOME/.zsh/functions")

# Use known_hosts(2) to complete hosts for ssh/scp
ssh_hosts () {
  reply=($(sed "/^[0-9]/d;s/[, ].*\$//" ~/.ssh/known_hosts{,2} 2>/dev/null))
}
zstyle -e ':completion:*:ssh:*' hosts "ssh_hosts"
zstyle -e ':completion:*:scp:*' hosts "ssh_hosts"

# Enable colored completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Load nice zmv module
autoload -U zmv
alias zcp='zmv -C'
alias zln='zmv -L'

# Initialize completion system (-u ignores security check, so that root can
# use the same initialization files)
autoload -U compinit
compinit -u

# Usual alias
alias ls='ls --color=auto'

# Use vi keys
bindkey -v

# Use magic space to do history parameters expansion
bindkey ' ' magic-space

# Enable nice incremental search for vi mode
bindkey '^R' history-incremental-search-backward

# Automaticaly pushd non duplicated entries on cd, and limit stack size
setopt autopushd
setopt pushdignoredups
DIRSTACKSIZE=10

# Show completion matches automaticaly, and go back to last prompt
setopt autolist
setopt alwayslastprompt
setopt nocheckjobs

# Enable command correction
#setopt correct

# When using ! cmds, confirm first
setopt histverify

# Share history between multiple interpreters
#setopt share_history

# Complete in middle of words as well
setopt completeinword

# Do not hangup jobs and don't check for them
setopt nohup
#setopt nocheckjobs

# vim:et:ts=2:sw=2
