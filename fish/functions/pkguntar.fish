function pkguntar
    if test -z $argv[1]
	echo "expected first argument as archive to use"
	return 1
    end
    if test -z $argv[2]
	echo "expected second argument as path to unpack to"
	return 1
    end
    
    sudo tar -f $argv[1] -C $argv[2] \
        --verbose \
        --extract \
        --exclude "manifest" \
        --exclude "manifest-uninstall" \
        --no-same-permissions \
        --no-same-owner \
        --no-xattrs
end
