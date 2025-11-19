function nixpaths
    if test -z $argv[1]
        echo "no mode specified, expected up or down"
        return 1
    end
    set -l mode $argv[1]
    switch $mode
        case up
            pather -ep ~/.nix-profile/bin | source
        case down
            pather -er ~/.nix-profile/bin | source
        case '*'
            echo "invalid mode '$mode', expected up or down"
            return 1
    end
end
