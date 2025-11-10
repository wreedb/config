# vim:ft=fish
function mktar --description="easily make a tar archive of a directory"
    test -d $argv[1]
    or return 1

    set -l arc (string replace -r '/$' '' -- $argv[1])
    
    command gum spin \
        --title="archiving $arc" \
        --spinner.foreground="4" \
        -- tar \
        --format=pax \
        --no-selinux \
        --no-acls \
        --no-xattrs \
        --no-same-owner \
        --create \
        --file "$arc".tar "$arc"
end
