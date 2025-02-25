function dnf-search --description "search with DNF while omitting common programming language library packages"
    dnf search \
        -x "texlive-*" \
        -x "rust-*" \
        -x "erlang-*" \
        -x "*golang-*" \
        -x "R-*" \
        -x "rubygem-*" \
		-x "perl-*" \
		-x "ocaml-*" \
        -x "ghc-*" \
        -x "python3-*" \
		-x "python-*" \
        -x "php-*" \
        -x "mingw32-*" \
        -x "mingw64-*" \
        -x "kf5-*" \
        -x "kf6-*" \
        $argv
end
