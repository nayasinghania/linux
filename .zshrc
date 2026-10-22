autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

export PATH=$PATH:/home/naya/.spicetify

eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias update='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm && sudo paccache -rk1 && yay -Sc --noconfirm && yay -Yc --noconfirm && sudo rm -rf /var/cache/pacman/pkg/download-*'
alias zed='zeditor'
