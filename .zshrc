# Where history is stored
HISTFILE="$HOME/.zsh_history"

# How many commands to keep
HISTSIZE=10000
SAVEHIST=10000

export PATH=$PATH:/home/naya/.spicetify
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"

alias update='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm && sudo paccache -rk1 && yay -Sc --noconfirm && yay -Yc --noconfirm && sudo rm -rf /var/cache/pacman/pkg/download-*'
alias zed='zeditor'
alias code='zeditor'
alias resume='zed /home/naya/resume'

# bun completions
[ -s "/home/naya/.bun/_bun" ] && source "/home/naya/.bun/_bun"
