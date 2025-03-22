
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config

set -gx GROFF_NO_SGR 1
set -gx MANROFFOPT "-c"
set -gx MANPAGER "ov --section-delimiter '^[^\s]' --section-header"
set -gx MANWIDTH 80
set -gx LESSHISTFILE /dev/null

set -gx EGET_CONFIG $XDG_CONFIG_HOME/eget/config.toml
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/config.toml
set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship/log

set -gx PERL_CANARY_STABILITY_NOPROMPT 1
set -gx PERL_CPANM_HOME $XDG_DATA_HOME/cpanm
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GIT_CONFIG_NOSYSTEM 1
set -gx GIT_CONFIG_GLOBAL $XDG_CONFIG_HOME/git/config
set -gx GOPATH $XDG_DATA_HOME/go
set -gx SWIFTLY_HOME $XDG_DATA_HOME/swiftly
set -gx SWIFTLY_BIN_DIR $SWIFTLY_HOME/bin


# nodejs
mkdir -p $XDG_CACHE_HOME/node
set -gx NODE_REPL_HISTORY $XDG_CACHE_HOME/node/repl-history
set -gx NPM_CONFIG_EDITOR nvim
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -gx BUN_INSTALL $XDG_DATA_HOME/bun

set -l common_flags "-march=skylake -mtune=native -O2 -pipe"
set -gx CFLAGS $common_flags
set -gx CXXFLAGS $common_flags
set -gx CGO_CFLAGS $common_flags
set -gx CGO_CXXFLAGS $common_flags
set -gx RUSTFLAGS "-C target-cpu=native -C link-arg=-fuse-ld=lld -C opt-level=3"

set -gx VFLAGS "-cc gcc"
mkdir -p $XDG_DATA_HOME/v
set -gx VMODULES $XDG_DATA_HOME/v/modules
set -gx VCACHE $XDG_DATA_HOME/v/cache
set -gx VTMP $XDG_DATA_HOME/v/tmp

set -gx GUILE_HISTORY $XDG_CACHE_HOME/guile/history
