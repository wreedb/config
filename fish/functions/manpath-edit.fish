function manpath-edit --description "Cleanly add to MANPATH without duplicating"
    if not contains $argv[1] $MANPATH
        set MANPATH $argv[1] $MANPATH
    end
end
