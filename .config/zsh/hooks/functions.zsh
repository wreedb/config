function wstrip() {
    for file in ${@}; do
        [ -r ${file} ] || return 1;

        local typ=$(file ${file})

        if echo ${typ} | grep -q 'shared object'; then
            strip --strip-unneeded ${file}
            echo -e "\e[32;1m*\e[0m \e[33mwstrip\e[0m: shared library $(basename ${file})"

        elif echo ${typ} | grep -q 'ELF 64-bit LSB pie executable'; then
            strip ${file}
            echo -e "\e[32;1m*\e[0m \e[33mwstrip\e[0m: PIE elf binary $(basename ${file})"

        elif echo ${typ} | grep -q 'ELF 64-bit LSB executable'; then
            strip ${file}
            echo -e "\e[32;1m*\e[0m \e[33mwstrip\e[0m: elf binary $(basename ${file})"

        elif echo ${typ} | grep -q 'current ar archive'; then
            strip --strip-debug ${file}
            echo -e "\e[32;1m*\e[0m \e[33mwstrip\e[0m: static archive $(basename ${file})"

        elif echo ${typ} | grep -q 'ELF 64-bit LSB relocatable'; then
            strip --strip-debug ${file}
            echo -e "\e[32;1m*\e[0m \e[33mwstrip\e[0m: elf relocatable $(basename ${file})"
        else
            true
        fi
    done
}

function wfile()
{
    for f in ${@}; do
        file ${f} \
        | tr ',' '\n'
    done
}

function wstripall()
{
    local files=($(fd . --no-hidden --no-ignore --no-require-git --no-ignore-vcs --ignore-file=${XDG_CONFIG_HOME}/fd/wstrip.ignore -t file -t symlink))
    for f in ${files[@]}; do
        wstrip ${f}
    done
}

function mktar() {
    [ -d ${1} ] || return 1;
    local arc=${1%/}
    command gum spin \
        --title="archiving ${arc}" \
        --spinner.foreground="4"   \
        -- tar \
        --format=pax \
        --no-selinux \
        --no-acls \
        --no-xattrs \
        --no-same-owner \
        --create \
        --file ${arc}.tar ${arc}
}

function bwd() { echo $(basename $(pwd)); }

function setup-meson()
{
    meson setup bld --prefix /usr --buildtype release ${@}
}

function setup-cmake() {
    command cmake -B bld                       \
        -G Ninja                               \
        -W no-dev                              \
        -W no-deprecated                       \
        --log-level=WARNING                    \
        --no-warn-unused-cli                   \
        -D CMAKE_C_FLAGS="${CFLAGS}"           \
        -D CMAKE_CXX_FLAGS="${CXXFLAGS}"       \
        -D CMAKE_POLICY_VERSION_MINIMUM="3.5"  \
        -D CMAKE_PREFIX_PATH=/usr              \
        -D CMAKE_BUILD_TYPE=None               \
        -D CMAKE_INSTALL_PREFIX=/usr           \
        -D CMAKE_SKIP_RPATH=ON                 \
        -D CMAKE_SKIP_BUILD_RPATH=ON           \
        -D CMAKE_SKIP_INSTALL_RPATH=ON         \
        -D BUILD_SHARED_LIBS=ON                \
        -D CMAKE_INSTALL_LIBDIR=lib            \
        -D CMAKE_INSTALL_SYSCONFDIR=/etc       \
        -D CMAKE_INSTALL_LOCALSTATEDIR=/var    \
        ${@}
}

function test-cmake()
{
    local blddir=$(pwd)/bld
    env -S                                      \
        LD_LIBRARY_PATH=${blddir}:${blddir}/lib \
        LIBRARY_PATH=${blddir}:${blddir}/lib    \
        PATH=${blddir}:${blddir}/bin:${PATH}    \
        ctest --test-dir ${blddir} -j2
}

function test-meson()
{
    meson test -C bld ${@}
}

function build-cmake()
{
    local blddir=$(pwd)/bld
    env -S                                      \
        LD_LIBRARY_PATH=${blddir}:${blddir}/lib \
        LIBRARY_PATH=${blddir}:${blddir}/lib    \
        PATH=${blddir}:${blddir}/bin:${PATH}    \
        cmake --build ${blddir} -j$(nproc) ${@}
}

function build-meson()
{
    command meson compile -C bld -j$(nproc) ${@}
}

function build-meson()
{
    command meson compile -C bld -j$(nproc) ${@}
}

function dest-cmake()
{
    mkdir -p $(bwd)
    DESTDIR=$(pwd)/$(bwd) cmake --install bld ${@}
}

function dest-meson()
{
    mkdir -p $(bwd)
    meson install -C bld --destdir $(pwd)/$(bwd)
}

function conf-meson()
{
    command meson configure bld ${@}
}

function untar()
{
    for archive in ${@}
    do
        command gum spin                       \
            --title="unpacking ${archive}..."  \
            --spinner.foreground="3"           \
            -- tar --no-same-owner -xf ${archive}
    done
}

function rmla()
{
    fd_cmd=$(has fd)
    if test -n ${fd_cmd}; then
        fd --no-ignore --no-hidden . -tf -e la -x rm -vf {}
    else
        find -name \*.la -delete
    fi
}

function sldd()
{
    objdump -p ${1}                         \
        | grep NEEDED                       \
        | perl -pe 's/               /: /'  \
        | perl -pe 's/^  //'                \
        | perl -pe 's|^|\033[34m|'          \
        | perl -pe 's|:|\033[0m:|'
}

function fontq()
{
    fc-list : family | rg --color=auto -i ${@}
}

function mkx()
{
    printf '#!/bin/sh\nexec 2>&1\n' | tee "${1}"
    chmod -v 755 "${1}"
}

function xz()
{
    for f in ${@}; do
        test -r ${f} || continue
        pixz -t -p$(nproc) -9 < ${f} > ${f}.xz && sync
        command rm -f ${f}
    done
}

function unxz()
{
    for f in ${@}; do
        test -r ${f} || continue
        pixz -t -p$(nproc) -d ${f} && sync
    done
}
