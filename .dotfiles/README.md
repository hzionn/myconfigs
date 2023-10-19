# my dotfiles

this repo is for tracking and storing my dotfiles over multiple devices.

## Contents

- `.config/lvim/`: configuration for LunarVim
- `.config/alacritty/`: configuration for Alacritty
- `.tmux/`: tmux plugins
- `.tmux.conf`: configuration for tmux
- `.zshrc`: zsh profile
- `.p10k.zsh`: powerlevel10k config

## How to

> reference: [Medium | How to manage your dotfiles with git](https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

### init on primary device

```
mkdir .dotfiles
git init --bare $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

### usage

- create a github repo for storing dotfiles
```
git remote add origin <github repo>
git branch -M main
git push -u origin main
```

- add and commit files to repo
```
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "add .zshrc"
dotfiles push
```

- clone to secondary device
```
git clone --bare <github repo> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

## Notes

some of the plugins/features only function in `zsh`, and have to be installed manually:
- [editor]
    - nvim
    - lvim
- [terminal]
    - powerlevel10k
    - exa
    - tmux
