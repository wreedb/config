function wstrip
    for n in $argv
        test -r $n; or return 1
        set -l bn (basename $n)
        switch (file $n)
            case '*ELF 64-bit LSB*executable*'
                echo -e "\033[32m*\033[0m \033[33mstrip\033[0m: elf binary $bn"
                strip --strip-all $n
            case '*shared object*'
                echo -e "\033[32m*\033[0m \033[33mstrip\033[0m: shared library $bn"
                strip --strip-unneeded $n
            case '*current ar archive*'
                echo -e "\033[32m*\033[0m \033[33mstrip\033[0m: static library $bn"
                strip --strip-debug $n
            case '*ELF 64-bit LSB*relocatable*'
                echo -e "\033[32m*\033[0m \033[33mstrip\033[0m: elf object $bn"
                strip --strip-debug $n
        end
    end
end
