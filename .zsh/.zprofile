# Login shells. PATH is built here, once, so every shell inherits it.
typeset -U path   # keep PATH entries unique

[[ -r ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export BUN_INSTALL="$HOME/.bun"

# First match wins. Anything already in $path (system dirs etc.) stays at the end.
path=(
  $HOME/.local/bin
  $HOME/.antigravity-ide/antigravity-ide/bin
  $HOME/.antigravity/antigravity/bin
  $HOME/.opencode/bin
  $BUN_INSTALL/bin
  $HOME/.hermes/node/bin
  $HOME/.cargo/bin
  $HOME/go/bin
  $HOME/.npm-global/bin
  /opt/homebrew/bin
  $PYENV_ROOT/shims
  $path
)
