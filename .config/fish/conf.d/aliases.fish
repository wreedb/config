

set -l ezaignores ".identity|.identity-blob|.dub|.subversion|.gradle|.ant|.dart-tool|.m2|.mozilla|.thunderbird|.pki|.ssh|.sourcekit-lsp|.lldb|.ghcup|.cabal|.stack|.steam|.nv|.zen|.steampath|.steampid|.var|.guix-profile|.nix-profile|.nix-defexpr|compile_commands.json"
set -l eza "eza --colour --icons --header --no-permissions -o --group-directories-first -ah --classify=always --no-user --mounts --time=modified --ignore-glob='$ezaignores'"


alias ls "$eza"
alias ll "$eza --long"
alias lls "$eza --long --total-size"
alias l "$eza -1"
alias la "$eza --across"
alias tree "$eza --tree"

alias mv "mv -v"
alias cp "cp -v"
alias ln "ln -v"
alias rm "trash-put -v"

alias chmod "chmod -v"
alias chown "chown -v"
alias chgrp "chgrp -v"
alias install "install -v"
alias mkdir "mkdir -pv"
alias rmdir "rmdir -v"

alias gz "pigz -p$(nproc) -Rv9mn"
alias lzip "plzip -n$(nproc) -v9"
alias bz "bzip2 -v9"
alias zstd "zstd --rm -v19"
alias lzop "lzop -vU9"
alias lz4 "lz4 --rm -mv -T$(nproc)"

alias v nvim
alias vi nvim
alias vim nvim
alias nv nvim
alias nvi nvim
alias m micro
alias hg chg
