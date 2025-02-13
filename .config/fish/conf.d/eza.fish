# i just didn't want these in 'config.fish'

function ls
    eza --classify always \
        --icons always \
        --no-git -a \
        --group-directories-first \
        -w 80 $argv
end

function ll
    eza --classify always \
        --icons always \
        --no-git -a \
        --group-directories-first \
        --long --header \
        --no-permissions -o \
        --no-filesize $argv
end

function lls
    eza --classify always \
        --icons always \
        --no-git -a \
        --group-directories-first \
        --long --header \
        --color-scale \
        --color-scale-mode fixed $argv
end

function la
    eza --classify always \
        --icons always \
        --no-git -a \
        --group-directories-first \
        --across $argv
end

function tree
    eza --classify always \
        --icons always \
        --no-git -a \
        --group-directories-first \
        --tree $argv
end
