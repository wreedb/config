# vim:ft=zsh:fileencoding=utf-8

source ~/.zshenv

plugins=$ZDOTDIR/plugins

[ -d "$plugins" ] || source getplugins.zsh

source $plugins/syntax-highlighting/plugin.zsh
source $plugins/autosuggestions/plugin.zsh
source $plugins/history-substring-search/plugin.zsh

zmodload zsh/complist

autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/zsh/compdump"

source $ZDOTDIR/options.zsh
source $XDG_CONFIG_HOME/shell/functions.sh

alias ls="eza --icons -s type -ahF --color=always"
alias ll="eza --icons -s type -o --no-permissions -alhF --color=always"
alias l="eza --icons -s type -a1hF --color=always"
alias la="eza --icons -s type -aaF --color=always"
alias rm='rm -v'
alias mkdir='mkdir -pv'
alias cp='cp --interactive --recursive --verbose'
alias cpt='cp --interactive --recursive --verbose -t'
alias rmd='rm -rvf'
alias grep='grep -i --color=auto'
alias rg='rg -i'
alias cat='bat --paging=never -upp'
alias bld="mkdir -pv bld && cd bld"

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias m=micro
alias nv=nvim
alias vim=nvim
alias ff=fastfetch
alias pf=pfetch
alias nf=neofetch
alias nnn='nnn -P p'

alias sx='sx >/dev/null 2>&1'

declare -U path PATH
declare -U fpath
declare -U manpath MANPATH
declare -U infopath INFOPATH

path=( ~/.local/bin $path )
fpath+="${LOCAL_SHARE}/zsh/functions"
manpath+=($LOCAL_MAN)
infopath+=($LOCAL_INFO)

declare -gx PATH
declare -gx MANPATH
declare -gx INFOPATH

eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"
# eval "$(keychain --agents gpg,ssh --quiet --dir $XDG_DATA_HOME/keychain --eval $HOME/.ssh/key)"
