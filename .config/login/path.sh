#!/bin/bash -l

path_edit()
{
    if test -d "$1"
    then
	    if ! echo "${PATH}" | grep -qE "(^|:)$1($|:)"
        then
		    PATH="$1:${PATH}"
	    fi
    fi
}

path_edit "${BUN_INSTALL}/bin"
path_edit "${CARGO_HOME}/bin"
path_edit "${SWIFTLY_HOME}/bin"

export PATH
unset -f path_edit
