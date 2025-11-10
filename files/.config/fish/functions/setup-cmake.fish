
function setup-cmake --description="boilerplate for cmake project setup"
    command cmake -B .build                    \
        -G Ninja                               \
        -Wno-dev                               \
        -Wno-deprecated                        \
        --log-level=WARNING                    \
        --no-warn-unused-cli                   \
        -D CMAKE_C_FLAGS="$CFLAGS"             \
        -D CMAKE_C_COMPILER="$CC"              \
        -D CMAKE_CXX_FLAGS="$CXXFLAGS"         \
        -D CMAKE_CXX_COMPILER="$CXX"           \
        -D CMAKE_POLICY_VERSION_MINIMUM="3.5"  \
        -D CMAKE_PREFIX_PATH="/usr/local;/usr" \
        -D CMAKE_SKIP_RPATH=TRUE               \
        -D CMAKE_SKIP_BUILD_RPATH=TRUE         \
        -D FETCHCONTENT_QUIET=OFF              \
        -D CMAKE_SKIP_INSTALL_RPATH=TRUE $argv
end
