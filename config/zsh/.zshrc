autoload -U colors compinit
colors
PS1="%* %{$fg[green]%}%m %{$fg[red]%}%~ %{$reset_color%}%# "

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

## Terminal Keybinds to Emacs
bindkey -e

#Aliases

if [[ -r $ZDOTDIR/.zsh_alias ]]; then
    . $ZDOTDIR/.zsh_alias
fi

# Completion
compinit
if [[ -r $ZDOTDIR/.zsh_completion ]]; then
    . $ZDOTDIR/.zsh_completion
fi

# init fzf

eval "$(fzf --zsh)"
