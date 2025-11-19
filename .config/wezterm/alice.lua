local module = {}

local alice_base = {
    foreground = "#EBEBEB",
    background = "#14161E",
    selection_fg = "#D7D7D7",
    selection_bg = "#494C59",
    cursor_fg = "#1A1D27",
    cursor_bg = "#80B0E0"
}

local alice_colors = {
    ansi = {
	    "#1A1D27",
	    "#FB7DA7",
	    "#76C5A4",
	    "#FDAD5D",
	    "#80B0E0",
	    "#AF98E6",
	    "#51C7DA",
  	    "#D7D7D7"
    },
    brights = {
	    "#494C59",
	    "#FB83AB",
	    "#7DC8A9",
	    "#E3CF67",
	    "#86B4E2",
	    "#B39DE7",
	    "#5ACADC",
	    "#ECECEC"
    }
}

function module.apply_to_config(config)
    config.color_schemes = {
	    ["Alice"] = {
		    foreground = alice_base.foreground,
		    background = alice_base.background,
			selection_fg = alice_base.selection_fg,
			selection_bg = alice_base.selection_bg,
			cursor_fg = alice_base.cursor_fg,
			cursor_bg = alice_base.cursor_bg,
			cursor_border = alice_colors.brights[0],
			split = alice_colors.ansi[3]
	    }
    };

	config.colors = alice_colors;
	config.bold_brightens_ansi_colors = "No"
end

return module
