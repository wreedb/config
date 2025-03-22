#!/bin/bash -l
# -*- bash-ts -*-

export EDITOR=nvim
export VISUAL=nvim

export PKG_CONFIG_PATH="${HOME}/.local/lib/pkgconfig:${HOME}/.local/share/pkgconfig"
export BEMENU_OPTS='--fn "monospace 14" --wrap --ignorecase --fixed-height --single-instance --scrollbar "none" --monitor "focused" --no-overlap --center --width-factor 0.3 --border "2" --border-radius "4" --bdr "#80B0E0" --tf "#76C5A4" --tb "#1A1D27" --nf "#D7D7D7" --nb "#1A1D27" --af "#D7D7D7" --ab "#1A1D27" --ff "#ECECEC" --fb "#1A1D27" --sf "#1A1D27" --sb "#76C5A4" --hf "#1A1D27" --hb "#76C5A4" --list 10'

export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"

export GROFF_NO_SGR=1
export MANROFFOPT=-c
export LESSHISTFILE="/dev/null"
export MANWIDTH=80
export MANPAGER="ov --section-delimiter '^[^\s]' --section-header"

export RUSTUP_HOME="${RUSTUP_HOME:=$XDG_DATA_HOME/rustup}"
export CARGO_HOME="${CARGO_HOME:=$XDG_DATA_HOME/cargo}"
export GNUPGHOME="${GNUPGHOME:=$XDG_DATA_HOME/gnupg}"
export GIT_CONFIG_NOSYSTEM="1"
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"
export CFLAGS="-O2 -pipe -march=skylake -mtune=native"
export CXXFLAGS="-O2 -pipe -march=skylake -mtune=native"
export RUSTFLAGS="-C opt-level=3 -C target-cpu=skylake -C link-arg=-fuse-ld=lld"
export PERL_CPANM_HOME="${XDG_DATA_HOME}/cpanm"
export PERL_CANARY_STABILITY_NOPROMPT="1"

export SWIFTLY_HOME="${SWIFTLY_HOME:=$XDG_DATA_HOME/swiftly}"
export SWIFTLY_BIN_DIR="${SWIFTLY_HOME}/bin"

export EGET_CONFIG="${XDG_CONFIG_HOME}/eget/config.toml"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export STARSHIP_CACHE="${HOME}/.local/var/log/starship"

mkdir -p "${XDG_CACHE_HOME}/node"
export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/node/repl-history"
export NPM_CONFIG_EDITOR="nvim"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export BUN_INSTALL="${XDG_DATA_HOME}/bun"

export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"

mkdir -p "${XDG_DATA_HOME}/v/cache"
mkdir -p "${XDG_DATA_HOME}/v/tmp"
mkdir -p "${XDG_DATA_HOME}/v/modules"
export VCACHE="${XDG_DATA_HOME}/v/cache"
export VMODULES="${XDG_DATA_HOME}/v/modules"
export VTMP="${XDG_DATA_HOME}/v/tmp"

export GUILE_HISTORY="${XDG_CACHE_HOME}/guile/history"
export GUILE_AUTO_COMPILE=0
