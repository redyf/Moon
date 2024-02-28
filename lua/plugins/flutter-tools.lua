return {
	{
		"akinsho/flutter-tools.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({})
			require("telescope").load_extension("flutter")
		end,
	},
}
