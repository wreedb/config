# vim:ft=bash
bindkey -e
setopt autocd extendedhistory extendedglob globdots
unsetopt bgnice hup beep

GPG_TTY="$(tty)"; export GPG_TTY;

local _eza_ignore_globs=".mozilla|.thunderbird|.pki|.ssh|"
local eza="eza --header --group-directories-first --no-permissions --octal-permissions --sort=type --classify=always --icons=auto --color=auto --no-git --all --time-style='+%Y-%m-%d' -I '${_eza_ignore_globs}'"

alias ls="${eza}"
alias l="${eza} -1"
alias la="${eza} --across"
alias ll="${eza} --long --no-filesize"
alias lls="${eza} --colour-scale-mode=fixed --colour-scale=size --long"
alias lss="${eza} --colour-scale-mode=fixed --colour-scale=size --total-size --long"
alias tree="${eza} --tree"
unset eza _eza_ignore_globs

alias cp="cp -v"
alias cpt="cp -vt"
alias cprt="cp -vrt"
alias rm="rm -v"
alias mv="mv -v"
alias mvt="mv -vt"
alias chown="chown -v"
alias chmod="chmod -v"
alias chgrp="chgrp -v"
alias install="install -v"
alias mkdir="mkdir -pv"
alias rmdir="rmdir -v"
alias ln="ln -v"

alias fd="fd --hidden --no-ignore"
alias lz4="lz4 --rm -mv"
alias lz="plzip -n12 -v"
alias tarlz="tarlz -n12"
alias pigz="pigz -p12"
alias -g -- --help="--help 2>&1 | bat --no-config --wrap=never --paging=never --style=plain --language=help --theme=ansi"

alias stripa="llvm-strip --strip-all-gnu"
alias stripu="llvm-strip --strip-unneeded"

export XBPS_DISTDIR="${HOME}/.local/src/void-packages"
alias lxbps="sudo xbps-install -R ${XBPS_DISTDIR}/hostdir/binpkgs -vf"
alias dl="xbps-fetch -s"
alias vpsm="vpsm --color=yes"
alias vpm="vpm --color=yes"

alias v=nvim
alias vi=nvim
alias vim=nvim
alias nv=nvim
alias m=micro

alias cat=bsdcat
alias tar="bsdtar"
alias gtar="command tar"
alias cpio="bsdcpio -v"
alias unzip="bsdunzip -v"

alias ip="ip -color"

alias mkbld="mkdir build;cd build"
alias lDD="command ldd"

export CFLAGS="-mtune=native -pipe -O2"
export CXXFLAGS="-mtune=native -pipe -O2"
export MAKEFLAGS="-j10"
export RUSTFLAGS="-C target-cpu=native"

export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
export CARGO_HOME=${XDG_DATA_HOME}/cargo

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export EGET_CONFIG="${XDG_CONFIG_HOME}/eget/config.toml"

export GIT_CONFIG_NOSYSTEM="1"
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"

export GOPATH="${XDG_DATA_HOME}/go"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export MANWIDTH=80
export PAGER=pager
export LESSHISTFILE="/dev/null"

export ZIG_LIB_DIR=/usr/lib/zig
export XBPS_DISTDIR="${HOME}/.local/src/void-packages"

export NPM_CONFIG_EDITOR="${EDITOR:-editor}"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/nodejs/history"
export BUN_INSTALL="/opt/bun"

path=(${CARGO_HOME}/bin /opt/node/bin ${BUN_INSTALL}/bin ${path})
fpath+=(${XDG_DATA_HOME}/zsh/site-functions)

typeset -U path fpath PATH
export path fpath PATH

function __runit_enable() {
    [ -d /etc/sv/${1} ] || return 1
    
    if [ -L /var/service/${1} ]; then
        echo "service: \e[1;32m${1}\e[0m is already enabled."
        return 1
    fi

    pkexec ln -t /var/service \
        --verbose \
        --symbolic \
        --interactive "/etc/sv/${1}"
}

function __runit_show() {
    case ${1} in
        enabled) eza -x --colour=auto "/var/service/" ;;
        dir) eza -x --colour=auto "/etc/runit/runsvdir/${2}" ;;
        *) echo "argument unrecognized: ${1}"; return 1 ;;
    esac
}

function __runit_disable() {
    if [ -L /var/service/${1} ]; then
        pkexec unlink /var/service/${1}
        echo "unlinked service \e[1;32m${1}\e[0m"
        return 0
    fi
}

function whichlink() {
    if [ "${2}" = "2" ]; then
        readlink $(which ${1}) | xargs -r readlink
    else
        readlink $(which ${1})
    fi
}

alias "runit-enable"=__runit_enable
alias "runit-disable"=__runit_disable
alias "runit-show"=__runit_show

function ldd()
{
    test -e "${1}" || return 1
    objdump -p "${1}" | grep --color=auto "NEEDED"
}

function llvm-ldd()
{
    test -e "${1}" || return 1
    llvm-objdump -p "${1}" | grep --color=auto "NEEDED"
}

function whichlink()
{
    local src=$(which $1)
    local dst=$(readlink ${src})
    if test -n "${dst}"
    then
        /bin/env -S printf '\e[32;1msource\e[0m: %s\n\e[32;1mdest\e[0m: %s\n' "${src}" "${dst}"
    fi
}

function readlinklink()
{
    readlink "${1}" | xargs -r readlink
}

function fontq()
{
    fc-list : family | grep --color=auto -i "${@}"
}

function mktar()
{
    if [ -r "${1}" ]
    then
        bsdtar -vcf "${1}".tar "${1}"
    else
        printf 'error: %s not found\n' "${1}"
    fi
}

function untar()
{
    if [ -r "${1}" ]
    then
        bsdtar -vxf "${1}"
    else
        printf 'error: %s not found\n' "${1}"
    fi
}

function mkx()
{
    printf '#!/bin/sh\nexec 2>&1\n' > "${1}"
    chmod -v 755 "${1}"
}

source <(zoxide init zsh)
source <(starship init zsh)
source <(fzf --zsh)

# export SSH_AGENT_PID="$(cat ${XDG_CONFIG_HOME}/runit/enabled/ssh-agent/supervise/pid)"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# source <(keychain --eval --quiet --absolute --dir $XDG_DATA_HOME/keychain --agents ssh)
# source <(luarocks path --lua-version 5.1)

unset LS_COLORS EZA_COLORS

autoload -Uz compinit
compinit -d ${ZCACHEDIR}/compinit
