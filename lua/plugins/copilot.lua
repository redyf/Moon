return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
				},
				suggestion = {
					enabled = false,
				},
				filetypes = {
					["*"] = true, -- disable for all other filetypes and ignore default `filetypes`
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		lazy = false,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
