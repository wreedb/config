# vim:ft=zsh:fileencoding=utf-8
# @author: Will Reed

function update-grub() { doas grub-mkconfig -o /boot/grub/grub.cfg }

function unsetcc() {
    local vars=(CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS COMMON_FLAGS LD LDFLAGS AR AS)
    for i in $vars; do
        unset $i
    done
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
        which $1 | xargs -r cat
        print ''
    else
        print 'Did not find %s in your path.' "$1"
    fi
}


function fontq() {
    fc-list : family | grep -i --color=auto "$1"
}

function alldone() {
    clear;gum style --foreground 0 --border-foreground 2 --border=thick --align center --padding=1 --width 30 --height 3 --background=1 'All done!';printf '\n'
}

