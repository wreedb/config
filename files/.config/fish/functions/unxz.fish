function unxz
    for f in $argv
        test -r $f; or continue
        pixz -t -p(nproc) -d $f; and sync
    end
end