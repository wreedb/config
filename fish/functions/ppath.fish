function ppath --description "Pretty print the PATH variable"
    printenv PATH | perl -pe 's|:|\n|g' | perl -pe 's|/home/wbr|~|g'
end
