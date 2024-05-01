return {
	{
		"LunarVim/breadcrumbs.nvim",
		event = "VeryLazy",
		config = function()
			require("breadcrumbs").setup()
		end,
	},
}
