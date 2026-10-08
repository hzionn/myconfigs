# Interactive shells. PATH lives in .zprofile; aliases/functions/env are split out below.

# --- history ---
HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}

# --- oh-my-zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="candy"
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${HOST%%.*}-${ZSH_VERSION}"
[[ -d ${ZSH_COMPDUMP:h} ]] || mkdir -p ${ZSH_COMPDUMP:h}
# zsh-syntax-highlighting should stay last
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# --- history behaviour ---
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

HISTORY_IGNORE='(git|git *|cat|cat *)'
zshaddhistory() {
  emulate -L zsh
  [[ $1 != ${~HISTORY_IGNORE} ]]
}

# --- my config ---
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

bindkey -v # use vim keybindings

# --- tool integrations ---
[[ -t 0 && -o zle && -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
(( $+commands[pyenv] )) && eval "$(pyenv init - --no-push-path --no-rehash zsh)"  # shims are placed in .zprofile
[[ -s $BUN_INSTALL/_bun ]] && source $BUN_INSTALL/_bun
[[ $TERM_PROGRAM == kiro ]] && . "$(kiro --locate-shell-integration-path zsh)"

# >>> otty shell integration >>>
# Added by Otty — toggle in Settings > Shell > Shell Integration.
# Inert unless launched by Otty (it sets $OTTY_SHELL_INTEGRATION).
if [ -n "$OTTY_SHELL_INTEGRATION" ] && [ -r "$OTTY_SHELL_INTEGRATION/otty-integration.zsh" ]; then
  . "$OTTY_SHELL_INTEGRATION/otty-integration.zsh"
fi
# <<< otty shell integration <<<
