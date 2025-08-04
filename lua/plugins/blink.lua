return {
	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		event = "VeryLazy",
		version = "1.*",

		opts = {
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			appearance = {
				kind_icons = require("utils.icons").kind,
			},

			snippets = { preset = "luasnip" },
			completion = {
				list = {
					selection = { preselect = false, auto_insert = true },
					max_items = 10,
				},
				ghost_text = {
					enabled = true,
				},
				documentation = {
					auto_show = true,
					window = {
						scrollbar = false,
					},
				},
				trigger = {
					show_on_trigger_character = true,
				},
				menu = {
					border = "rounded",
					scrollbar = false,
				},
			},

			signature = {
				enabled = true,
			},

			cmdline = {
				enabled = true,
				completion = {
					menu = { auto_show = true },
					list = {
						selection = { preselect = false, auto_insert = false },
					},
				},
			},

			sources = {
				-- Disable some sources in comments and strings.
				default = function()
					local sources = { "lsp", "buffer" }
					local ok, node = pcall(vim.treesitter.get_node)

					if ok and node then
						if not vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
							table.insert(sources, "path")
						end
						if node:type() ~= "string" then
							table.insert(sources, "snippets")
						end
					end

					return sources
				end,
			},
		},
		config = function(_, opts)
			require("blink.cmp").setup(opts)

			-- Extend neovim's client capabilities with the completion ones.
			vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
		end,
	},
}
