[[ $- != *i* ]] && return

[ -r ~/.profile ] && source ~/.profile

[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash

HISTFILE=${XDG_CACHE_HOME}/history/bash
HISTSIZE=10000
SAVEHIST=10000

alias ls='ls --color=auto -ahF'
alias ll='ls --color=auto -alhF'
alias grep='grep --color=auto'


export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/config.toml

command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"

cflags_arr=(
    -march=x86-64-v3
    -mtune=native
    -mabm
    --param=l1-cache-line-size=64
    --param=l1-cache-size=32
    --param=l2-cache-size=12288
    -fdiagnostics-color
    -fPIC
    -fstack-clash-protection
    -fstack-protector-strong
    -fcf-protection=full
    -ffat-lto-objects
    -pipe
    -O2
    -g
)

ldflags_arr=(
    -flto=auto
    -Wl,-z,relro
    -Wl,-z,now
    -Wl,-z,noexecstack
    -Wl,--as-needed
)

export CFLAGS="${cflags_arr[@]}"
export CXXFLAGS="${cflags_arr[@]}"
export CPPFLAGS="-D_FORTIFY_SOURCE=2"
export LDFLAGS="${ldflags_arr[@]}"

export CC=gcc
export CXX=g++
export CPP=cpp

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rust"
export RUSTUP_HOME="${CARGO_HOME}"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOARCH=amd64
export GOAMD64=v3
export GOOS=linux
export CGO_ENABLED=1

for drop in ~/.config/bash/*.bash; do
    source ${drop}
done

export GPG_TTY=$(tty)
