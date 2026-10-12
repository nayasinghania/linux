HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

export PATH=$PATH:/home/naya/.spicetify

eval "$(starship init zsh)"

alias update='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm && sudo paccache -rk1 && yay -Sc --noconfirm && yay -Yc --noconfirm && sudo rm -rf /var/cache/pacman/pkg/download-*'
alias zed='zeditor'
