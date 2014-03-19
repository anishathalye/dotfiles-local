HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
autoload -Uz compinit && compinit
setopt correctall autocd
export TERM=rxvt
autoload -U colors && colors
PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

alias ls='ls --color=auto'
