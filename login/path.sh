# ~/.config/login/path.sh -*- bash -*- vim:ft=bash

prepend()
{
    if test -d "$1"; then

        if ! echo "$PATH" | grep -qE "(^|:)$1($|:)"
        then
            PATH="$1:$PATH"
        fi
    
    fi
}

prepend "$BUN_INSTALL/bin"
prepend "$CARGO_HOME/bin"
prepend "$SWIFTLY_HOME/bin"
prepend /opt/perl/bin
prepend "$GOPATH/bin"

export PATH
unset -f prepend