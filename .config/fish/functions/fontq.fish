function fontq
    test -n $argv[1]
    or return 1
    
    fc-list : family | grep -i $argv[1]
end
