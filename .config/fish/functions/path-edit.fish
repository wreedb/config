function path-edit --description "Cleanly add to path without duplicating"
    if not contains $argv[1] $PATH
        set PATH $argv[1] $PATH
    end
end
