function sldd
    objdump -p $argv[1] | grep --color=never "NEEDED" \
        | perl -pe 's/               /: /' \
        | perl -pe 's/^  //' \
        | perl -pe 's|^|\033[34m|; s|:|\033[0m:|'
end
