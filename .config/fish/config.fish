if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="exa --long --icons --no-permissions --no-user --git --time-style long-iso --time=modified --group-directories-first"
alias la="exa --long --icons --no-permissions --no-user --git --time-style long-iso --time=modified --group-directories-first -a"
alias tree="exa --tree"
alias cdfs="cd ~ && cd \$(find * -type d | fzf --height 50% --border --preview 'tree -C {}')"
alias cdf="cd \$(find * -type d | fzf --height 50% --border --preview 'tree -C {}')"
alias gnccu="cd ~ && cd Google\ Drive/My\ Drive/NCCU_courses/112-1"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dotfilesa="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add"
alias dotfilesr="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME rm -r --cached"
alias t="tmux"
alias ta="tmux attach"
