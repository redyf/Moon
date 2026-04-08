return {
	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		event = { "InsertEnter", "CmdlineEnter" },
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
			snippets = { preset = "luasnip" },
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
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
						border = "solid",
					},
				},
				trigger = {
					show_on_trigger_character = true,
					show_on_keyword = true,
					show_on_insert_on_trigger_character = true,
				},
				menu = {
					border = "rounded",
					scrollbar = false,
				},
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
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
				default = function()
					local ft = vim.bo.filetype
					if ft == "nix" then
						return { "lsp", "buffer", "path", "snippets" }
					end
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
			opts.appearance = {
				kind_icons = require("utils.icons").kind,
			}
			require("blink.cmp").setup(opts)
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
			})
		end,
	},
}
