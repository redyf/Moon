return {
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		enabled = false,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			delete_to_trash = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
				["q"] = "actions.close",
			},
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				win_options = {
					winblend = 0,
				},
			},
			-- Configuration for the actions floating preview window
			preview = {
				border = "rounded", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				win_options = {
					winblend = 0,
				},
			},
		},
	},
	-- vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<cr>", { silent = true, desc = "Open Parent Directory" }),
}
