return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				-- registries = {
				-- 	"file:~/opensource/mason-registry",
				-- },
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				max_concurrent_installers = 10,
				-- setup your tools here
				ensure_installed = {
					-- js
					"eslint_d",
					"prettierd",
					-- JSON
					"jsonlint",
					"jq",
					-- java
					"checkstyle",
					"google_java_format",
					-- python
					"ruff",
					"black",
					-- lua
					"selene",
					"stylua",
				},
			})
		end,
	},
	-- {
	-- 	-- Setup your lsp here
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = {
	-- 				-- c
	-- 				-- "clangd",
	-- 				-- docker
	-- 				"dockerls",
	-- 				-- html/css
	-- 				"html",
	-- 				"cssls",
	-- 				"tailwindcss",
	-- 				-- lua
	-- 				"lua_ls",
	-- 				--json
	-- 				"jsonls",
	-- 				-- java
	-- 				"jdtls",
	-- 				-- python
	-- 				"pyright",
	-- 				-- markdown
	-- 				"marksman",
	-- 				-- toml
	-- 				"taplo",
	-- 				-- yaml
	-- 				"yamlls",
	-- 				-- go
	-- 				"gopls",
	-- 			},
	-- 			auto_install = true,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	lazy = false,
	-- 	config = function()
	-- 		-- nvim-cmp supports additional completion capabilities
	-- 		local lspconfig = require("lspconfig")
	-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
	--
	-- 		capabilities.textDocument.completion.completionItem = {
	-- 			documentationFormat = { "markdown", "plaintext" },
	-- 			snippetSupport = true,
	-- 			preselectSupport = true,
	-- 			insertReplaceSupport = true,
	-- 			labelDetailsSupport = true,
	-- 			deprecatedSupport = true,
	-- 			commitCharactersSupport = true,
	-- 			tagSupport = { valueSet = { 1 } },
	-- 			resolveSupport = {
	-- 				properties = {
	-- 					"documentation",
	-- 					"detail",
	-- 					"additionalTextEdits",
	-- 				},
	-- 			},
	-- 		}
	--
	-- 		lspconfig.lua_ls.setup({
	-- 			capabilities = capabilities,
	-- 			Lua = {
	-- 				completion = {
	-- 					callSnippet = "replace",
	-- 				},
	-- 				diagnostics = {
	-- 					globals = { "vim" },
	-- 				},
	-- 				telemetry = {
	-- 					enabled = false,
	-- 				},
	-- 				hint = {
	-- 					enable = true,
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		lspconfig.dockerls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.html.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.cssls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.clangd.setup({
	-- 			capabilities = capabilities,
	-- 			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	-- 		})
	--
	-- 		lspconfig.jdtls.setup({
	-- 			capatilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.gopls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.nixd.setup({
	-- 			capabilities = capabilities,
	-- 			cmd = { "nixd" },
	-- 			filetypes = { "nix" },
	-- 			settings = {
	-- 				nixd = {
	-- 					autowatch = true,
	-- 					nixpkgs = {
	-- 						expr = 'import (builtins.getFlake "/home/redyf/opensource/nixdots").inputs.nixpkgs { }',
	-- 					},
	-- 					formatting = {
	-- 						command = { "nixfmt" },
	-- 					},
	-- 					options = {
	-- 						nixos = {
	-- 							expr = '(builtins.getFlake "/home/redyf/opensource/nixdots/").nixosConfigurations.nixos.options',
	-- 						},
	-- 						home_manager = {
	-- 							expr = '(builtins.getFlake "/home/redyf/opensource/nixdots").homeConfigurations."redyf".options',
	-- 						},
	-- 						flake_parts = {
	-- 							expr = '(builtins.getFlake "/home/redyf/opensource/nixdots").debug.options',
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		lspconfig.pyright.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.ruff.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		-- lspconfig.csharp_ls.setup({
	-- 		-- 	cmd = { "csharp-ls" },
	-- 		-- 	filetypes = { "cs" },
	-- 		-- 	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
	-- 		-- 	init_options = {
	-- 		-- 		AutomaticWorkspaceInit = true,
	-- 		-- 	},
	-- 		-- })
	--
	-- 		lspconfig.omnisharp.setup({
	-- 			cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()), "--verbose" },
	-- 			autostart = true,
	-- 			enable_roslyn_analyzers = true,
	-- 			capabilities = capabilities,
	-- 			root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
	-- 		})
	--
	-- 		lspconfig.rust_analyzer.setup({
	-- 			capabilities = capabilities,
	-- 			settings = {
	-- 				["rust-analyzer"] = {
	-- 					check_on_save = true,
	-- 					check = {
	-- 						command = "clippy",
	-- 					},
	-- 					proc_macro = {
	-- 						enable = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		lspconfig.jsonls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.marksman.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.taplo.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.yamlls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.elixirls.setup({
	-- 			capabilities = capabilities,
	-- 			cmd = { "/home/redyf/.local/share/nvim/mason/bin/elixir-ls" },
	-- 		})
	--
	-- 		lspconfig.bashls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		lspconfig.ts_ls.setup({
	-- 			capabilities = capabilities,
	-- 			settings = {
	-- 				typescript = {
	-- 					inlayHints = {
	-- 						-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
	-- 						includeInlayEnumMemberValueHints = true,
	-- 						includeInlayFunctionLikeReturnTypeHints = true,
	-- 						includeInlayFunctionParameterTypeHints = true,
	-- 						includeInlayParameterNameHints = "all",
	-- 						includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
	-- 						includeInlayPropertyDeclarationTypeHints = true,
	-- 						includeInlayVariableTypeHints = true,
	-- 						includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
	-- 					},
	-- 				},
	-- 				javascript = {
	-- 					inlayHints = {
	-- 						includeInlayEnumMemberValueHints = true,
	-- 						includeInlayFunctionLikeReturnTypeHints = true,
	-- 						includeInlayFunctionParameterTypeHints = true,
	-- 						includeInlayParameterNameHints = "all",
	-- 						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	-- 						includeInlayPropertyDeclarationTypeHints = true,
	-- 						includeInlayVariableTypeHints = true,
	-- 						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		lspconfig.tailwindcss.setup({
	-- 			capabilities = capabilities,
	-- 			init_options = {
	-- 				includeLanguages = {
	-- 					elixir = "html-eex",
	-- 					eelixir = "html-eex",
	-- 					heex = "html-eex",
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		lspconfig.prismals.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		require("lspconfig.ui.windows").default_options = {
	-- 			border = "rounded",
	-- 		}
	--
	-- 		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 			border = "rounded",
	-- 		})
	--
	-- 		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 			border = "rounded",
	-- 		})
	--
	-- 		vim.diagnostic.config({
	-- 			float = { border = "rounded" },
	-- 			virtual_text = {
	-- 				prefix = "",
	-- 			},
	-- 			signs = true,
	-- 			underline = true,
	-- 			update_in_insert = true,
	-- 		})
	--
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	-- 			callback = function(args)
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				if client.supports_method("textDocument/inlayHint") then
	-- 					vim.lsp.inlay_hint.enable(false)
	-- 				end
	-- 				vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	--
	-- 				local opts = { buffer = args.buf }
	-- 				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- 				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	-- 				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	-- 				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
	-- 				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
	-- 				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- 				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	-- 				vim.keymap.set("n", "<space>cw", vim.lsp.buf.workspace_symbol, opts)
	-- 				vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
	-- 				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
	-- 				vim.keymap.set("n", "<space>cf", function()
	-- 					vim.lsp.buf.format({ async = true })
	-- 				end, opts)
	-- 				vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, opts)
	-- 				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	-- 				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
