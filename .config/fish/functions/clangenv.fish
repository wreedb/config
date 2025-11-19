function clangenv --description "export clang compiler environment variables"
    set -e CC CXX CPP
    set -gx CC clang
    set -gx CXX clang++
    set -gx CPP clang-cpp
end
