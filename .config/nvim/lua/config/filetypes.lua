local ft = vim.filetype

ft.add {
    extension = {
        repo = "ini",
        service = "ini",
        theme = "ini",
        target = "ini",
        socket = "ini",
        desktop = "ini",
        hl = "hyprlang",
        god = "god",
        zsh = "bash",
        sh = "bash",
        bash = "bash",
        scm = "scheme",
        ucl = "ucl"
    },
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        ["mimeapps.list"] = "desktop",
        [".profile"] = "bash",
        ["/etc/profile"] = "bash",
        ["/etc/bashrc"] = "bash",
        ["/etc/zsh/zshrc"] = "bash",
        ["/etc/zsh/zshenv"] = "bash",
        ["/etc/zsh/zprofile"] = "bash",
        [".zshrc"] = "bash",
        [".zshenv"] = "bash",
        [".zprofile"] = "bash",
        ["template"] = "bash",
        ["makepkg.conf"] = "bash",
        ["user-dirs.dirs"] = "bash",
        ["user-dirs.locale"] = "bash",
        ["dnf.conf"] = "ini",
        ["pacman.conf"] = "ini",
        ["mirrorlist"] = "ini",
        ["dunstrc"] = "ini",
        [".post-in"] = "bash",
        [".post-rm"] = "bash",
        ["*/dinit.d/*"] = "ini"
    }
};
