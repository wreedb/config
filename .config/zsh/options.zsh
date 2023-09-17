# vim:ft=zsh:fileencoding=utf-8

disable -r time
disable printf
disable which
disable echo

setopt notify
setopt autocd
setopt interactive_comments
setopt menucomplete
setopt extendedglob
setopt prompt_subst
setopt automenu
setopt autolist
setopt list_packed
setopt brace_ccl
setopt equals
setopt glob_dots
setopt multibyte
setopt rc_expand_param
setopt hist_expire_dups_first
setopt extended_history
setopt bang_hist
setopt hist_verify
setopt inc_append_history
setopt aliases
setopt correct
setopt path_dirs
setopt auto_continue
setopt prompt_cr
setopt bsd_echo
setopt emacs
setopt rm_star_silent
setopt posix_jobs
unsetopt hup
unsetopt beep
unsetopt bg_nice

zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort access
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache one
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:descriptions' format '%U%K{yellow} %F{green}-- %F{red} %BNICE!1! %b%f %d --%f%k%u'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- nothin here chief --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- nope, sus --%f'
zstyle ':completion:*' file-list all
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
