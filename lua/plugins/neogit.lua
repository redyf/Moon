return {
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = function()
			require("neogit").setup({
				vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>"),
			})
		end,
	},
}
