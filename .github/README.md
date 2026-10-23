# my dotfiles

This repo is for tracking and storing my dotfiles across multiple devices.

It is a [git bare repo](https://www.atlassian.com/git/tutorials/dotfiles) whose work tree is `$HOME`, so the file structure mirrors exactly where everything lives on each machine. Repo-only files stay out of `~`: this README lives in `.github/` (GitHub still shows it on the repo page) and the setup script + package lists live in `~/.config/dotfiles/`.

## Contents

- zsh: zsh shell. `~/.zshenv` only sets `ZDOTDIR`; everything else lives in `~/.zsh/` (`.zprofile` for PATH, `.zshrc`, `aliases.zsh`, `functions.zsh`, `env.zsh`). No oh-my-zsh: the candy prompt, completion and key bindings are in `.zshrc`; `zsh-autosuggestions` and `zsh-syntax-highlighting` come from brew/apt (listed in `~/.config/dotfiles/`)
- Nvim: text editor. LazyVim config in `~/.config/nvim/`
- Vim: `~/.vim/vimrc`, fallback editor for machines without nvim
- Zed: text editor.
- Tmux: terminal multiplexer. plugins via tpm (`prefix + I` to install)
- Ghostty: terminal emulator.
- Alacritty: terminal emulator.
- Yazi: terminal file manager.
- fd: global ignore file, also used by the `cdf` fuzzy-cd function
- Karabiner: Re-map key-bindings.
- Nix: packages manager. different `nix-shell`
- Claude Code: status line script
- `~/.config/dotfiles/`: `bootstrap.sh` and the brew / brew cask / apt package lists

## How to

### set up a new device

```sh
curl -fsSL https://raw.githubusercontent.com/hzionn/myconfigs/main/.config/dotfiles/bootstrap.sh | bash

# or, to also install the brew (macOS) / apt (Linux) packages
curl -fsSL https://raw.githubusercontent.com/hzionn/myconfigs/main/.config/dotfiles/bootstrap.sh | bash -s -- --packages
```

The script clones over HTTPS (pushes go over SSH), configures the repo, and checks the files out. Any existing file that would be overwritten is moved to `~/.dotfiles-backup/<timestamp>/` first. It is safe to re-run.

<details>
<summary>manual steps (what the script does)</summary>

```sh
git clone --bare https://github.com/hzionn/myconfigs.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# local settings are not cloned, so set them on every device
dotfiles config status.showUntrackedFiles no
# a bare clone has no fetch refspec; without this origin/main never updates
dotfiles config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
dotfiles remote set-url --push origin git@github.com:hzionn/myconfigs.git
dotfiles fetch origin
dotfiles branch --set-upstream-to=origin/main main

# fails if a file already exists; move those away and retry
dotfiles checkout
```

</details>

### install packages

```sh
xargs brew install < ~/.config/dotfiles/brew-packages.txt
xargs brew install --cask < ~/.config/dotfiles/brew-cask-packages.txt
xargs sudo apt-get install -y < ~/.config/dotfiles/apt-packages.txt
```

### daily usage

The `dotfiles` alias is defined in `~/.zsh/aliases.zsh`; it is plain git pointed at the bare repo.

```sh
dotfiles status
dotfiles add ~/.config/foo/config
dotfiles commit -m "add foo config"
dotfiles push

# stop tracking a file or folder (keeps it on disk)
dotfiles rm -r --cached ~/.config/foo
```

Untracked files are hidden from `dotfiles status` (`showUntrackedFiles no`), so new configs must be added explicitly. Never `dotfiles add .` from `~`.

### create the repo from scratch (first device only)

```sh
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin <github repo>
dotfiles branch -M main
dotfiles push -u origin main
```

## References

- [Atlassian | The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Medium | How to manage your dotfiles with git](https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)
- [Hackmd | Git Bare Repo](https://hackmd.io/@hbdoy/BJz0V5tv8)
- [Github | config backups between misc machines](https://github.com/korbendallaskoop/dotfiles#readme)
- [Web | Your unofficial guide to dotfiles on Github](https://dotfiles.github.io/)
