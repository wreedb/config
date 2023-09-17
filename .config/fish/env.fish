set -gx LOCALDIR      ~/.local
set -gx LOCAL_BIN     ~/.local/bin
set -gx LOCAL_LIB     ~/.local/lib
set -gx LOCAL_TMP     ~/.local/tmp
set -gx LOCAL_SRC     ~/.local/src
set -gx LOCAL_VAR     ~/.local/var
set -gx LOCAL_MAN     ~/.local/man
set -gx LOCAL_MNT     ~/.local/mnt
set -gx LOCAL_OPT     ~/.local/opt
set -gx LOCAL_INFO    ~/.local/info
set -gx LOCAL_SHARE   ~/.local/share
set -gx LOCAL_STATE   ~/.local/state
set -gx LOCAL_MEDIA   ~/.local/media
set -gx LOCAL_INCLUDE ~/.local/include

set -gx XDG_DATA_HOME   ~/.local/share
set -gx XDG_CACHE_HOME  ~/.cache
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_STATE_HOME  ~/.local/state

set -gx XDG_DATA_DIRS   /usr/local/share:/usr/share
set -gx XDG_CONFIG_DIRS /usr/local/etc/xdg:/etc/xdg

set -gx COMMON_FLAGS '-march=tigerlake -mtune=native -pipe -O2'
set -gx RUSTFLAGS '-C opt-level=3 -C target-cpu=native -C link-arg=-fuse-ld=mold'
set -gx TMPDIR /tmp

set -gx MANWIDTH    80
set -gx PAGER       less
set -gx MANPAGER    less
set -gx TERMINAL    kitty
set -gx BROWSER     firefox
set -gx EDITOR      nvim
set -gx VISUAL      doomclient
set -gx VIDEO       mpv
set -gx IMAGE       nsxiv
set -gx LAUNCHER    bemenu-run
set -gx FILEMANAGER thunar

set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOBIN $GOPATH/bin
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx PERL_CPANM_HOME $XDG_DATA_HOME/cpanm
set -gx PERL_CPANM_OPT "--local-lib ~/.local --man-pages"
set -gx PERLLIB $LOCAL_LIB/perl5
set -gx PERL5LIB $LOCAL_LIB/perl5

set -gx LESSHISTFILE /dev/null
set -gx GIT_CONFIG_GLOBAL $XDG_CONFIG_HOME/git/gitconfig
set -gx GIT_CONFIG_SYSTEM $XDG_CONFIG_HOME/git/gitconfig
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0
set -gx _JAVA_AWT_WM_NONREPARENTING 1

set -gx LS_COLORS 'rs 0:di 01;34:ln 01;36:mh 00:pi 40;33:so 01;35:do 01;35:bd 40;33;01:cd 40;33;01:or 40;31;01:su 37;41:sg 30;43:ca 30;41:tw 30;42:ow 34;42:st 37;44:ex 01;32:*.tar 01;31:*.tgz 01;31:*.arj 01;31:*.taz 01;31:*.lzh 01;31:*.lzma 01;31:*.tlz 01;31:*.txz 01;31:*.zip 01;31:*.z 01;31:*.Z 01;31:*.dz 01;31:*.gz 01;31:*.lz 01;31:*.xz 01;31:*.bz2 01;31:*.bz 01;31:*.tbz 01;31:*.tbz2 01;31:*.tz 01;31:*.deb 01;31:*.rpm 01;31:*.jar 01;31:*.rar 01;31:*.ace 01;31:*.zoo 01;31:*.cpio 01;31:*.7z 01;31:*.rz 01;31:*.jpg 01;35:*.jpeg 01;35:*.gif 01;35:*.bmp 01;35:*.pbm 01;35:*.pgm 01;35:*.ppm 01;35:*.tga 01;35:*.xbm 01;35:*.xpm 01;35:*.tif 01;35:*.tiff 01;35:*.png 01;35:*.svg 01;35:*.svgz 01;35:*.mng 01;35:*.pcx 01;35:*.mov 01;35:*.mpg 01;35:*.mpeg 01;35:*.m2v 01;35:*.mkv 01;35:*.ogm 01;35:*.mp4 01;35:*.m4v 01;35:*.mp4v 01;35:*.vob 01;35:*.qt 01;35:*.nuv 01;35:*.wmv 01;35:*.asf 01;35:*.rm 01;35:*.rmvb 01;35:*.flc 01;35:*.avi 01;35:*.fli 01;35:*.flv 01;35:*.gl 01;35:*.dl 01;35:*.xcf 01;35:*.xwd 01;35:*.yuv 01;35:*.cgm 01;35:*.emf 01;35:*.axv 01;35:*.anx 01;35:*.ogv 01;35:*.ogx 01;35:*.aac 00;36:*.au 00;36:*.flac 00;36:*.mid 00;36:*.midi 00;36:*.mka 00;36:*.mp3 00;36:*.mpc 00;36:*.ogg 00;36:*.ra 00;36:*.wav 00;36:*.axa 00;36:*.oga 00;36:*.spx 00;36:*.xspf 00;36:';

set -gx NNN_FIFO '/tmp/nnn.fifo'
set -gx NNN_PLUG 'p:preview-tui;x:!chmod +x $nnn'
set -gx NNN_TMPFILE '/tmp/.lastd'
set -gx NNN_OPTS 'uUH'
set -gx NNN_TRASH 1

set -gx EMACS /usr/bin/emacs
set -gx EMACSDIR $XDG_CONFIG_HOME/emacs
set -gx DOOMDIR $XDG_CONFIG_HOME/doom

set -gx _ZO_ECHO 1
set -gx _ZO_DATA_DIR $XDG_DATA_HOME/zoxide
set -gx _ZO_MAXAGE 20000

set -gx BEMENU_OPTS "--fn 'JetBrains Mono 14' --border 1 --list 8 --prompt 'run: ' --bdr '#44475A' --tb '#21222C' --fb '#21222C' --tf '#6272A4' --ff '#50FA7B' --nb '#282A36' --ab '#282A36' --hb '#44475A' --nf '#BD93F9' --af '#BD93F9' --hf '#50FA7B'"

set -gx LESS_TERMCAP_so "$(tput bold; tput setaf 3; tput setab 4)"
set -gx LESS_TERMCAP_us "$(tput smul; tput bold; tput setaf 7)"
set -gx LESS_TERMCAP_mb "$(tput bold; tput setaf 2)"
set -gx LESS_TERMCAP_md "$(tput bold; tput setaf 6)"
set -gx LESS_TERMCAP_se "$(tput rmso; tput sgr0)"
set -gx LESS_TERMCAP_ue "$(tput rmul; tput sgr0)"
set -gx LESS_TERMCAP_ZN "$(tput ssubm)"
set -gx LESS_TERMCAP_ZV "$(tput rsubm)"
set -gx LESS_TERMCAP_ZO "$(tput ssupm)"
set -gx LESS_TERMCAP_ZW "$(tput rsupm)"
set -gx LESS_TERMCAP_me "$(tput sgr0)"
set -gx LESS_TERMCAP_mr "$(tput rev)"
set -gx LESS_TERMCAP_mh "$(tput dim)"
