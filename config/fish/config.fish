# ~/.config/fish/config.fish

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Aliases
alias ll 'ls -lah'
alias la 'ls -A'
alias .. 'cd ..'
alias ... 'cd ../..'
alias zed 'zeditor'

# Disable the default greeting message
set -g fish_greeting

# Interactive-only configurations
if status is-interactive
    # Initialize optional prompt tools here
end
