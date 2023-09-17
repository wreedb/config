# @author_name: Will Reed (wreedb)
# @github_url:  https://github.com/wreedb/config
# @description: ~/.bashrc
#
# vim:ft=sh

export LOCALDIR="${HOME}/.local";
export LOCAL_BIN="${LOCALDIR}/bin";
export LOCAL_LIB="${LOCALDIR}/lib";
export LOCAL_SHARE="${LOCALDIR}/share";
export LOCAL_STATE="${LOCALDIR}/state";
export LOCAL_TMP="${LOCALDIR}/tmp";
export LOCAL_VAR="${LOCALDIR}/var";
export LOCAL_MAN="${LOCALDIR}/man";
export LOCAL_INFO="${LOCALDIR}/info";
export LOCAL_INCLUDE="${LOCALDIR}/include";
export LOCAL_MNT="${LOCALDIR}/mnt";
export LOCAL_MEDIA="${LOCALDIR}/media";
export LOCAL_OPT="${LOCALDIR}/opt";
export LOCAL_SRC="${LOCALDIR}/src";

export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}";
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/usr/local/etc/xdg:/etc/xdg}";
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}";
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}";
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}";
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}";

export HISTFILE="${XDG_DATA_HOME}/bash/history";
export HISTSIZE=3000;
export SAVEHIST=3000;

export CARGO_HOME="${XDG_DATA_HOME}/cargo";
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup";
export GOPATH="${XDG_DATA_HOME}/go";
export GOBIN="${GOPATH}/bin";
export GNUPGHOME="${XDG_DATA_HOME}/gnupg";

export LESSHISTFILE="/dev/null";

export GIT_CONFIG_SYSTEM="${XDG_CONFIG_HOME}/git/config";
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config";
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc";

export MANWIDTH=80;
export MANPAGER=less;
export PAGER=less;
export TERMINAL=kitty;
export BROWSER=firefox;
export VIDEO=mpv;
export IMAGE=nsxiv;
export READER=mupdf;
export OPENER=xdg-open;
export FILEMANAGER=thunar;
export LAUNCHER=bemenu-run;

export BEMENU_OPTS="--fn 'JetBrains Mono 14' \
                    --border 1 --list 8 --prompt 'run: ' \
                    --bdr '#44475A' --tb '#21222C' \
                    --fb '#21222C' --tf '#6272A4' \
                    --ff '#50FA7B' --nb '#282A36' \
                    --ab '#282A36' --hb '#44475A' \
                    --nf '#BD93F9' --af '#BD93F9' \
                    --hf '#50FA7B'";

export LESS_TERMCAP_so="$(tput bold; tput setaf 3; tput setab 4)";
export LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 7)";
export LESS_TERMCAP_mb="$(tput bold; tput setaf 2)";
export LESS_TERMCAP_md="$(tput bold; tput setaf 6)";
export LESS_TERMCAP_se="$(tput rmso; tput sgr0)";
export LESS_TERMCAP_ue="$(tput rmul; tput sgr0)";
export LESS_TERMCAP_ZN="$(tput ssubm)";
export LESS_TERMCAP_ZV="$(tput rsubm)";
export LESS_TERMCAP_ZO="$(tput ssupm)";
export LESS_TERMCAP_ZW="$(tput rsupm)";
export LESS_TERMCAP_me="$(tput sgr0)";
export LESS_TERMCAP_mr="$(tput rev)";
export LESS_TERMCAP_mh="$(tput dim)";

alias ls='eza --icons -s type -ahF';
alias ll='eza --icons -s type -halF --no-permissions -o';
alias l='eza --icons -s type -a1F';
alias la='eza --icons -s type -aaF';

alias ln='ln --verbose'
alias rm='rm -v';
alias rmd='rm -rvf';
alias mkdir='mkdir -pv';
alias cp='cp -vir';
alias cpt='cp -virt';
alias grep='grep -i --color=always';
alias rg='rg -i';
alias cat='bat --paging=never -upp';
alias bld='mkdir -pv bld && cd bld';

alias m=micro;
alias v=nvim;
alias nv=nvim;
alias vim=nvim;
alias ff=fastfetch;
alias nf=neofetch;
alias pf=pfetch;
alias info=pinfo;

alias esr=esearch
alias esl=eselect

pathmunge () {
    case $1 in
        path)
            if ! echo "${PATH}" | grep -E -q "(^|:)${2}($|:)"
            then
                if [ "${3}" = "append" ]
                then
                    PATH="${PATH}:${2}"
                else
                    PATH="${2}:${PATH}"
                fi
            fi
        export PATH ;;
        man)
            if ! echo "${MANPATH}" | grep -E -q "(^|:)${2}($|:)"
            then
                if [ "${3}" = "append" ]
                then
                    MANPATH="${MANPATH}:${2}"
                else
                    MANPATH="${2}:${MANPATH}"
                fi
            fi
        export MANPATH ;;
        info)
            if ! echo "${INFOPATH}" | grep -E -q "(^|:)${2}($|:)"
            then
                if [ "${3}" = "append" ]
                then
                    INFOPATH="${INFOPATH}:${2}"
                else
                    INFOPATH="${2}:${INFOPATH}"
                fi
            fi
        export INFOPATH ;;
        *)
        printf 'Invalid call to pathmunge function with: %s\n' "${@}" ;;
    esac
}

mktar()
(
    [ -n "${1}" ] || return 2 ;
    command -v bsdtar >/dev/null && tarcmd=bsdtar || tarcmd=tar ;
    archive="$(echo ${1} | perl -pe 's|\/||g')" ;
    $tarcmd -vcf "${PWD}/${archive}.tar" ${archive} ;
)

untar()
(
    [ -n "${1}" ] || return 2 ;
    command -v bsdtar >/dev/null && tarcmd=bsdtar || tarcmd=tar ;
    archive="$(realpath $1)" ;
    $tarcmd -xvf "${archive}" ;
)

unsetcc()
(
    set -- CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS COMMON_FLAGS LD LDFLAGS AR AS ;
    for i in $@
    do
        unset $i ;
    done
)

fontq()
{
    [ -n "$1" ] || return 2 ;
    fc-list : family | grep -i "$1" ;
}

whichlink()
{
    [ -n "$1" ] || return 2 ;
    which "$1" | xargs -r readlink ;
}

rcbash()
(
    edit_file="${BASHDIR}/$(find "$BASHDIR" -type f | xargs basename -a | fzf)" ;
    [ -n "${edit_file}" ] || return 2 ;
    $EDITOR "${edit_file}" ;
)

srcbash()
{
    . "${HOME}/.bash_profile" ;
}

pathmunge path "${HOME}/.local/bin" ;
pathmunge path "${CARGO_HOME}/bin" ;

pathmunge man "${HOME}/.local/man" ;

pathmunge info "/usr/local/info" ;
pathmunge info "${HOME}/.local/info" ;

eval $(printf "export PATH=$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')") ;
eval "$(zoxide init bash)"
eval "$(starship init bash)"
