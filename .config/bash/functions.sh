# vim:ft=bash
#
man()
{
	LESS_TERMCAP_mb=$'\e[1;32m' \
	LESS_TERMCAP_md=$'\e[1;32m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[1;4;31m' \
	/usr/bin/env man "$@"
}


dnf-search()
{
	dnf search \
	  -x 'texlive-*' \
      -x 'rust-*' \
	  -x 'perl-*' \
	  -x 'R-*' \
	  -x 'golang-*' \
	  -x 'python3-*' \
	  -x 'ghc-*' \
	  "$@"
}

pkguntar()
{
	[ -n "$1" ] || exit 1
	[ -n "$2" ] || exit 1
	sudo tar -f "$1" -C "$2" -vx --exclude 'manifest' \
		--no-same-permissions \
		--no-same-owner \
		--no-xattrs
}
