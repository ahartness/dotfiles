# If not running interactively, don't do anything
# [[ $- != *i* ]] return

# Hyprland uswm override
# if uwsm check may-start; then
#   exec uwsm start hyprland.desktop
# fi

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

# Directory Aliases
alias z='cd'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias lla='ls -la --color=auto'
alias grep='grep --color=auto'
alias nv='nvim .'
alias dotfiles='cd ~/dotfiles'

alias ld='lazydocker'
alias lg='lazygit'

# Git Aliases
alias gs='git status'
alias ga='git add .'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gp='git pull'
alias gpush='git push'

# Tmux aliases
alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

PS1='[\u@\h \W]\$ '

# source /usr/share/nvm/init-nvm.sh

# Initialize oh-my-posh
# Add local bin to path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Init oh-my-posh and set theme
eval "$(oh-my-posh --init --shell bash --config '~/.config/ohmyposh/half-life.omp.json')"

# Initialize fzf
eval "$(fzf --bash)"

# opencode
export PATH=/home/hrtns/.opencode/bin:$PATH
