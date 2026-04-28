# dotfiles

Personal configs for my machine.

This repo is the source of truth for how I like my shell, editor, terminal, and other local tooling configured. It is organized like a dotfiles repo, but the goal is documenting and keeping my machine setup in one place rather than presenting a generic Stow-based template.

## What's here

| Path | Purpose |
| --- | --- |
| `bashrc` | Bash shell settings |
| `zshrc` | Zsh shell settings |
| `profile` | Login shell environment |
| `gitconfig` | Git defaults and aliases |
| `tmux.conf` | Tmux configuration |
| `config/` | App configs that live under `~/.config` |
| `vscode/` | VS Code settings |
| `omarchy/` | Machine-specific extras and supporting config |

## Using these configs

I use this repo to bootstrap or sync my own environment. Some files can be symlinked into place, and others are here mainly so my setup is versioned and easy to reference.

If I want to link everything with GNU Stow:

```bash
git clone git@github.com/ahartness/dotfiles.git
cd dotfiles
stow .
```

## Notes

These configs are tuned for my workflow and machine, so they may assume tools, paths, or conventions that are specific to my setup.

## Future TODO Items

- [ ] Create a custom config for oh-my-posh -> `~/.config/ohmyposh/..config.json`
- [ ] Add a script to automate the installation process
- [ ] Update these with my current setup as the files have become outdated for Hyprland
