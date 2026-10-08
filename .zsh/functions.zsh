# `history` with no args shows everything (zsh's default shows only the last 16)
history() {
  if (( $# )); then builtin fc -l "$@"; else builtin fc -l 1; fi
}

cdf() {
  local base="${1:-.}"
  local d

  # Define dot folders to KEEP (whitelist)
  local keep_dot_dirs=(
    ".config"
    ".agents"
    ".codex"
    ".claude"
  )

  # Construct ignore patterns:
  # 1. Ignore ALL dotfiles/folders (.*)
  # 2. Un-ignore (!) the specific ones we want to keep
  local ignore_list=".*"
  for dir in "${keep_dot_dirs[@]}"; do
    ignore_list+=$'\n!'"$dir"
  done

  d="$(
    fd --type d --max-depth 5 \
      --hidden --follow \
      --exclude .git \
      --exclude node_modules \
      --exclude __pycache__ \
      --exclude .venv \
      --exclude venv \
      --exclude dist \
      --exclude build \
      --exclude OrbStack \
      --exclude Library \
      --exclude Applications \
      --ignore-file <(echo "$ignore_list") \
      . "$base" \
    | fzf --height 60% --layout=reverse --border \
          --preview 'ls -a --color=always {} | head -200' \
          --preview-window=right:60%
  )" || return

  [[ -n "$d" ]] && cd -- "$d"
}

update() {
  brew update && brew upgrade -y
  uv tool upgrade --all
  codex update
  claude --update
  agy update

  npm install -g --prefix "$HOME/.local" \
    @agentclientprotocol/codex-acp@latest \
    @agentclientprotocol/claude-agent-acp@latest
}

t() {
  if (( $# > 0 )); then
    command tmux "$@"
    return
  fi

  local session_name="${PWD:t}"
  local -a tmux_cmd=(tmux)

  if [[ -n ${TMUX_SOCKET:-} ]]; then
    tmux_cmd+=(-S "$TMUX_SOCKET")
  fi

  session_name=${session_name//[^[:alnum:]_.-]/-}
  "${tmux_cmd[@]}" new-session -A -s "$session_name"
}
