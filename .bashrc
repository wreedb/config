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
export MANPAGER="ov --section-delimiter '^[^\s]' --section-header"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/.local/share/gnupg"
export GIT_CONFIG_NOSYSTEM=1
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/.config/git/config"
export CFLAGS="-O2 -pipe -march=skylake -mtune=native"
export CXXFLAGS="-O2 -pipe -march=skylake -mtune=native"
export RUSTFLAGS="-C opt-level=3 -C target-cpu=skylake -C link-arg=-fuse-ld=lld"
export PERL_CPANM_HOME=$HOME/.local/share/cpanm
export PERL_CANARY_STABILITY_NOPROMPT=1

export EGET_CONFIG="${XDG_CONFIG_HOME}/eget/config.toml"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export STARSHIP_CACHE="${XDG_CACHE_HOME}/starship/log"

export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/nodejs-history"
export NPM_CONFIG_EDITOR=nvim
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export BUN_INSTALL="${XDG_DATA_HOME}/bun"

export GOPATH=$HOME/.local/share/go
export GOBIN=$GOPATH/bin
export GOTELEMETRY=off
export CGO_CFLAGS="$CFLAGS -g"
export CGO_CXXFLAGS="$CXXFLAGS -g"

export VCACHE="${XDG_CACHE_HOME}/v"
export VMODULES="${XDG_DATA_HOME}/v"
export GUILE_HISTORY="${XDG_CACHE_HOME}/guile/history"

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
alias rm="rm -v"
alias rmd="rm -rvf"
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
alias curl="curl --progress-bar -L"
alias hg=chg
alias make="colormake --short"
alias dfc="dfc -t ext4,vfat"
alias mmv=mmv-go
alias j=just

alias cat=bsdcat
alias cpio=bsdcpio
alias unzip=bsdunzip

alias chx="chmod +x"


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

# path-edit "${CARGO_HOME}/bin"
# path-edit "${GOBIN}"
# path-edit "${BUN_INSTALL}/bin"

export PATH

eval "$(starship init bash)"
eval "$(zoxide init bash)"
