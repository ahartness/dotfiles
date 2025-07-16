# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/xxxxx
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin

#eval "$(brew --prefix)/bin/oh-my-posh"
# Load Oh My Zsh Theme
eval "$(oh-my-posh --init --shell zsh --config '~/.config/ohmyposh/half-life.omp.json')"

# Directory Aliases
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias lla='ls -la --color=auto'
alias vim='nvim'
alias nv='nvim .'
alias dev='cd ~/workspace'
alias dotfiles='cd ~/dotfiles'

# Git Aliases
alias gs='git status'
alias ga='git add .'
alias gcm='git commit -m'
alias gp='git pull'
alias gpush='git push'

# fzf with git checkout, TODO: need to fix this
# gch() {
#  git checkout “$(git branch | fzf| tr -d ‘[:space:]’)”
# }

alias lla='ls -la --color=auto'
alias lld='ls -ld */ --color=auto'
alias python='python3'
alias lg='lazygit'

# Tmux aliases
alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

# exa for better ls 
alias ls='eza --icons=always'

# --- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd='z'

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Enable fzf for zsh
source <(fzf --zsh)

# Created by `pipx` on 2024-12-11 01:29:36
export PATH="$PATH:/Users/andrewhartness/.local/bin"

# pnpm
export PNPM_HOME="/Users/andrewhartness/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
