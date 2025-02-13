function pkguntar
    if test -z $argv[1]; exit 1; end
    if test -z $argv[2]; exit 1; end

    sudo tar -f $argv[1] -C $argv[2] \
        --verbose \
        --extract \
        --exclude "manifest" \
        --no-same-permissions \
        --no-same-owner \
        --no-xattrs
end
