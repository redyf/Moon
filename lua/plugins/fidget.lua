return {
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			progress = {
				suppress_on_insert = true, -- Suppress new messages while in insert mode
				ignore_done_already = false, -- Ignore new tasks that are already complete
				ignore_empty_message = false, -- Ignore new tasks that don't contain a message
			},
			-- Clear notification group when LSP server detaches
			notification = {
				override_vim_notify = true,
				window = {
					winblend = 0,
					border = "none", -- none, single, double, rounded, solid, shadow
				},
			},
		},
	},
}
