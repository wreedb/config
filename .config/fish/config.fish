bass source /etc/profile
if status is-interactive
    bass source /etc/profile
    source ~/.config/fish/env.fish
    source ~/.config/fish/functions.fish

    fish_add_path -p /bin
    fish_add_path -p /sbin
    fish_add_path -p /usr/bin
    fish_add_path -p /usr/sbin
    fish_add_path -p /usr/local/bin
    fish_add_path -p /usr/local/sbin
    fish_add_path -p /opt/bin
    fish_add_path -p /usr/lib/llvm/16/bin
    fish_add_path -p ~/.local/bin
    fish_add_path -p ~/.local/share/cargo/bin

    set -l eza 'eza --icons -s type --color always'

    alias ls "$eza -aF"
    alias ll "$eza -halF --no-permissions -o"
    alias la "$eza -aaF"
    alias l  "$eza -1Fa"

    abbr -a rm    'rm -v'
    abbr -a mkdir 'mkdir -pv'
    abbr -a cp    'cp -vir'
    abbr -a cpt   'cp -virt'
    abbr -a rmd   'rm -rvf'
    alias grep    'grep -i --color=always'
    alias rg      'rg -i'
    alias cat     'bat --paging never -upp'
    abbr -a bld   'mkdir -pv bld && cd bld'
    abbr -a sx    'sx >/dev/null 2>&1'

    abbr -a m    micro
    abbr -a v    nvim
    abbr -a nv   nvim
    abbr -a vim  nvim
    abbr -a ff   fastfetch
    abbr -a nf   neofetch
    abbr -a pf   pfetch
    abbr -a info pinfo

    abbr -a esr esearch
    abbr -a esl -p anywhere eselect

    abbr -a -p anywhere -- --help '--help 2>&1 | bat --language=help --style=plain'
    abbr -a !! -p anywhere --function last_history_item

    zoxide init fish | source
    starship init --print-full-init fish | source

end
