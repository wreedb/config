return {
    url = github "goolord/alpha-nvim",
    name = "alpha",
    enabled = true,
    config = function()
        local theme = require "alpha.themes.startify";
        theme.file_icons.provider = "devicons";
        require "alpha".setup(theme.config);
    end
};
