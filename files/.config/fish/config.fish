if not status is-interactive
    return
else
    true
end

set -gx MANWIDTH 78
set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"
set -gx MANROFFOPT "-P -c"
set -gx PAGER pager
set -gx LESSHISTFILE /dev/null

set -gx EDITOR editor
set -gx VISUAL editor

set -gx GPG_TTY (tty)

set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

if test -d $XDG_RUNTIME_DIR
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
    ssh-add $HOME/.ssh/key > /dev/null 2>&1
end

pather -ep /usr/lib/emscripten | source
pather -ep $XDG_BIN_HOME | source
pather -ep $RUSTUP_HOME/bin | source
pather -ep $BUN_INSTALL_BIN | source
pather -ea $SWIFTLY_BIN_DIR | source
# pather -ep ~/.nix-profile/bin | source
source (starship init fish --print-full-init | psub)
echo "$(zoxide init fish; fzf --fish; direnv hook fish)" | source
