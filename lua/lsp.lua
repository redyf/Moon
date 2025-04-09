local cmp_config = require("plugins/cmp")
local capabilities = cmp_config.capabilities
vim.lsp.config["luals"] = {
	capabilities = capabilities,
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}
vim.lsp.enable("luals")

vim.lsp.config["dockerls"] = {
	cmd = { "dockerfile-language-server" },
	filetypes = { "dockerfile" },
	capabilities = capabilities,
}
vim.lsp.enable("dockerls")

vim.lsp.config["html"] = {
	cmd = { "html-lsp" },
	filetypes = { "html" },
	capabilities = capabilities,
}
vim.lsp.enable("html")

vim.lsp.config["cssls"] = {
	cmd = { "css-lsp" },
	filetypes = { "css", "scss", "less" },
	capabilities = capabilities,
}
vim.lsp.enable("cssls")

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	capabilities = capabilities,
}
vim.lsp.enable("clangd")

-- vim.lsp.config["jdtls"] = {
-- 	cmd = { "jdtls" },
-- 	filetypes = { "java" },
-- 	root_markers = {
-- 		"settings.gradle",
-- 		"settings.gradle.kts",
-- 		"pom.xml",
-- 		"build.gradle",
-- 		"mvnw",
-- 		"gradlew",
-- 		"build.gradle",
-- 		"build.gradle.kts",
-- 		".git",
-- 	},
-- 	capabilities = capabilities,
-- 	settings = {
-- 		java = {
-- 			autobuild = { enabled = true },
-- 			signatureHelp = { enabled = true },
-- 			completion = {
-- 				enabled = true,
-- 				importOrder = { "java", "javax", "com", "org" },
-- 			},
-- 		},
-- 	},
-- 	-- Adiciona handlers para comandos personalizados
-- 	init_options = {
-- 		bundles = {
-- 			vim.fn.expand("$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
-- 			-- unpack remaining bundles
-- 			(table.unpack or unpack)(vim.split(vim.fn.glob("$MASON/share/java-test/*.jar"), "\n", {})),
-- 		},
-- 	},
-- }
-- vim.lsp.enable("jdtls")

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go" },
	capabilities = capabilities,
}
vim.lsp.enable("gopls")

vim.lsp.config["pyright"] = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	capabilities = capabilities,
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace", -- ou "openFilesOnly" se preferir
				typeCheckingMode = "basic", -- opções: "off", "basic", "strict"
			},
		},
	},
}
vim.lsp.enable("pyright")

-- vim.lsp.config["csharp_ls"] =
-- 	{
-- 		cmd = { "csharp-ls" },
-- 		filetypes = { "cs", "csharp" },
-- 		root_markers = {
-- 			"*.sln",
-- 			"*.csproj",
-- 			".git",
-- 		},
-- 		settings = {},
-- 	} vim.lsp.enable("csharp_ls")

vim.lsp.config["omnisharp"] = {
	cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	filetypes = { "cs", "csharp" },
	capabilities = capabilities,
	root_markers = {
		"*.sln",
		"*.csproj",
		".git",
	},
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = true,
			OrganizeImports = true,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = true,
		},
		Sdk = {
			IncludePrerelease = false,
		},
	},
}
vim.lsp.enable("omnisharp")

vim.lsp.config["rust_analyzer"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			check_on_save = true,
			check = {
				command = "clippy",
			},
			proc_macro = {
				enable = true,
			},
		},
	},
}
vim.lsp.enable("rust_analyzer")

vim.lsp.config["jsonls"] = {
	cmd = { "json-lsp" },
	filetypes = { "json" },
	capabilities = capabilities,
}
vim.lsp.enable("jsonls")

vim.lsp.config["marksman"] = {
	cmd = { "marksman" },
	filetypes = { "markdown" },
	capabilities = capabilities,
}
vim.lsp.enable("marksman")

vim.lsp.config["taplo"] = {
	cmd = { "taplo" },
	filetypes = { "toml" },
	capabilities = capabilities,
}
vim.lsp.enable("taplo")

vim.lsp.config["yamlls"] = {
	cmd = { "yaml-language-server" },
	filetypes = { "yaml" },
	capabilities = capabilities,
}
vim.lsp.enable("yamlls")

vim.lsp.config["elixir-ls"] = {
	cmd = { "elixir-ls" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	capabilities = capabilities,
	root_markers = { "mix.exs", ".git" },
}
vim.lsp.enable("elixir-ls")

vim.lsp.config["bashls"] = {
	cmd = { "bash-language-server" },
	filetypes = { "bash", "csh", "ksh", "sh", "zsh" },
	capabilities = capabilities,
}
vim.lsp.enable("bashls")

vim.lsp.config["tailwindcss"] = {
	cmd = { "tailwindcss-language-server" },
	filetypes = { "css" },
	capabilities = capabilities,
	init_options = {
		includeLanguages = {
			elixir = "html-eex",
			eelixir = "html-eex",
			heex = "html-eex",
		},
	},
}
vim.lsp.enable("tailwindcss")

vim.lsp.config["prismals"] = {
	cmd = { "prisma-language-server" },
	filetypes = { "prisma" },
	capabilities = capabilities,
}
vim.lsp.enable("prismals")

vim.lsp.config["tsserver"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
			},
		},
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
	},
}
vim.lsp.enable("tsserver")

vim.lsp.config["nixd"] = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	capabilities = capabilities,
	settings = {
		nixd = {
			autowatch = true,
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/redyf/opensource/nixdots").inputs.nixpkgs { }',
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/redyf/opensource/nixdots/").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/redyf/opensource/nixdots").homeConfigurations."redyf".options',
				},
				flake_parts = {
					expr = '(builtins.getFlake "/home/redyf/opensource/nixdots").debug.options',
				},
			},
		},
	},
}
vim.lsp.enable("nixd")

vim.lsp.config["ocaml-lsp"] = {
	cmd = { "ocamllsp" },
	filetypes = { "ocaml" },
	capabilities = capabilities,
	root_markers = { "dune-project", "dune-workspace", ".git" },
}
vim.lsp.enable("ocaml-lsp")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Desativa o autocompletar nativo do LSP, já que usamos cmp
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(false, client.id, args.buf) -- Desativa explicitamente
		end

		-- Configuração de inlay hints (mantida)
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(false)
		end

		-- NÃO definir omnifunc manualmente, deixar o cmp gerenciar
		-- vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Removido

		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, opts)
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.diagnostic.config({
	float = { border = "rounded" },
	virtual_lines = { current_line = true },
	virtual_text = {
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
})
