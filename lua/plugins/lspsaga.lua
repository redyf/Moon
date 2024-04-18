return {
	"nvimdev/lspsaga.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		require("lspsaga").setup({
			beacon = {
				enable = true,
				border = "rounded", -- One of none, single, double, rounded, solid, shadow
			},
			ui = {
				border = "rounded", -- One of none, single, double, rounded, solid, shadow
				codeAction = "💡", -- Can be any symbol you want 💡
			},
			hover = {
				open_cmd = "!brave", -- Choose your browser
				open_link = "gx",
			},
			diagnostic = {
				border_follow = true,
				diagnostic_only_current = false,
				show_code_action = true,
			},
			symbol_in_winbar = {
				enable = true, -- Breadcrumbs
			},
			code_action = {
				extend_git_signs = false,
				show_server_name = true,
				only_in_cursor = true,
				num_shortcut = true,
				keys = {
					exec = "<CR>",
					quit = { "<Esc>", "q" },
				},
			},
			lightbulb = {
				enable = false,
				sign = false,
				virtual_text = true,
			},
			implement = {
				enable = false,
			},
			rename = {
				auto_save = false,
				keys = {
					exec = "<CR>",
					quit = { "<C-k>", "<Esc>" },
					select = "x",
				},
			},
			outline = {
				auto_close = true,
				auto_preview = true,
				close_after_jump = true,
				layout = "normal", -- normal or float
				win_position = "right", -- left or right
				keys = {
					jump = "e",
					quit = "q",
					toggle_or_ump = "o",
				},
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
		})
	end,
	init = function()
		vim.keymap.set("n", "gd", "<cmd>Lspsaga finder def", { silent = true, desc = "Goto Definition" })
		vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref", { silent = true, desc = "Goto References" })
		vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp", { silent = true, desc = "Goto Implementation" })
		vim.keymap.set(
			"n",
			"<leader>cd",
			"<cmd>Lspsaga show_line_diagnostics<CR>",
			{ silent = true, desc = "Line Diagnostics" }
		)
		vim.keymap.set("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>", { silent = true, desc = "Type Definition" })
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Hover" })
		vim.keymap.set("n", "<leader>cw", "<cmd>Lspsaga outline<CR>", { silent = true, desc = "Outline" })
		vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Code Action" })
		vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, desc = "Next Diagnostic" })
		vim.keymap.set(
			"n",
			"]d",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			{ silent = true, desc = "Previous Diagnostic" }
		)
	end,
}
