# vim:ft=bash

ezaignores=(
    .identity
    .identity-blob
    .dub
    .subversion
    .gradle
    .ant
    .dart-tool
    .m2
    .mozilla
    .thunderbird
    .pki
    .ssh
    .sourcekit-lsp
    .lldb
    .ghcup
    .cabal
    .stack
    .steam
    .nv
    .zen
    .steampath
    .steampid
    .var
    .guix-profile
    .nix-profile
    .nix-defexpr
)
_ignores="$(echo ${ezaignores[@]} | perl -pe 's/\x20/|/g')"
_eza="eza --colour=always --header --no-permissions -o --group-directories-first -ah --classify=always --icons --mounts --time=modified --ignore-glob='${_ignores}'"

alias ls="${_eza}"
alias ll="${_eza} --long"
alias lls="${_eza} --long --total-size"
alias l="${_eza} -1"
alias la="${_eza} --across"
alias tree="${_eza} --tree"

alias cp='cp -v'
alias rm='trash-put -v'
alias mv='mv -v'
alias ln='ln -v'

alias chmod='chmod -v'
alias chown='chown -v'
alias chgrp='chgrp -v'
alias install='install -v'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'
alias mount='mount -v'

alias gz='pigz -p8 -Rv9mn'
alias lzip='plzip -n8 -v9'
alias bz='bzip2 -v9'
alias zstd='zstd --rm -v19'
alias lzop='lzop -vU9'
alias lz4='lz4 --rm -mv -T8'

alias v=nvim
alias vi=nvim
alias vim=nvim
alias nvi=nvim
alias nv=nvim
alias m=micro
alias hg=chg
