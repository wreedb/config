# @author_name: Will Reed (wreedb)
# @github_url:  https://github.com/wreedb
# @description: Shell agnostic functions
#
# vim:ft=sh

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
    command -v bsdtar >/dev/null && tarcmd=bsdtar || tarcmd=tar
    archive="$(echo ${1} | perl -pe 's|\/||g')" ;
    $tarcmd -vcf "${PWD}/${archive}.tar" ${archive} ;
)

untar()
(
    [ -n "${1}" ] || return 2 ;
    command -v bsdtar >/dev/null && tarcmd=bsdtar || tarcmd=tar
    archive="$(realpath $1)"
    $tarcmd -xvf "${archive}"
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

userc()
{
    printf '%s\n' "About to edit /etc/portage/package.use"
    doas vi /etc/portage/package.use
}
