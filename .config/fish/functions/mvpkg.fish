function mvpkg
    test -d $_PKGSDIR; or return 1
    mv (pwd)/*.tar.* -t $_PKGSDIR
end
