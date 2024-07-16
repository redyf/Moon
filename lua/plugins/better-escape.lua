return {
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = function()
			require("better_escape").setup({
				timeout = 200,
			})
		end,
	},
}
