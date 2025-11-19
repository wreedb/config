. /etc/profile

if [ -n "${BASH_VERSION}" ]; then
    [ -r /etc/bash.bashrc ] && source /etc/bash.bashrc
fi

if [ -n "${XDG_RUNTIME_DIR}" ]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    ssh-add "${HOME}/.ssh/key" > /dev/null 2>&1 || true
fi

export CC=gcc
export CXX=g++
export CPP=cpp

export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

eval "$(pathr -er /usr/bin/site_perl)"
eval "$(pathr -er /usr/bin/core_perl)"
eval "$(pathr -er /usr/bin/vendor_perl)"
eval "$(pathr -er /usr/local/sbin)"
eval "$(pathr -ep ${XDG_BIN_HOME})"

export PKG_CONFIG=pkgconf
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
eval "$(pathr -ev PKG_CONFIG_PATH -p /usr/local/share/pkgconfig)"
eval "$(pathr -ev PKG_CONFIG_PATH -p /usr/local/lib/pkgconfig)"

export MANWIDTH=78
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export PAGER=pager
export LESSHISTFILE=-

export VISUAL=editor
export EDITOR=editor

export B2_APPLICATION_KEY_ID="$(jq -r '.["keyID"]' ~/documents/keys/b2-application-key.json)"
export B2_APPLICATION_KEY="$(jq -r '.["applicationKey"]' ~/documents/keys/b2-application-key.json)"
