
source ~/.config/env/profile.fish

if status is-interactive

    source ~/.config/env/profile.fish
    source ~/.config/fish/functions.fish
    
    set -l exa 'exa --icons -s type'
    
    abbr -a ls "$exa -aF"
    abbr -a ll "$exa -halF"
    abbr -a la "$exa -aaF"
    abbr -a l "$exa -1Fa"

    abbr -a rm 'trash'
    abbr -a mkdir 'mkdir -pv'
    abbr -a mkd 'mkdir -pv'
    abbr -a cp 'cp -rv'
    abbr -a cpt 'cp -rvt'
    
    abbr -a info 'pinfo'
    abbr -a rg 'rg -i'
    abbr -a tar 'bsdtar'
    abbr -a bat 'bat -upp'
    abbr -a cat 'bsdcat'
    abbr -a unzip 'bsdunzip'
    abbr -a bld 'mkdir -pv bld && cd bld'
    
    abbr -a install 'pakku -S'
    abbr -a search 'pakku -Ss'
    abbr -a provides 'pakku -F'
    abbr -a about 'pakku -Si'
    abbr -a refresh 'pakku -Syy && pakku -Fyy'
    abbr -a cleanup 'pakku -Scc'

    abbr -a m 'micro'
    abbr -a nv 'nvim'
    abbr -a vim 'nvim'
    abbr -a ff 'fastfetch'
    abbr -a nf 'neofetch'
    abbr -a pf 'pfetch'
    abbr -a nnn 'nnn -P p'

    function last_history_item
        echo $history[1]
    end
    
    abbr -a !! --position anywhere --function last_history_item

    zoxide init fish | source

end
