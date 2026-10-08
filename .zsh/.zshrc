# Interactive shells. PATH lives in .zprofile; aliases/functions/env are split out below.

# --- history ---
HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_DUPS
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

# --- shell options ---
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS
setopt MULTIOS LONG_LIST_JOBS INTERACTIVE_COMMENTS

# quote URL characters as you type/paste
autoload -Uz url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# --- completion ---
_zsh_cache="$HOME/.cache/zsh"
[[ -d $_zsh_cache ]] || mkdir -p $_zsh_cache

zmodload -i zsh/complist
WORDCHARS=''
unsetopt MENU_COMPLETE FLOW_CONTROL
setopt AUTO_MENU COMPLETE_IN_WORD ALWAYS_TO_END

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $_zsh_cache
zstyle '*' single-ignored show
bindkey -M menuselect '^o' accept-and-infer-next-history

autoload -Uz compinit
compinit -i -d $_zsh_cache/zcompdump
autoload -U +X bashcompinit && bashcompinit
unset _zsh_cache

# --- prompt: "candy" ---
autoload -U colors && colors
setopt PROMPT_SUBST

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"

# [branch] or [branch *] when dirty; nothing outside a git repo
git_prompt_info() {
  local ref line
  ref=$(command git symbolic-ref --short HEAD 2>/dev/null) \
    || ref=$(command git rev-parse --short HEAD 2>/dev/null) \
    || return 0
  command git status --porcelain --ignore-submodules=dirty 2>/dev/null | read -r line
  print -rn -- "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${line:+$ZSH_THEME_GIT_PROMPT_DIRTY}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

PROMPT=$'%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

# --- my config ---
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}   # completion menu uses the same colors as ls

# --- key bindings (vi mode) ---
bindkey -v

# terminfo "application mode" so the keys below send the codes terminfo expects
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  zle-line-init()   { echoti smkx }
  zle-line-finish() { echoti rmkx }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

typeset -A _keys=(
  kpp   up-line-or-history
  knp   down-line-or-history
  kcuu1 up-line-or-beginning-search
  kcud1 down-line-or-beginning-search
  khome beginning-of-line
  kend  end-of-line
  kcbt  reverse-menu-complete
  kdch1 delete-char
)
for _map in viins vicmd; do
  for _k _w in ${(kv)_keys}; do
    [[ -n ${terminfo[$_k]} ]] && bindkey -M $_map "${terminfo[$_k]}" $_w
  done
  bindkey -M $_map '^[[A'    up-line-or-beginning-search
  bindkey -M $_map '^[[B'    down-line-or-beginning-search
  bindkey -M $_map '^?'      backward-delete-char
  bindkey -M $_map '^[[3;5~' kill-word
  bindkey -M $_map '^[[1;5C' forward-word
  bindkey -M $_map '^[[1;5D' backward-word
done
unset _keys _map _k _w

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

# --- plugins (brew/apt packages; keep syntax-highlighting last) ---
for _p in zsh-autosuggestions zsh-syntax-highlighting; do
  for _d in ${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/share} /usr/share; do
    [[ -r $_d/$_p/$_p.zsh ]] && { source $_d/$_p/$_p.zsh; break }
  done
done
unset _p _d
