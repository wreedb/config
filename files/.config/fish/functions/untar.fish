function untar --description="unpack tar archive easily"
    set -l archives $argv
    for t in $archives
        command gum spin \
            --title="unpacking $t..." \
            --spinner.foreground="3" \
            -- tar --no-same-owner -xf $t
    end
end
