#!/usr/bin/env bash
# Set up these dotfiles on a new machine (safe to re-run).
#
#   curl -fsSL https://raw.githubusercontent.com/hzionn/myconfigs/main/.config/dotfiles/bootstrap.sh | bash
#   curl -fsSL ... | bash -s -- --packages    # also install brew/apt packages
#
# Existing files that would be overwritten are moved to ~/.dotfiles-backup/<timestamp>/.
set -euo pipefail

REPO="${DOTFILES_REPO:-https://github.com/hzionn/myconfigs.git}"
PUSH_URL="${DOTFILES_PUSH_URL:-git@github.com:hzionn/myconfigs.git}"
GIT_DIR="$HOME/.dotfiles"
LISTS="$HOME/.config/dotfiles"

dot() { git --git-dir="$GIT_DIR" --work-tree="$HOME" "$@"; }

# --- clone ---
if [[ -d $GIT_DIR ]]; then
  echo "==> $GIT_DIR already exists, skipping clone"
else
  echo "==> cloning $REPO"
  git clone --bare "$REPO" "$GIT_DIR"
fi

# --- repo config (local settings are not cloned) ---
dot config status.showUntrackedFiles no
# a bare clone has no fetch refspec, so origin/main would never update
dot config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
[[ -n $PUSH_URL ]] && dot remote set-url --push origin "$PUSH_URL"
dot fetch --quiet origin
dot branch --quiet --set-upstream-to=origin/main main

# --- checkout, backing up anything in the way ---
if [[ -z $(dot ls-files) ]]; then
  backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
  while IFS= read -r f; do
    if [[ -e $HOME/$f || -L $HOME/$f ]]; then
      mkdir -p "$backup/$(dirname "$f")"
      mv "$HOME/$f" "$backup/$f"
      echo "    backed up ~/$f"
    fi
  done < <(dot ls-tree -r --name-only HEAD)
  echo "==> checking out"
  dot checkout --quiet main
  [[ -d $backup ]] && echo "==> old files saved in $backup"
else
  echo "==> already checked out, skipping (see: dotfiles status)"
fi

# --- packages (opt-in) ---
install_list() {  # <file> <command...>: run command with the non-empty, non-comment lines of file
  local file=$1; shift
  [[ -r $file ]] || return 0
  grep -vE '^[[:space:]]*(#|$)' "$file" | xargs "$@"
}

if [[ ${1:-} == --packages ]]; then
  if command -v brew >/dev/null; then
    echo "==> installing brew packages"
    install_list "$LISTS/brew-packages.txt" brew install
    [[ $(uname) == Darwin ]] && install_list "$LISTS/brew-cask-packages.txt" brew install --cask
  elif command -v apt-get >/dev/null; then
    echo "==> installing apt packages"
    sudo apt-get update
    install_list "$LISTS/apt-packages.txt" sudo apt-get install -y
  else
    echo "==> no brew or apt-get found, skipping packages"
  fi
fi

echo "==> done. Open a new shell; manage files with the 'dotfiles' alias."
