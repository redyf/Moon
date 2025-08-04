return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("treesitter-context").setup({
				mode = "topline",
			})
		end,
	},
}
