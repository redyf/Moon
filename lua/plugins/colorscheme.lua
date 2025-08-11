function ColorMe(color)
	color = color or "tokyonight-moon"
	-- color = color or "github_dark_high_contrast"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = true,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				on_highlights = function(hl, c)
					hl.TabLineFill = {
						bg = c.none,
					}
				end,
				on_colors = function(colors)
					colors.bg_statusline = colors.none
				end,
				styles = {
					comments = { italic = true },
					sidebars = "transparent",
					floats = "transparent",
				},
			})

			vim.cmd.colorscheme("tokyonight-moon")
			ColorMe()
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				background = {
					light = "mocha",
					dark = "mocha",
				},
				styles = {
					comments = { "italic" },
					conditionals = {},
					keywords = {},
					functions = {},
				},
				integrations = {
					alpha = true,
					bufferline = true,
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
					lsp_saga = false,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					native_lsp = {
						enabled = true,
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
							background = true,
						},
					},
					neogit = true,
					neotest = true,
					noice = true,
					notify = true,
					nvimtree = false,
					telescope = {
						enabled = true,
					},
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
