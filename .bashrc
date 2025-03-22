# -*- bash-ts -*-
if [[ $- == *i* ]]; then
    source "/usr/share/blesh/ble.sh" --noattach
fi

mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/bash"
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash/history"
export SAVEHIST=6000
export HISTSIZE=6000

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
alias envy="printenv2 --key-order asc"
alias curl="curl -K ~/.config/curlrc"
alias hg=chg
alias make="colormake-short"
alias dfc="dfc -t ext4,vfat"
alias j=just

alias cat=bsdcat
alias cpio=bsdcpio
alias unzip=bsdunzip

alias chx="chmod +x"

for extra in "${XDG_CONFIG_HOME}"/bash/*.sh
do
	. "${extra}"
done


if [[ $- == *i* ]]; then
    eval "$(starship init bash)"
    eval "$(zoxide init bash)"
    ble-attach
fi

export GPG_TTY="$(tty)"

if test -r "${XDG_CACHE_HOME}/ssh-agent/info.sh"
then
    source "${XDG_CACHE_HOME}/ssh-agent/info.sh"
fi

if test -r "${XDG_CACHE_HOME}/dirmngr/info.sh"
then
    source "${XDG_CACHE_HOME}/dirmngr/info.sh"
fi
