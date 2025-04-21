return {
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
			{ "hrsh7th/cmp-buffer", event = "VeryLazy" },
			{ "hrsh7th/cmp-path", event = "VeryLazy" },
			{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },
			{ "L3MON4D3/LuaSnip", event = "VeryLazy" },
			{ "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
			{ "rafamadriz/friendly-snippets", event = "VeryLazy" },
			{ "onsails/lspkind.nvim", event = "VeryLazy" },
			{ "windwp/nvim-autopairs", event = "VeryLazy" },
			{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
		},
		enabled = false,
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			require("nvim-autopairs").setup()

			require("nvim-ts-autotag").setup()

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-e>"] = cmp.mapping.abort(),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path", max_item_count = 3 },
					{ name = "buffer", max_item_count = 5 },
					{ name = "copilot" },
					{ name = "luasnip", max_item_count = 3 },
				}),
				-- Enable pictogram icons for lsp/autocompletion
				formatting = {
					fields = { "kind", "abbr", "menu" },
					expandable_indicator = true,
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = {
							Copilot = "",
						},
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				},
				experimental = {
					ghost_text = true,
				},
			})

			-- Set configuration for specific filetype.
			-- cmp.setup.filetype("gitcommit", {
			-- 	sources = cmp.config.sources({
			-- 		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			-- 	}, {
			-- 		{ name = "buffer" },
			-- 	}),
			-- })

			-- Setup vim-dadbod
			-- cmp.setup.filetype({ "sql" }, {
			-- 	sources = {
			-- 		{ name = "vim-dadbod-completion" },
			-- 		{ name = "buffer" },
			-- 	},
			-- })

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Integrate cmp with neovim native LSP
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = { "documentation", "detail", "additionalTextEdits" },
				},
			}

			-- Apply capabilities to all native LSPs
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, capabilities)
				end,
			})
		end,
	},
}
