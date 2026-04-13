vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
vim.lsp.enable("luals")

vim.lsp.config("dockerls", {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_markers = { "Dockerfile", ".git" },
})
vim.lsp.enable("dockerls")

vim.lsp.config("terraformls", {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars", "hcl" },
	root_markers = { ".terraform", ".git", "main.tf", "terragrunt.hcl" },
	init_options = {
		experimentalFeatures = {
			validateOnSave = true,
			prefillRequiredFields = true,
		},
		validation = {
			enableEnhancedValidation = true,
		},
	},
})
vim.lsp.enable("terraformls")

vim.lsp.config["html"] = {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
}
vim.lsp.enable("html")

vim.lsp.config["cssls"] = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
}
vim.lsp.enable("cssls")

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = {
		"go.mod",
	},
	settings = {
		gopls = {
			hints = {
				rangeVariableTypes = true,
				parameterNames = true,
				constantValues = true,
				assignVariablesTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}
vim.lsp.enable("gopls")

vim.lsp.config("basedpyright", {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		"uv.lock",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "standard",
			},
		},
	},
})
vim.lsp.enable("basedpyright")

-- No NixOS, o pacote roslyn-ls fornece este binário pronto para uso
local roslyn_bin = vim.fn.exepath("Microsoft.CodeAnalysis.LanguageServer")

-- Se por acaso o binário não estiver no path, tentamos um fallback comum no Nix
if roslyn_bin == "" then
	roslyn_bin = "Microsoft.CodeAnalysis.LanguageServer"
end

vim.lsp.config["roslyn"] = {
	cmd = {
		roslyn_bin,
		"--logLevel",
		"Information",
		"--extensionLogDirectory",
		vim.fs.joinpath(vim.fn.stdpath("cache"), "roslyn"),
		"--stdio",
	},
	filetypes = { "cs", "razor" },
	root_markers = { ".git" },
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
		},
	},
}
vim.lsp.enable("roslyn")

vim.lsp.config["yamlls"] = {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	root_markers = { ".git" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			format = {
				enable = true,
			},
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
	},
}
vim.lsp.enable("yamlls")

vim.lsp.config["bashls"] = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash", "zsh" },
	root_markers = { ".git" },
}
vim.lsp.enable("bashls")

vim.lsp.config["tailwindcss"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"css",
		"scss",
		"sass",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"html",
		"heex",
		"elixir",
		"eelixir",
	},
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"package.json",
		".git",
	},
	init_options = {
		includeLanguages = {
			elixir = "html-eex",
			eelixir = "html-eex",
			heex = "html-eex",
		},
	},
}
vim.lsp.enable("tailwindcss")

vim.lsp.config["tsserver"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
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

local hostname = vim.fn.hostname()
local username = ({
	desktop = "redyf",
	selene = "selene",
})[hostname] or vim.env.USER
local flake_path = string.format("/home/%s/opensource/nixdots", username)

vim.lsp.config["nixd"] = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", "flake.lock", ".git" },
	settings = {
		nixd = {
			autowatch = true,
			nixpkgs = {
				expr = string.format('import (builtins.getFlake "%s").inputs.nixpkgs.outPath { }', flake_path),
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = string.format(
						'(builtins.getFlake "%s").nixosConfigurations.%s.options',
						flake_path,
						hostname
					),
				},
				home_manager = {
					expr = string.format(
						'(builtins.getFlake "%s").homeConfigurations."%s".options',
						flake_path,
						username
					),
				},
				flake_parts = {
					expr = string.format('(builtins.getFlake "%s").debug.options', flake_path),
				},
			},
		},
	},
}
vim.lsp.enable("nixd")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
		end

		local opts = { buffer = args.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<S-k>", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)
		vim.keymap.set("n", "<C-k>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, opts)
		vim.keymap.set("n", "<space>cw", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

		vim.keymap.set("n", "<space>cf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
	end,
})

vim.diagnostic.config({
	float = { border = "rounded" },
	virtual_lines = false,
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
})
