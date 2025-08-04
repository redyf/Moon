return {
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("better_escape").setup({
				timeout = 200,
				default_mappings = false,
				mappings = {
					i = {
						j = {
							k = "<Esc>",
							j = "<Esc>",
						},
					},
					c = {
						j = {
							k = "<Esc>",
							j = "<Esc>",
						},
					},
					v = {
						j = {
							k = "<Esc>",
						},
					},
					s = {
						j = {
							k = "<Esc>",
						},
					},
				},
			})
		end,
	},
}
