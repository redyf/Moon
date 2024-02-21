return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enable = true,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "macchiato",
					dark = "mocha",
				},
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enable = false,
	},
}
