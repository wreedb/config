# vim:ft=zsh

# compiler/library vars
declare -gx CC=clang
declare -gx CPP=mcpp
declare -gx CXX=clang++
declare -gx LD=lld
declare -gx AR=llvm-ar
declare -gx MAKEFLAGS='-j8'
declare -gx COMMON_FLAGS='-march=tigerlake -mtune=tigerlake -pipe -mno-kl -mno-sgx -mno-widekl -mshstk -O3'
declare -gx CFLAGS="${COMMON_FLAGS}"
declare -gx CXXFLAGS="${COMMON_FLAGS}"
declare -gx RUSTFLAGS='-C opt-level=3 -C target-cpu=tigerlake -C link-arg=-fuse-ld=lld'
declare -gx TMPDIR=/tmp

# default application vars
declare -gx MANWIDTH=70
declare -gx MANPAGER=less
declare -gx PAGER=less
declare -gx TERMINAL=kitty
declare -gx BROWSER=floorp
declare -gx EDITOR=doomclient
declare -gx MEDIAPLAYER=mpv
declare -gx IMAGEVIEWER=nsxiv
declare -gx LAUNCHER=bemenu-run
declare -gx FILEMANAGER=thunar
declare -gx INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

# programming lang and package managers
declare -gx GNUPGHOME=$XDG_DATA_HOME/gnupg
declare -gx HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
declare -gx HOMEBREW_CELLAR=/home/linuxbrew/.linuxbrew/Cellar
declare -gx HOMEBREW_REPOSITORY=/home/linuxbrew/.linuxbrew/Homebrew
declare -gx HOMEBREW_NO_ENV_HINTS=1
declare -gx GOPATH=$XDG_DATA_HOME/go
declare -gx GOMODCACHE=$GOPATH/pkg/mod
declare -gx GOWORK=$GOPATH/work
declare -gx GOBIN=$GOPATH/bin
declare -gx GOTMPDIR=$TMPDIR/go
declare -gx CARGO_HOME=$XDG_DATA_HOME/cargo
declare -gx RUSTUP_HOME=$XDG_DATA_HOME/rustup
declare -gx GEM_HOME=$XDG_DATA_HOME/gem
declare -gx GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
declare -gx JULIA_DEPOT_PATH=$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH
declare -gx PNPM_HOME=$XDG_DATA_HOME/pnpm
declare -gx PIPX_HOME=$XDG_DATA_HOME/pipx
declare -gx PIPX_BIN_DIR=$XDG_BIN_HOME
declare -gx PIPX_DEFAULT_PYTHON=python
declare -gx USE_EMOJI=0
declare -gx PERL_CPANM_HOME=$XDG_DATA_HOME/cpanm
declare -gx PERL_CPANM_OPT="--local-lib $XDG_DATA_HOME/perl --man-pages"
declare -gx PERLLIB="$XDG_DATA_HOME/perl/lib/perl5"
declare -gx PERL5LIB="$XDG_DATA_HOME/perl/lib/perl5"
declare -gx DENO_REPL_HISTORY=
declare -gx DENO_INSTALL_ROOT=$XDG_DATA_HOME/deno
declare -gx DENO_JOBS=8
declare -gx DENO_DIR=$XDG_CACHE_HOME/deno
declare -gx BUN_INSTALL=$XDG_DATA_HOME/bun
declare -gx MANPATH="$MANPATH:$HOMEBREW_PREFIX/share/man:$XDG_DATA_HOME/man:$XDG_DATA_HOME/perl/man" #$OPAM_SWITCH_PREFIX/man"

declare -gx LESSHISTFILE=-
declare -gx GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/gitconfig"
declare -gx GIT_CONFIG_SYSTEM="$XDG_CONFIG_HOME/git/gitconfig"
declare -gx GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0"
declare -gx _JAVA_AWT_WM_NONREPARENTING=1
declare -gx LC_COLLATE='C'

declare -gx COLORSCHEME='rose-pine'
declare -gx LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

# -- program specific options -- #

# cursor theme
declare -gx XCURSOR_THEME=phinger-light
declare -gx XCURSOR_SIZE=30

# N^3 (nnn)
declare -gx NNN_FIFO='/tmp/nnn.fifo'
declare -gx NNN_PLUG='p:preview-tui;x:!chmod +x $nnn'
declare -gx NNN_TMPFILE='/tmp/.lastd'
declare -gx NNN_OPTS='uUH'

declare -gx NNN_TRASH=1

# Doom
declare -gx EMACS=/usr/bin/emacs
declare -gx EMACSDIR=$XDG_CONFIG_HOME/emacs
declare -gx DOOMDIR=$XDG_CONFIG_HOME/doom

# zoxide
declare -gx _ZO_ECHO=1
declare -gx _ZO_DATA_DIR=$XDG_DATA_HOME/zoxide
declare -gx _ZO_MAXAGE=20000

# bemenu

declare -gx BEMENU_OPTS="--fn 'Myosevka 16' --ignorecase --prompt '' --ifne --scrollbar none --border 1 --bdr '#524f67' --border-radius 2 --cw 1 --width-factor 1 --no-overlap --tf '#EB6F92' --tb '#191724' --cf '#191724' --cb '#191724' --ff '#c4a7e7'--fb '#191724' --nf '#524f67' --nb '#191724' --af '#524f67' --ab '#191724' --hf '#31748F' --hb '#1f1d2e' --fbf '#9ccfd8' --fbb '#9ccfd8'"
[ -n "$(pgrep river)"    ] && declare -gx BEMENU_OPTS="--fn 'Myosevka 16' --ignorecase --list 10 --prompt '' --wrap --fixed-height --ifne --scrollbar none --border 1 --bdr '#524f67' --border-radius 2 --cw 1 --width-factor 0.3 --center --tf '#EB6F92' --tb '#191724' --cf '#191724' --cb '#191724' --ff '#c4a7e7' --fb '#191724' --nf '#524f67' --nb '#191724' --af '#524f67' --ab '#191724' --hf '#31748F' --hb '#1f1d2e' --fbf '#9ccfd8' --fbb '#9ccfd8' "
[ -n "$(pgrep qtile)"    ] && declare -gx BEMENU_OPTS="--fn 'Myosevka 16' --ignorecase --prompt '' --ifne --scrollbar none --border 1 --bdr '#524f67' --border-radius 2 --cw 1 --width-factor 1 --no-overlap --tf '#EB6F92' --tb '#191724' --cf '#191724' --cb '#191724' --ff '#c4a7e7'--fb '#191724' --nf '#524f67' --nb '#191724' --af '#524f67' --ab '#191724' --hf '#31748F' --hb '#1f1d2e' --fbf '#9ccfd8' --fbb '#9ccfd8'"
[ -n "$(pgrep Hyprland)" ] && declare -gx BEMENU_OPTS="--fn 'Myosevka 16' --ignorecase --list 10 --prompt '' --wrap --fixed-height --ifne --scrollbar none --border 1 --bdr '#524f67' --border-radius 2 --cw 1 --width-factor 0.3 --center --tf '#EB6F92' --tb '#191724' --cf '#191724' --cb '#191724' --ff '#c4a7e7' --fb '#191724' --nf '#524f67' --nb '#191724' --af '#524f67' --ab '#191724' --hf '#31748F' --hb '#1f1d2e' --fbf '#9ccfd8' --fbb '#9ccfd8' "
declare -U path

path=( /home/wbr/.local/share/JetBrains/Toolbox/scripts $XDG_DATA_HOME/perl/bin $DENO_INSTALL_ROOT/bin $XDG_DATA_HOME/bun/bin $HOME/.zvm/bin $PNPM_HOME $XDG_BIN_HOME $XDG_CONFIG_HOME/emacs/bin $path /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin )
