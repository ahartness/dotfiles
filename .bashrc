 
 # If not running interactively, don't do anything
 # [[ $- != *i* ]] return
 
 # Directory Aliases
 alias ls='ls --color=auto'
 alias ll='ls -l --color=auto'
 alias grep='grep --color=auto'
 alias lla='ls -la --color=auto'
 alias vim='nvim'
 alias nv='nvim'
 alias dev='cd ~/Developer'
 alias dotfiles='cd ~/dotfiles'

 # Git Aliases
 alias gs='git status'
 alias gadd='git add .'
 alias gcm='git commit -m'
 alias gp='git pull'
 alias gpush='git push'
 
 PS1='[\u@\h \W]\$ '
 
# source /usr/share/nvm/init-nvm.sh

# Initialize oh-my-posh
# Add local bin to path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Init oh-my-posh and set theme
eval "$(oh-my-posh --init --shell bash --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/half-life.omp.json')"

