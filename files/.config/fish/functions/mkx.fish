function mkx
    test -e $argv[1]
    and return 1
    echo -e '#!/bin/sh\nexec 2>&1' | tee $argv[1]
    chmod -v 755 $argv[1]
end
