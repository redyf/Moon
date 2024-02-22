return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enable = true,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = {
					light = "macchiato",
					dark = "mocha",
				},
				transparent_background = true,
				integrations = {
					alpha = true,
					cmp = true,
					dap = true,
					dap_ui = true,
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = true,
						scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = true,
					},
					lsp_trouble = true,
					mason = true,
					mini = {
						enabled = disabled,
						indentscope_color = "",
					},
					native_lsp = {
						enabled = false,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = false,
						},
					},
					neogit = false,
					neotest = false,
					noice = false,
					notify = true,
					nvimtree = false,
					treesitter = true,
					treesitter_context = true,
					ufo = false,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
