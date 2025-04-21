return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
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
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = {
					auto_show = false,
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

			cmdline = {
				enabled = true,
				completion = {
					menu = { auto_show = true },
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
