function infopath-edit --description "Cleanly add to INFOPATH without duplicating"
    if not contains $argv[1] $INFOPATH
        set INFOPATH $argv[1] $INFOPATH
    end
end
