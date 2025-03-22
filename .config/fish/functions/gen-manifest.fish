function gen-manifest --description "generate manifest for local package"
    set -l manifest "$(find -type f,l | sed 's|^./||g')"
    echo -e "$manifest" > manifest
    set -l umanifest "$(cat ./manifest | sed 's|^|/usr/local/|g')"
    echo -e "$umanifest" > manifest-uninstall
end
