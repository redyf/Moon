return {
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "LazyGit" })
		end,
	},
}
