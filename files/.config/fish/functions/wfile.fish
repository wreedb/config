function wfile
    for f in $argv
        test -r $f; or return 1
        file $f | tr ',' '\n' | tr ':' '\n'
    end
end
