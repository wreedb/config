# -*- mode: fish; -*-

function bail --description "exit script with an error message and code"
    echo -e "\x1B[1;31m$argv[1]\x1B[0m"
end

function chx --description "make file executable"
    command chmod +x $argv
end

function ip
    command ip --color $argv
end

function curl
    command curl --config ~/.config/curlrc $argv
end

function file --description "get info about a file, pretty printed and with resolved links"
	set -f file_output ""


	
	if test -x $argv
	    set -f file_output "$(command file --dereference -b $argv | perl -pe 's|,\x20|\n|g; s|\n|\n\x1B[1;32m -\x1B[0m |g; s|\n.*$|\n|g')"
	end
	
	set -f relative_path "$(stat -c '%n' $argv)"
	set -f base_name "$(basename $argv)"
	set -f abs_path "$(readlink -en $argv)"
	set -f mime_type "$(mimetype -b $argv)"
	set -f def_app "$(xdg-mime query default $mime_type)"
	set -f own_user "$(stat -c '%U' $argv)"
	set -f own_grp "$(stat -c '%G' $argv)"
	set -f perms "$(stat -c '%a' $argv)"
	
	printf '\x1B[1;32mname\x1B[0m: %s\n' $base_name

	if test -L $argv
		printf '\x1B[1;32msymlink\x1B[0m: true\n'
	else
		printf '\x1B[1;32msymlink\x1B[0m: false\n'
		printf '\x1B[1;32mrelative\x1B[0m: %s\n' $relative_path
	end
	printf '\x1B[1;32mresolved\x1B[0m: %s\n' $abs_path
	printf '\x1B[1;32mmime-type\x1B[0m: %s\n' $mime_type
	if not test -d $argv
		set -f file_size "$(command du -h $argv | cut -f1)"
		printf '\x1B[1;32msize\x1B[0m: %s\n' $file_size
	end
	printf '\x1B[1;32mowner\x1B[0m: %s\n' $own_user
	printf '\x1B[1;32mgroup\x1B[0m: %s\n' $own_grp
	printf '\x1B[1;32mpermissions\x1B[0m: %s\n' $perms
	
	if test -n $file_output
		printf '\x1B[1;32mfile\x1B[0m: %s\n' $file_output
	else
		printf '\x1B[1;32mopener\x1B[0m: %s\n' $def_app
	end    

	printf '\n'

end

function mkx --description "create a file and make it executable"
    if test -f $argv[1]
	    echo "file already exists!"
	    return 1
    end
    echo '#!/bin/sh' > $argv[1]
    chmod +x $argv[1]
end

function make
    command colormake-short -j10 $argv
end

function cat
    command bsdcat $argv
end

function cpio
    command bsdcpio $argv
end

function unzip
    command bsdunzip $argv
end

function rm
    command trash-put --verbose $argv
end

function rmm
    command rm -v $argv
end

function mkdir
    command mkdir -pv $argv
end

function mv
    command mv -vi $argv
end

function mvt
    command mv -vit $argv
end

function cp
    command cp -iv $argv
end

function cpt
    command cp -ivt $argv
end

function ln
    command ln -sv $argv
end

function lnr
    command ln -srv $argv
end

function rg
    command rg -i $argv
end

function grep
    command grep --color=auto -i $argv
end

function dl
    command lwp-download -s $argv
end

function hg
    command chg $argv
end

#function dfc
#    command dfc -t ext4,xfs,btrfs,vfat,fat $argv 2>/dev/null
#end

#function dust
#    command dust -PD $argv
#end

function usys --description "systemd user-level control"
    test -z $argv[1]; and bail "please specify a target" && return 1 # ensure arg has been passed
    test -z $argv[2]; and bail "please specify an action" && return 1 # ensure arg has been passed
    
    switch $argv[2]
    case "x"
        set -f action "stop"
    case "u"
        set -f action "start"
    case "e"
        set -f action "enable"
    case "d"
        set -f action "disable"
    case "s"
        set -f action "status"
    case "*"
        set -f action $argv[2]
    end

    set -f target $argv[1]

    command systemctl --user $action $target
    
end
