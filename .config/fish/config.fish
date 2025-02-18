if not status is-interactive
    return
end

#function make
#    colormake --short $argv
#end

function hg
    chg $argv
end

function grep
    command grep --color=auto -i $argv
end

function dl
    command lwp-download -s $argv
end

function sbcl
    command rlwrap sbcl $argv
end

abbr -a mkdir  "mkdir -pv"
abbr -a mv     "mv -vi"
abbr -a mvt    "mv -vit"

abbr -a cp  "cp -vi"
abbr -a cpt "cp -vit"
abbr -a rg  "rg -i"

abbr -a ln   "ln -sv"
abbr -a lnr  "ln -svr"
abbr -a rm   "rm -v"
abbr -a rmd  "rm -rvf"

abbr -a m    micro
abbr -a vi   nvim
abbr -a nv   nvim
abbr -a vim  nvim
abbr -a nvi  nvim
abbr -a j    just

abbr -a cat    bsdcat
abbr -a cpio   bsdcpio
abbr -a unzip  bsdunzip

abbr -a --position anywhere "!!" --function last-command

starship init fish | source
zoxide init fish | source

# ssh-add -l >/dev/null 2>&1
# or ssh-add >/dev/null 2>&1
