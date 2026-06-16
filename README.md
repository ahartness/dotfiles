# dotfiles

Personal configs for my machine.

This repo is the source of truth for how I like my shell, editor, terminal, and other local tooling configured. It is organized like a dotfiles repo, but the goal is documenting and keeping my machine setup in one place rather than presenting a generic template.

## What's here

| Path | Purpose |
| --- | --- |
| `bashrc` | Bash shell settings |
| `zshrc` | Zsh shell settings (Mac) |
| `profile` | Login shell environment |
| `gitconfig` | Git defaults and aliases |
| `tmux.conf` | Tmux configuration |
| `config/` | App configs that live under `~/.config` |
| `vscode/` | VS Code settings |
| `zed/` | Zed settings |
| `omarchy/` | Archived (No Longer Using) |
| `link-configs.sh` | Symlink helper for `~/.config` and root dotfiles |

## Using these configs

I use this repo to bootstrap or sync my own environment.

The recommended way to link configs is with `link-configs.sh`.

### `link-configs.sh`

This script links:

- folders from `config/<name>` to `${XDG_CONFIG_HOME:-~/.config}/<name>`
- common root dotfiles from the repo to `~/.<name>` (for example `gitconfig` -> `~/.gitconfig`)

It can link specific items, or everything at once.

```bash
# Link specific config folders
./link-configs.sh hypr waybar nvim

# Link specific root dotfiles
./link-configs.sh bashrc gitconfig tmux.conf

# Link all config folders and known root dotfiles
./link-configs.sh --all
```

#### Options

- `-a, --all`: link all config folders under `config/` and common root dotfiles
- `-f, --force`: remove existing destinations instead of creating backups
- `-n, --dry-run`: print planned actions without changing files
- `-h, --help`: show help text

#### Backup and safety behavior

- If destination exists and `--force` is **not** used, it is moved to a timestamped backup like `*.bak.YYYYMMDDHHMMSS`.
- If destination is already the correct symlink, it is left untouched.
- If one or more requested items are missing, the script reports them and exits with a non-zero status.

#### Notes

- `--all` includes root file candidates: `bashrc`, `zshrc`, `profile`, `gitconfig`, and `tmux.conf` (if present in the repo root).
- The target config directory defaults to `~/.config` unless `XDG_CONFIG_HOME` is set.

## Notes

These configs are tuned for my workflow and machine, so they may assume tools, paths, or conventions that are specific to my setup.

## Future TODO Items

- [x] Add in my Niri config as that will be my future daily driver
- [ ] Update nvim config to work with new 0.12 update
- [ ] Figure out how to symlink Zed and VSCode/VSCodium
