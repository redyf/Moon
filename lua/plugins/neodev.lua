return {
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		opts = {
			library = {
				enabled = true,
				plugins = { "neotest" },
				types = true,
			},
		},
	},
}
