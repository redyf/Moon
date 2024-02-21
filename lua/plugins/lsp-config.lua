return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart", "LspStop", "LspLog", "LspRestart" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					plugins = { "neotest" },
					types = true,
				},
			})

			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"jsonls",
					"jdtls",
					"marksman",
					"pyright",
					"ruff_lsp",
					"taplo",
					"yamlls",
				},
				auto_install = true,
			})

			-- nvim-cmp supports additional completion capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.eslint.setup({})

			lspconfig.pyright.setup({})

			lspconfig.ruff_lsp.setup({})

			lspconfig.lua_ls.setup({
				Lua = {
					completion = {
						callSnippet = "replace",
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enabled = false,
					},
					hint = {
						enable = true,
					},
				},
			})

			lspconfig.rust_analyzer.setup({
				install_cargo = true,
				install_rustc = true,
				settings = {
					check_on_save = true,
					check = {
						command = "clippy",
					},
					proc_macro = {
						enable = true,
					},
				},
			})

			-- lspconfig.tsserver.setup({
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		typescript = {
			-- 			inlayHints = {
			-- 				-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
			-- 				includeInlayEnumMemberValueHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
			-- 			},
			-- 		},
			-- 		javascript = {
			-- 			inlayHints = {
			-- 				includeInlayEnumMemberValueHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			-- 			},
			-- 		},
			-- 	},
			-- })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>cw", vim.lsp.buf.workspace_symbol, opts)
					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<space>cf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
					vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				end,
			})

			require("lspconfig.ui.windows").default_options = {
				border = "rounded",
			}

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			vim.diagnostic.config({
				float = { border = "rounded" },
			})
		end,
	},
}
