# dotfiles

Setup for dotfiles across machines

## Requirements

Ensure you have the following packages

### Arch 

```bash
pacman -S git stow 
```

###MacOSX

```bash
brew install git stow
```

## Installation

Check out the dotfiles repo into your $HOME directory

```bash
git clone git@github.com/ahartness/dotfiles.git
cd dotfiles
```

Then use GNU Stow to create the symlinks

```bash
stow .
```
