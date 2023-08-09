# vim:ft=zsh:fileencoding=utf-8

declare -gx HISTFILE=$XDG_DATA_HOME/zsh/histfile
declare -gx HISTSIZE=3000
declare -gx SAVEHIST=3000


plugins=$ZDOTDIR/plugins

source $plugins/fast-syntax-highlighting/plugin.zsh
source $plugins/autosuggestions/plugin.zsh
source $plugins/history-substring-search/plugin.zsh

declare -U fpath
fpath=( $ZDOTDIR/completions $BUN_INSTALL $fpath )

autoload -Uz compinit && compinit -d $XDG_DATA_HOME/zsh/compdump.zsh

source $ZDOTDIR/options.zsh
source $ZDOTDIR/functions.zsh
source $XDG_CONFIG_HOME/tabtab/zsh/__tabtab.zsh

exa='exa --icons --sort=type --color=always'
alias ls="$exa -aF"
alias ll="$exa -alF"
alias l="$exa -a1F"
alias la="$exa -aaF"
alias rm='rm -v'
alias mkdir='mkdir -pv'
alias cp='cp --interactive --recursive --verbose'
alias cpt='cp --interactive --recursive --verbose -t'
alias rmd='rm -rvf --interactive=once'
alias info=pinfo
alias grep='rg -i'
alias rg='rg -i'
alias tar=bsdtar
alias bat='bat -upp'
alias cat=bsdcat
alias unzip=bsdunzip
alias rcpkg="vim $XDG_CONFIG_HOME/pacman/makepkg.conf"
alias bld="mkdir -pv bld && cd bld"
alias pp="doas powerpill"
alias p="powerpill"
alias '?'=pgrep
alias m=micro
alias nv=nvim
alias vim=nvim
alias ff=fastfetch
alias pf=pfetch
alias nf=neofetch
alias node='rlwrap node'
alias deno='rlwrap deno'
alias luarepl='rlwrap lua'
alias luajitrepl='rlwrap luajit'
alias ecl='rlwrap ecl'
alias sbcl='rlwrap sbcl'
alias clasp='rlwrap clasp'
alias sudo='fuzzel --log-level none --dmenu --lines 0 --password --prompt "Password: " | sudo --stdin'
alias nnn='nnn -P p'

NEWLINE=$'\n'

PROMPT="%F{green}%n%F{white}@%F{red}%m%f%k in %F{cyan}%3~ %f%k(%F{mag}%D{%I:%M%p}%f%k)${NEWLINE}%F{blue}->%f%k "

declare -gx NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(zoxide init zsh)"
eval "$(keychain --agents gpg,ssh --quiet --dir $XDG_DATA_HOME/keychain --eval $HOME/.ssh/key)"
