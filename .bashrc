 
 # If not running interactively, don't do anything
 # [[ $- != *i* ]] return
 
 # Aliases
 alias ls='ls --color=auto'
 alias ll='ls -l --color=auto'
 alias grep='grep --color=auto'
 alias lla='ls -la --color=auto'
 alias vim='nvim'
 
 PS1='[\u@\h \W]\$ '
 
 source /usr/share/nvm/init-nvm.sh

# Initialize oh-my-posh
# Add local bin to path
export PATH=$PATH:/home/hartness/.local/bin

# Init oh-my-posh and set theme
eval "$(oh-my-posh --init --shell bash --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/half-life.omp.json')"

