function dest-cmake --description="DESTDIR install for cmake projects"
    mkdir -p (bwd)
    DESTDIR=(pwd)/(bwd) cmake --install .build $argv
end
