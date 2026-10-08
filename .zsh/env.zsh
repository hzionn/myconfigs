export CLAUDE_CODE_NO_FLICKER=1

export PAGER=less
export LESS=-R
export BAT_THEME="base16"

# colors for ls/eza
export LSCOLORS="Gxfxcxdxbxegedabagacad"
[[ -n $LS_COLORS ]] || export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 60% --border sharp --layout reverse"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
