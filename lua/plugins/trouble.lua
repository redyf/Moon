return {
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {
			auto_close = true,
		},
	},
	vim.keymap.set("n", "<leader>x", "+diagnostics/quickfix"),
	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
		silent = true,
		desc = "Diagnostics (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
		silent = true,
		desc = "Buffer Diagnostics (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo<cr>", {
		silent = true,
		desc = "Todo (Trouble)",
	}),
	vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", {
		silent = true,
		desc = "Quickfix List (Trouble)",
	}),
}
