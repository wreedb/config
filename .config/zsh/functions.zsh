# vim:ft=zsh:fileencoding=utf-8
# @author: Will Reed

function update-pacman-mirrors() {
    reflector \
        --country US \
        --protocol https \
        --latest 40 \
        --fastest 10 \
        --connection-timeout 1 \
        --download-timeout 1 \
        --save /tmp/mirrorlist.tmp >/dev/null 2>&1
    cp /etc/pacman.d/mirrorlist /tmp/mirrorlist.backup
    doas rankmirrors /tmp/mirrorlist.tmp > /etc/pacman.d/mirrorlist
}

function pkglist() {
    $EDITOR $HOME/documents/pkglist
}

function get() { time saldl -Tg --memory-buffers $@ }

function update-grub() { doas grub-mkconfig -o /boot/grub/grub.cfg }

function pkgclone() {
    [ -z "$1" ] && exit 1 || :
    cd $HOME/src/clone/pkg
    pkgctl repo clone $1 && cd $1 || exit 1
    bat --paging=auto PKGBUILD --language=sh
}



function pacfromlist() {
    [ -z "$1" ] && exit 1 || :
    pacman -S --needed - < $1
}

function localpac() {

    if (( $+commands[fd] )) then
        pkg=$(fd './*' "$XDG_DATA_HOME/pacman/packages" --exclude '*.sig' --type=f | xargs basename -a | perl -pe 's/.pkg.*//' | sk)
    else
        pkg=$(find "$XDG_DATA_HOME/pacman/packages" -type f -not -name "*.sig" | xargs -r basename -a | perl -pe 's/.pkg.*//'  | sk)
    fi
  
    [ -z "$pkg" ] && return 2
    doas pacman --upgrade $XDG_DATA_HOME/pacman/packages/$pkg.pkg.tar.zst

}

function unsetcc() {
    local vars=(CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS COMMON_FLAGS LD LDFLAGS AR AS)
    for i in $vars; do
        unset $i
    done
}

function newtmp() {
    local newdir=$(mktemp -dp "$HOME/.local/tmp" -t "$USER-XXX")
    cd $newdir
}

function untar() {
    [ -z "$1" ] && exit 2
    bsdtar -xvf $1
}

function mktar() {
    [ -z "$1" ] && return 2

    archive=$(echo $1 | perl -pe 's|\/||g')
    gum spin --spinner=line --title="Creating archive..." shellwrap "bsdtar -cvf ${archive}.tar ${archive}" && clear
    compressor=$(printf 'xz\nbrotli\ngzip\nzstd\nbz2\nlzo' | gum choose --item.italic --header=' Choose a compression algoritm ' --header.background=1 --header.foreground=0 --cursor=' * ' --cursor.align=left --item.bold --header.bold --header.italic)
  
    case $compressor in

        xz)
            cmd="xz --compress --force" ;;
        brotli)
            cmd="brotli --quality=6 --rm --force" ;;
        gzip)
            cmd="gzip --rsyncable --force";;
        zstd)
            cmd="zstd --rm --force" ;;
        bz2)
            cmd="bzip2 --compress --force" ;;
        lzo)
            cmd="lzop --delete --force" ;;
        *)
            return 2 ;;

    esac
    clear && gum spin --spinner=line --title="Compressing archive with ${compressor}.." --title.italic --show-output shellwrap "${cmd} ${archive}.tar"
    alldone
}

function pathlook() {
    print $commands | xargs basename -a | sk | xargs which | xargs ls -ahlF --color=always
}

function whichlink() {
    [ -z "$1" ] && return 2
  
    if (( $+commands[$1] )) then
        print ''
        which $1 | xargs -r readlink
        print ''
    else
        printf "Did not find %s in your path.\n" "$1"
    fi
}

function whichcat() {
    [ -z "$1" ] && exit 2
    if (( $+commands[$1] )) then
        print ''
        which $1 | xargs -r bat -upp
        print ''
    else
        print 'Did not find %s in your path.' "$1"
    fi
}

function aurget() {
    [ -z "$1" ] && exit 2
    cd $HOME/src/clone/pkg
    git clone https://aur.archlinux.org/$1.git
    cd $1; clear; pwd
    ls -alhF --color=always
}

function fontq() {
    local font="$(fc-list : family | sk)"
    print '\n%s\n' "${font}"
}

function alldone() {
    clear;gum style --foreground 0 --border-foreground 2 --border=thick --align center --padding=1 --width 30 --height 3 --background=1 'All done!';printf '\n'
}

function man() {
  env LESS_TERMCAP_so="$(tput bold; tput setaf 3; tput setab 4)" \
      LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 7)" \
      LESS_TERMCAP_mb="$(tput bold; tput setaf 2)" \
      LESS_TERMCAP_md="$(tput bold; tput setaf 6)" \
      LESS_TERMCAP_se="$(tput rmso; tput sgr0)" \
      LESS_TERMCAP_ue="$(tput rmul; tput sgr0)" \
      LESS_TERMCAP_ZN="$(tput ssubm)" \
      LESS_TERMCAP_ZV="$(tput rsubm)" \
      LESS_TERMCAP_ZO="$(tput ssupm)" \
      LESS_TERMCAP_ZW="$(tput rsupm)" \
      LESS_TERMCAP_me="$(tput sgr0)" \
      LESS_TERMCAP_mr="$(tput rev)" \
      LESS_TERMCAP_mh="$(tput dim)" \
      GROFF_NO_SGR=1 \
      man $@
}
