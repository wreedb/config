#if test -z "$SSH_AUTH_SOCK"
#
#    set -l sockdir $XDG_RUNTIME_DIR/sockets
#    set -l socket $sockdir/ssh-agent
#
#    if not test -d $sockdir
#        mkdir -p $sockdir
#        chmod 0700 $sockdir
#        ssh-agent -a $socket
#        set -gx SSH_AUTH_SOCK $socket
#    end
#end
