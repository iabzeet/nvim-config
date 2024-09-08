
    -- Catppuccin colorscheme with configuration
return {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup({
		flavour = "macchiato",
		background = {
		  light = "latte",
		  dark = "mocha",
	  },
	})
        vim.cmd.colorscheme "catppuccin"
    end,
    priority = 1000 -- Ensures it loads first
}
