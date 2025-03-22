if not status is-interactive
    return
end

abbr -a m micro
abbr -a vi nvim
abbr -a nv nvim
abbr -a vim nvim
abbr -a nvi nvim
abbr -a j just

abbr -a --position anywhere "!!" --function last-command

set -gx GPG_TTY (tty)
set -l sshkey $HOME/.ssh/key

if test -r ~/.cache/ssh-agent/info.fish
    source ~/.cache/ssh-agent/info.fish
end

if test -r ~/.cache/dirmngr/info.fish
    source ~/.cache/dirmngr/info.fish
end

starship init fish | source
zoxide init fish | source
