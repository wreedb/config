# ~/.zshenv - env vars for my shell

declare -gx LOCALDIR="${HOME}/.local"
declare -gx LOCAL_BIN="${LOCALDIR}/bin"
declare -gx LOCAL_LIB="${LOCALDIR}/lib"
declare -gx LOCAL_SHARE="${LOCALDIR}/share"
declare -gx LOCAL_STATE="${LOCALDIR}/state"
declare -gx LOCAL_TMP="${LOCALDIR}/tmp"
declare -gx LOCAL_VAR="${LOCALDIR}/var"
declare -gx LOCAL_MAN="${LOCALDIR}/man"
declare -gx LOCAL_INFO="${LOCALDIR}/info"
declare -gx LOCAL_INCLUDE="${LOCALDIR}/include"
declare -gx LOCAL_MNT="${LOCALDIR}/mnt"
declare -gx LOCAL_MEDIA="${LOCALDIR}/media"
declare -gx LOCAL_OPT="${LOCALDIR}/opt"
declare -gx LOCAL_SRC="${LOCALDIR}/src"

declare -gx XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
declare -gx XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/usr/local/etc/xdg:/etc/xdg}"

declare -gx XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
declare -gx XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
declare -gx XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
declare -gx XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

declare -gx ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
declare -gx PROMPT="[%F{green}%n%f@%F{red}%m%f] (%F{magenta}%3~%f) %F{blue}%%%f "

declare -gx HISTFILE="${XDG_DATA_HOME}/zsh/history"
declare -gx HISTSIZE=3000
declare -gx SAVEHIST=3000

declare -gx CARGO_HOME="${XDG_DATA_HOME}/cargo"
declare -gx RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
declare -gx GOPATH="${XDG_DATA_HOME}/go"
declare -gx GOBIN="${GOPATH}/bin"
declare -gx GNUPGHOME="${XDG_DATA_HOME}/gnupg"

declare -gx LESSHISTFILE="/dev/null"

declare -gx GIT_CONFIG_SYSTEM="${XDG_CONFIG_HOME}/git/config"
declare -gx GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"
declare -gx GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"

declare -gx MANWIDTH=80
declare -gx MANPAGER=less
declare -gx PAGER=less
declare -gx TERMINAL=kitty
declare -gx BROWSER=firefox
declare -gx VIDEO=mpv
declare -gx IMAGE=nsxiv
declare -gx READER=mupdf
declare -gx OPENER=xdg-open
declare -gx FILEMANAGER=thunar

declare -gx BEMENU_OPTS="--fn 'JetBrains Mono 14' --border 1 --list 8 --prompt 'run: ' --bdr '#44475A' --tb '#21222C' --fb '#21222C' --tf '#6272A4' --ff '#50FA7B' --nb '#282A36' --ab '#282A36' --hb '#44475A' --nf '#BD93F9' --af '#BD93F9' --hf '#50FA7B'"

declare -gx LAUNCHER=bemenu-run

declare -gx LESS_TERMCAP_so="$(tput bold; tput setaf 3; tput setab 4)"
declare -gx LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 7)"
declare -gx LESS_TERMCAP_mb="$(tput bold; tput setaf 2)"
declare -gx LESS_TERMCAP_md="$(tput bold; tput setaf 6)"
declare -gx LESS_TERMCAP_se="$(tput rmso; tput sgr0)"
declare -gx LESS_TERMCAP_ue="$(tput rmul; tput sgr0)"
declare -gx LESS_TERMCAP_ZN="$(tput ssubm)"
declare -gx LESS_TERMCAP_ZV="$(tput rsubm)"
declare -gx LESS_TERMCAP_ZO="$(tput ssupm)"
declare -gx LESS_TERMCAP_ZW="$(tput rsupm)"
declare -gx LESS_TERMCAP_me="$(tput sgr0)"
declare -gx LESS_TERMCAP_mr="$(tput rev)"
declare -gx LESS_TERMCAP_mh="$(tput dim)"

declare -U path PATH
declare -U fpath
declare -U manpath MANPATH
declare -U infopath INFOPATH

path=( ~/.local/bin $path )
fpath+="${LOCAL_SHARE}/zsh/functions"
manpath+=($LOCAL_MAN)
infopath+=($LOCAL_INFO)

declare -gx PATH
declare -gx MANPATH
declare -gx INFOPATH

