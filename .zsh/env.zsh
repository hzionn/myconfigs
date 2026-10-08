export CLAUDE_CODE_NO_FLICKER=1

export BAT_THEME="base16"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 60% --border sharp --layout reverse"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
