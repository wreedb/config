
# download a file
function get
    time saldl -Tg --memory-buffers $argv
end

# unset problematic compiler vars
function unsetcc
    set varlist CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS COMMON_FLAGS LD LDFLAGS AR AS
    
    for n in $varlist
        set -e $n
    end

end

# untar a tarball
function untar
    test -z $argv
    and return 1
    or bsdtar -xvf $argv
end

# clone an aur package
# given its name
function aurget
    if test -z $argv
        return 1
    else
        cd ~/.local/src/arch
        git clone https://aur.archlinux.org/$argv[1].git
        cd $argv[1]
    end
end

# search for a font on the
# system by its name
function fontq
    if test -z $argv
        return 1
    else
        fc-list : family | rg -i $argv
    end
end

# find binary location and
# resolve its symbolic link
# if it exists
function whichlink
    if test -z $argv
        return 1
    else
        which $argv[1] | xargs -r readlink
    end
end

function update-grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
end
