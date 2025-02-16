
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

set -gx PERL_CANARY_STABILITY_NOPROMPT 1
set -gx PERL_CPANM_HOME $XDG_DATA_HOME/cpanm
set -gx RUSTUP_HOME /opt/sw/rust/rustup
set -gx CARGO_HOME /opt/sw/rust/cargo
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GIT_CONFIG_NOSYSTEM 1
set -gx GIT_CONFIG_GLOBAL $XDG_CONFIG_HOME/git/config
set -gx GOPATH $XDG_DATA_HOME/go

# nodejs
set -gx NODE_REPL_HISTORY $XDG_CACHE_HOME/nodejs-history
set -gx NPM_CONFIG_EDITOR nvim
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -gx BUN_INSTALL /opt/sw/bun
set -gx DENO_INSTALL /opt/sw/deno
# set -gx NPM_CONFIG_GLOBAL true

set -gx CC  "cc"
set -gx CXX "c++"

set -l common_flags "-mtune=native -march=native -O2 -pipe"
set -gx CFLAGS $common_flags
set -gx CXXFLAGS $common_flags
set -gx CGO_CFLAGS $common_flags
set -gx CGO_CXXFLAGS $common_flags
set -gx RUSTFLAGS "-C target-cpu=native -C opt-level=3 -C link-arg=-fuse-ld=lld"

set -gx VEXE /opt/sw/v/v
set -gx VMODULES $XDG_DATA_HOME/vmodules
set -gx VCACHE $XDG_CACHE_HOME/vcache

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/sockets/ssh-agent"

set -gx SBCL_HOME $HOME/.local/opt/sbcl/lib/sbcl

set -gx HOMEBREW_PREFIX $XDG_DATA_HOME/homebrew
set -gx HOMEBREW_CELLAR $XDG_DATA_HOME/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY $XDG_DATA_HOME/homebrew
set -gx HOMEBREW_NO_ENV_HINTS 1
