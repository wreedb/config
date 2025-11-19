[[ $- != *i* ]] && return
[ -r ~/.profile ] && source ~/.profile

disable -r time
disable echo printf which

declare -gx HISTFILE=${XDG_CACHE_HOME}/history/zsh
declare -gx HISTSIZE=10000
declare -gx SAVEHIST=10000

declare -gx STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/config.toml

function has() {
    if command -v ${1} >/dev/null 2>&1; then
        return 0;
    else
        return 1;
    fi
}

cflags_arr=(
    -march=x86-64
    -mtune=generic
    -fdiagnostics-color
    -fPIC
    -fstack-clash-protection
    -fstack-protector-strong
    -fcf-protection=full
    -ffat-lto-objects
    -pipe
    -O2
)

ldflags_arr=(
    -flto=auto
    -Wl,-z,relro
    -Wl,-z,now
    -Wl,-z,noexecstack
    -Wl,--as-needed
)

declare -gx CFLAGS="${cflags_arr[@]}"
declare -gx CXXFLAGS="${cflags_arr[@]}"
declare -gx CPPFLAGS="-D_FORTIFY_SOURCE=2"
declare -gx LDFLAGS="${ldflags_arr[@]}"

declare -gx CC=gcc
declare -gx CXX=gxx
declare -gx CPP=gpp

declare -gx CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rust"
declare -gx RUSTUP_HOME="${CARGO_HOME}"
declare -gx GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
declare -gx GOARCH=amd64
declare -gx GOAMD64=v3
declare -gx GOOS=linux
declare -gx CGO_ENABLED=1

for drop in ~/.config/zsh/hooks/*.zsh; do
    source ${drop}
done

for plugin in ${XDG_DATA_HOME}/zsh/plugins/*
do
    source ${plugin}/plugin
done

declare -gx GPG_TTY=$(tty)

fpath+=${XDG_DATA_HOME}/zsh/site-functions

declare -U path fpath PATH
declare -gx path fpath PATH

autoload -Uz compinit
compinit -d ${XDG_CACHE_HOME}/zsh/compinit

local _nl=$'\n'
PROMPT='%F{green}%n%f@%F{yellow}%m%f (%F{magenta}%3~%f) %F{blue}%#%f '
RPROMPT='%F{cyan}%@%f [%F{yellow}%?%f]'

setopt zle notify autocd
setopt interactive_comments
setopt correct multibyte equals
setopt brace_ccl automenu autolist
setopt menucomplete prompt_subst
setopt extendedglob inc_append_history
setopt extended_history hist_expire_dups_first
unsetopt bg_nice hup beep

zstyle ':completion:*' verbose yes
zstyle ':completion:*' cache-path "${ZCACHEDIR}"/compcache
zstyle ':completion:*' use-cache one
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' add-space false
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:descriptions' format '%U%K{yellow} %F{green}-- %F{red} %BNICE!1! %b%f %d --%f%k%u'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red} -- no matches found --%f'

eval "$(fzf --zsh; zoxide init zsh)"

eval "$(pather -er ~/.nix-profile/bin -r /nix/var/nix/profiles/default/bin)"
eval "$(pather -ep ${RUSTUP_HOME}/bin)"

# bun completions
[ -s "/home/wbr/.local/share/bun/_bun" ] && source "/home/wbr/.local/share/bun/_bun"
