# ~/.config/bash/functions.sh -*- bash -*- vim:ft=bash

gen_manifest()
{
    local dir=""
    if test -n "$1"; then dir="$(realpath $1)"; else dir="$(pwd)"; fi
    
    find "$dir"             \
        -mindepth 1         \
        -type f,l           \
        ! -name '.manifest' \
        ! -name '.uninstall' \
        ! -wholename './share' \
        ! -wholename './share/bash-completion' \
        ! -wholename './share/bash-completion/completions' \
        ! -wholename './share/zsh' \
        ! -wholename './share/zsh/site-functions' \
        ! -wholename './share/fish' \
        ! -wholename './share/fish/vendor_completions.d' \
        ! -wholename './share/man' \
        ! -wholename './share/man/man1' \
        ! -wholename './share/man/man2' \
        ! -wholename './share/man/man3' \
        ! -wholename './share/man/man4' \
        ! -wholename './share/man/man5' \
        ! -wholename './share/man/man6' \
        ! -wholename './share/man/man7' \
        ! -wholename './share/man/man8' \
        ! -wholename './bin' \
        ! -wholename './share/info' \
        ! -wholename './share/info/dir' \
        ! -wholename './lib' \
        ! -wholename './libexec' \
        ! -wholename './include' \
        ! -wholename './lib/pkgconfig' \
        ! -wholename './share/pkgconfig' \
        -printf '%P\n' \
        | sort -u > "$dir/.manifest"
        sed 's@^@rm -vf @g' "$dir/.manifest" > "$dir/.uninstall"
}

pkgmake()
{
    tar -f $(basename $(realpath .)).tar -vc .manifest .uninstall ./*
}

pkgunpack()
{
    usage="\n\tpkgunpack ARCHIVE INSTALL_BASE_DIR\n\texample: pkgunpack foo.tar.gz /usr/local\n"
	if test -z "$1"; then echo -e "$usage"; return 1; fi
	if test -z "$2"; then echo -e "$usage"; return 1; fi
	sudo tar -f "$1" -C "$2" -vx \
        --exclude '.uninstall'   \
        --exclude '.manifest'    \
		--no-same-permissions    \
		--no-same-owner          \
		--no-xattrs
}

fontq()
{
    fc-list : family | rg -i $1
}

mkx()
{
	printf '#!/bin/sh\n' > $1 && chmod +x $1
}

bandwidth_limit()
{
    if test -z "$1"; then return 2; fi
    kbs=$(echo "$1 * 8000" | bc)
    sudo wondershaper -a enp0s31f6 -d $kbs
    unset kbs
}
