# ~/.config/shell/path.sh

pathmunge path "${HOME}/.local/bin"
pathmunge man "${HOME}/.local/man"
pathmunge info "/usr/local/info"
pathmunge info "${HOME}/.local/info"

eval $(printf "export PATH=$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')")
