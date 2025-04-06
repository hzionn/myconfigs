# my dotfiles

This repo is for tracking and storing my dotfiles across multiple devices.

This file's structure mirrors how and where all of them will be stored in the `$HOME` directory on each machine.

## Contents

- zsh: zsh shell. `.zshrc`, `.zsh_aliases`, `.zsh_exports`
- Nix: packages manager. different `nix-shell`
- Nvim: text editor. for LazyVim
- Zed: text editor.
- Tmux: terminal multiplezer. tmux plugins
- Karabiner: Re-map key-bindings.
- Alacritty: terminal emulator.

## How to

### init on primary device

```
mkdir ~/.dotfiles
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

- `Git bare repo` is not suppose to store anything, but if there is a need to

```
# add file or folder to repo
alias dotfilesa='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'

# remove file or folder from repo
alias dotfilesr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME rm -r --cached'
```

- clone to secondary device

```
git clone --bare <github repo> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

- install brew packages to new device

```
brew install $(brew-packages.txt)
brew install --cask $(brew-cask-packages.txt)
```

## References

- [Medium | How to manage your dotfiles with git](https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)
- [Hackmd | Git Bare Repo](https://hackmd.io/@hbdoy/BJz0V5tv8)
- [Github | config backups between misc machines](https://github.com/korbendallaskoop/dotfiles#readme)
- [Web | Your unofficial guide to dotfiles on Github](https://dotfiles.github.io/)
