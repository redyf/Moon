return {
	{
		"NeogitOrg/neogit",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = function()
			require("neogit").setup()
			vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { silent = true, desc = "Neogit" })
		end,
	},
}
