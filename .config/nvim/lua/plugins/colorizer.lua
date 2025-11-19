return {
    {
        url = github "catgoose/nvim-colorizer.lua",
        name = "colorizer",
        enabled = true,
        event = "BufReadPre",
        opts = {
            user_default_options = {
                names = false,
                css = true,
                scss = true
            }
        };
    }
}
