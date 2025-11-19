function pather
    set -l currentpath "$PATH"
    
    set -l outp (command pather $argv \
        | perl -pe "s/export/set -gx/g; s/'//g; s/=/ /g; s/:/ /g;")
    echo $outp
end
