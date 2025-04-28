# ~/.config/login/env.sh -*- bash -*- vim:ft=bash

. /etc/profile

for cachedir in nodejs npm guile
do
    test -d $XDG_CACHE_HOME/$cachedir || mkdir -p $XDG_CACHE_HOME/$cachedir
done

for datadir in gnupg cpanm
do
    test -d $XDG_DATA_HOME/$datadir || mkdir -p $XDG_DATA_HOME/$datadir
done

EDITOR=nvim
VISUAL=nvim
export EDITOR VISUAL

MANROFFOPT=-c
GROFF_NO_SGR=1
MANWIDTH=80
LESSHISTFILE=-
export MANROFFOPT GROFF_NO_SGR MANWIDTH LESSHISTFILE

RUSTDIR=/opt/rust
RUSTUP_HOME=$RUSTDIR/rustup
CARGO_HOME=$RUSTDIR/cargo
export RUSTDIR RUSTUP_HOME CARGO_HOME


# guile
GUILE_HISTORY=$XDG_CACHE_HOME/guile/history
GUILE_AUTO_COMPILE=0
export GUILE_HISTORY GUILE_AUTO_COMPILE

# perl
PERL5LIB=/opt/perl
PERL_CPANM_HOME=$XDG_DATA_HOME/cpanm
PERL_CPANM_OPT="--notest --mirror https://mirror.team-cymru.com/CPAN/ --with-suggests --with-recommends --man-pages --no-lwp --curl --no-wget"
PERL_CANARY_STABILITY_NOPROMPT=1
export PERL_CPANM_HOME PERL_CANARY_STABILITY_NOPROMPT PERL5LIB PERL_CPANM_OPT

# node/npm
NODE_REPL_HISTORY=$XDG_CACHE_HOME/nodejs/history
NPM_CONFIG_EDITOR=$EDITOR
NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
BUN_INSTALL=/opt/bun
export NODE_REPL_HISTORY NPM_CONFIG_EDITOR NPM_CONFIG_CACHE BUN_INSTALL

# swift
SWIFTLY_HOME=$XDG_DATA_HOME/swiftly
SWIFTLY_BIN_DIR=$SWIFTLY_HOME/bin
export SWIFTLY_HOME SWIFTLY_BIN_DIR

# go
GOPATH=/opt/go
GOBIN=$GOPATH/bin
export GOPATH GOBIN

# gnupg
GNUPGHOME=$XDG_DATA_HOME/gnupg
export GNUPGHOME
test -d "${GNUPGHOME}" || mkdir -p "${GNUPGHOME}"
chown -R "$(/bin/id -un)" "${GNUPGHOME}"
chmod 600 "${GNUPGHOME}"/*
chmod 700 "${GNUPGHOME}"

# misc
GIT_CONFIG_NOSYSTEM=1
GIT_CONFIG_GLOBAL=$XDG_CONFIG_HOME/git/config
EGET_CONFIG=$XDG_CONFIG_HOME/eget/config.toml
STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml
export EGET_CONFIG STARSHIP_CONFIG GIT_CONFIG_NOSYSTEM GIT_CONFIG_GLOBAL

# pkgconf
PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$HOME/.local/share/pkgconfig
export PKG_CONFIG_PATH

# compiler flags
RUSTFLAGS="-C opt-level=3 -C link-arg=-fuse-ld=mold -C target-cpu=native"
COMMON_FLAGS="-march=native -pipe -O2 -flto -fuse-ld=mold"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
CC=$(which gcc)
CXX=$(which g++)
HOSTLD=$(which mold)
CGO_CFLAGS="${COMMON_FLAGS}"
CGO_CXXFLAGS="${COMMON_FLAGS}"
MAKEFLAGS=-j12
export RUSTFLAGS CFLAGS CXXFLAGS CC CXX HOSTLD CGO_CFLAGS CGO_CXXFLAGS MAKEFLAGS
unset COMMON_FLAGS