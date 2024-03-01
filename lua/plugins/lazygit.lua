return {
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "LazyGit" })
		end,
	},
}
