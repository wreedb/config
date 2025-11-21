set -gx DMD ldmd
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/config.toml

set -gx CPPFLAGS -D_FORTIFY_SOURCE=2
set -gx CFLAGS -march=x86-64 \
               -mtune=generic \
               -fdiagnostics-color \
               -fstack-clash-protection \
               -fstack-protector-strong \
               -fcf-protection=full \
               -fPIC \
               -pipe \
               -O2
#
set -gx CXXFLAGS $CFLAGS
set -gx LDFLAGS -Wl,-z,relro \
                -Wl,-z,now \
                -Wl,-z,noexecstack \
                -Wl,--as-needed



set -gx MAKEFLAGS -j$(nproc)
set -gx RUSTC srustc
set -gx RUSTFLAGS -C target-cpu=native \
                  -C relocation-model=pic \
                  -C opt-level=3 \
                  -C link-arg=-Wl,-z,relro \
                  -C link-arg=-Wl,-z,now \
                  -C link-arg=-Wl,-z,noexecstack \
                  -C link-arg=-Wl,--as-needed \
                  -C strip=none \
                  -C debuginfo=2 \
                  -C code-model=kernel


set -gx CARGO_HOME $XDG_DATA_HOME/rust
set -gx RUSTUP_HOME $CARGO_HOME
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOARCH amd64
set -gx GOAMD64 v3
set -gx GOOS linux
set -gx CGO_ENABLED 1

set -gx GUILE_AUTO_COMPILE 0
set -gx GUILE_HISTORY $XDG_CACHE_HOME/history/guile

set -gx PKG_CONFIG_PATH /usr/local/lib/pkgconfig:/usr/local/share/pkgconfig
set -gx CMAKE_PREFIX_PATH /usr/local:/usr

set -gx NINJA_STATUS (echo -e "[\033[32m%p\033[0m] [\033[34m%f\033[0m/\033[33m%t\033[0m] ")
set -gx NINJA_JOBS (nproc)

set -gx _PKGSDIR $HOME/packages

set -gx CC scc
set -gx CXX scxx
set -gx CPP scpp

set -gx BUN_INSTALL $XDG_DATA_HOME/bun
set -gx BUN_INSTALL_BIN $BUN_INSTALL/bin
set -gx BUN_INSTALL_GLOBAL_DIR $BUN_INSTALL_BIN

set -gx PERL_CPANM_OPT -M https://mirrors.osuosl.org/pub/cpan/ -v

set -gx FZF_DEFAULT_OPTS "--preview 'bat --color=always --theme=TwoDark --style=numbers,changes --line-range=:500 {}'"
