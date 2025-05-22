return {
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			view_options = {
				show_hidden = true, -- Optional, adjust as needed
			},
			float = {
				win_options = {
					winblend = 0, -- Ensure floating window is transparent
				},
			},
		},
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				keymaps = {
					["<C-h>"] = false,
					["q"] = "actions.close",
				},
				use_default_keymaps = true,
				view_options = {
					show_hidden = true,
				},
				vim.api.nvim_set_hl(0, "OilDir", { bg = "none", link = "Directory" }),
				vim.api.nvim_set_hl(0, "OilFile", { bg = "none" }),
				vim.api.nvim_set_hl(0, "OilBackground", { bg = "none" }),
				vim.api.nvim_set_hl(0, "OilBorder", { bg = "none", link = "FloatBorder" }),
				vim.keymap.set(
					"n",
					"<leader>o",
					"<cmd>Oil --float<cr>",
					{ silent = true, desc = "Open Parent Directory" }
				),
			})
		end,
	},
}
