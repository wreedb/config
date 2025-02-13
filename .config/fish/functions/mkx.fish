function mkx --description "create a file and make it executable"
    echo "#!/bin/sh" > $argv[1]
    chmod +x $argv[1]
end
