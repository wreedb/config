function xz
    for f in $argv
        test -r $f; or continue
        pixz -t -p(nproc) -9 < $f > "$f".xz; and sync
        command rm -f $f
    end
end