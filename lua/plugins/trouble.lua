return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			auto_close = true,
		},
	},
	vim.keymap.set("n", "<leader>x", "+diagnostics/quickfix"),
	vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {
		silent = true,
		desc = "Document Diagnostics (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", {
		silent = true,
		desc = "Workspace Diagnostics (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle todo<cr>", {
		silent = true,
		desc = "Todo (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xQ", "<cmd>TodoQuickFix<cr>", {
		silent = true,
		desc = "Quickfix List (Trouble)",
	}),
}
