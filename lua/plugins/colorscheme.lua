return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	enable = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		style = "moon",
	-- 	},
	-- },

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "moon", -- auto, main, moon, or dawn
	-- 			dark_variant = "main", -- main, moon, or dawn
	-- 			dim_inactive_windows = false,
	-- 			extend_background_behind_borders = true,
	--
	-- 			enable = {
	-- 				terminal = true,
	-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
	-- 				migrations = true, -- Handle deprecated options automatically
	-- 			},
	--
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = true,
	-- 				transparency = true,
	-- 			},
	--
	-- 			groups = {
	-- 				border = "muted",
	-- 				link = "iris",
	-- 				panel = "surface",
	--
	-- 				error = "love",
	-- 				hint = "iris",
	-- 				info = "foam",
	-- 				note = "pine",
	-- 				todo = "rose",
	-- 				warn = "gold",
	--
	-- 				git_add = "foam",
	-- 				git_change = "rose",
	-- 				git_delete = "love",
	-- 				git_dirty = "rose",
	-- 				git_ignore = "muted",
	-- 				git_merge = "iris",
	-- 				git_rename = "pine",
	-- 				git_stage = "iris",
	-- 				git_text = "rose",
	-- 				git_untracked = "subtle",
	--
	-- 				h1 = "iris",
	-- 				h2 = "foam",
	-- 				h3 = "rose",
	-- 				h4 = "gold",
	-- 				h5 = "pine",
	-- 				h6 = "foam",
	-- 			},
	--
	-- 			highlight_groups = {
	-- 				-- Comment = { fg = "foam" },
	-- 				-- VertSplit = { fg = "muted", bg = "muted" },
	-- 			},
	--
	-- 			before_highlight = function(group, highlight, palette)
	-- 				-- Disable all undercurls
	-- 				-- if highlight.undercurl then
	-- 				--     highlight.undercurl = false
	-- 				-- end
	-- 				--
	-- 				-- Change palette colour
	-- 				-- if highlight.fg == palette.pine then
	-- 				--     highlight.fg = palette.foam
	-- 				-- end
	-- 			end,
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = {
					light = "macchiato",
					dark = "mocha",
				},
				transparent_background = true,
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
						enabled = false,
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
					neogit = false,
					neotest = true,
					noice = false,
					notify = true,
					nvimtree = false,
					telescope = {
						enabled = true,
						style = "nvchad",
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
