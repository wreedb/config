function infopath-edit --description "Cleanly add to INFOPATH without duplicating"
    if not contains $argv[1] $INFOPATH
        set INFOPATH $argv[1] $INFOPATH
    end
end
function manpath-edit --description "Cleanly add to MANPATH without duplicating"
    if not contains $argv[1] $MANPATH
        set MANPATH $argv[1] $MANPATH
    end
end

infopath-edit ~/.local/share/homebrew/share/info
manpath-edit ~/.local/share/homebrew/share/man
