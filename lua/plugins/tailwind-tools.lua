return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		config = function()
			require("tailwind-tools").setup({})
		end,
	},
}
