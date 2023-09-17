#!/usr/bin/env fish

function last_history_item
    echo $history[1]
end

function fish_greeting
end

# unset problematic compiler vars
function unsetcc
    set varlist CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS COMMON_FLAGS LD LDFLAGS AR AS
    
    for n in $varlist
        set -e $n
    end

end

# create dir and cd into it
function mkcd
    test -z $argv
    and return 1
    or mkdir $argv && cd $argv
end

# extract a tarball
function untar
    test -f $argv
    and return 1
    or tar -xvf $argv
end

# create a tarball
function mktar
    test -f $argv
    and return 1
    or tar -cvf "$argv.tar" $argv
end

# search for a font on the system by its name
function fontq
    if test -z $argv
        return 1
    else
        fc-list : family | rg -i $argv
    end
end

# find binary location and resolve its symbolic link if it exists
function whichlink
    if test -z $argv
        return 1
    else
        /usr/bin/env which $argv[1] | xargs -r readlink
    end
end

# regenerate grub config file
function update-grub
    set -l rootcmd (command -v sudo) || set -l rootcmd (command -v doas)
    $rootcmd grub-mkconfig -o /boot/grub/grub.cfg
end

# update the initramfs with dracut
function update-initramfs
    set -l rootcmd (command -v sudo) || set -l rootcmd (command -v doas)
    $rootcmd dracut --force
end
