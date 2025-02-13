# -*- mode: bash-ts-mode; -*-
# vim:ft=bash

mkdir -p ~/.cache/bash
export HISTFILE=$HOME/.cache/bash/history
export SAVEHIST=6000
export HISTSIZE=6000
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export GROFF_NO_SGR=1
export MANROFFOPT=-c
export LESSHISTFILE=
export MANWIDTH=80
export RUSTUP_HOME=/opt/sw/rust/rustup
export CARGO_HOME=/opt/sw/rust/cargo
export GNUPGHOME=$HOME/.local/share/gnupg
export GIT_CONFIG_NOSYSTEM=1
export GIT_CONFIG_GLOBAL=$HOME/.config/git/config
export GOPATH=$HOME/.local/share/go
export GOTELEMETRY=off
export CFLAGS="-O2 -pipe -march=native -mtune=native"
export CXXFLAGS="-O2 -pipe -march=native -mtune=native"
export LDFLAGS="-O2 -pipe -march=native -mtune=native"
export RUSTFLAGS="-C opt-level=3 -C target-cpu=native"
export PERL_CPANM_HOME=$HOME/.local/share/cpanm
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"

export CGO_CFLAGS="$CFLAGS -g"
export CGO_CXXFLAGS="$CXXFLAGS -g"
export CGO_LDFLAGS="$LDFLAGS -g"

mkdir -p "${XDG_RUNTIME_DIR:-$HOME/.local/run}/sockets"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-$XDG_RUNTIME_HOME}/sockets/ssh-agent"

ls_o="--group-directories-first -F always -a --icons always --no-git"
ll_o="--long --header --no-permissions --octal-permissions --header"
alias ls="eza $ls_o -w 80"
alias ll="eza $ls_o $ll_o --no-filesize"
alias lls="eza $ls_o $ll_o --color-scale-mode fixed --color-scale"
alias la="eza $ls_o --across"
alias tree="eza $ls_o --tree"
alias mkdir="mkdir -pv"
alias mv="mv -v"    
alias mvt="mv -vt"  
alias cp="cp -v"
alias cpt="cp -vt"
alias grep="grep --color=auto -i"
alias rg="rg -i"
alias ln="ln -sv"
alias lnr="ln -svr"
alias vi=nvim
alias vim=nvim
alias nvi=nvim
alias nv=nvim
alias m=micro
alias envy="env | sort | bat -l sh"
alias curl="curl --progress-bar"

for extra in "${XDG_CONFIG_HOME:-$HOME/.config}"/bash/*.sh
do
	source "${extra}"
done

path-edit()
{
	if ! echo "${PATH}" | grep -qE "(^|:)$1($|:)"
	then
		if [ "$2" = "append" ]
		then
			PATH="${PATH}:$1"
		else
			PATH="$1:${PATH}"
		fi
	fi
}

manpath-edit()
{
	if ! echo "${MANPATH}" | grep -qE "(^|:)$1($|:)"
	then
		if [ "$2" = "append" ]
		then
			MANPATH="${MANPATH}:$1"
		else
			MANPATH="$1:${MANPATH}"
		fi
	fi
}

path-edit "${CARGO_HOME}/bin"
path-edit "/opt/sw/go/versions/current/bin"
path-edit "/opt/sw/perl/versions/current/bin"
path-edit "/opt/sw/nodejs/versions/current/bin"

export PATH
