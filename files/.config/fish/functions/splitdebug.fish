function splitdebug --description "split debug info from binary"
    for filename in $argv
        set -l fileoutp (file $filename)
        if string match -qr "ELF 64-bit" "$fileoutp"
            set -l rawbin $filename
            set -l debugonly "$filename".debug
            objcopy --only-keep-debug $rawbin $debugonly
            objcopy --remove-section=.gnu_debuglink $rawbin
            wstrip $rawbin
            objcopy --add-gnu-debuglink=$debugonly $rawbin
        end
    end
end
