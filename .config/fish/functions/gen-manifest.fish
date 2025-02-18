function gen-manifest --description "generate manifest for local package"
    set -l manifest "$(find -type f,l | sed 's|^./||g')"
    echo -e "$manifest" > manifest
end
