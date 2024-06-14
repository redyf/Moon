return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
		config = function()
			require("tailwind-tools").setup({
				-- your configuration
			})
		end,
	},
}
