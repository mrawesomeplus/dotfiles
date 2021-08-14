# Enable colors and change prompt:
autoload -U colors && colors  # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd     # Automatically cd into typed directory.
stty stop undef       # Disable ctrl-s to freeze terminal.
setopt interactive_comments

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history


[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/startscripts" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/startscripts"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

gitupload() {
    sudo git add -A
    sudo git commit -m "Fixes"
    sudo git push
}

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
