return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			notify_on_error = true,
			lsp_fallback = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				["html"] = { { "prettier", "prettierd", stop_after_first = true } },
				["css"] = { { "prettier", "prettierd", stop_after_first = true } },
				["c"] = { "clang-format" },
				["cpp"] = { "clang-format" },
				["go"] = { "gofumpt" },
				["java"] = { "google-java-format" },
				["python"] = { "ruff" },
				["lua"] = { "stylua" },
				["yaml"] = { "prettier", "prettierd", stop_after_first = true },
				["rust"] = { "rustfmt" },
				["markdown"] = { { "prettier", "prettierd", stop_after_first = true } },
				["markdown.mdx"] = { { "prettier", "prettierd", stop_after_first = true } },
				["javascript"] = { "prettier", "prettierd", stop_after_first = true },
				["javascriptreact"] = { "prettier", "prettierd", stop_after_first = true },
				["typescript"] = { "prettier", "prettierd", stop_after_first = true },
				["typescriptreact"] = { "prettier", "prettierd", stop_after_first = true },
				["json"] = { "jq" },
				["nix"] = { "nixfmt" },
				["haskell"] = { "ormolu" },
				["bash"] = { "beautysh" },
				["ocaml"] = { "ocamlformat" },
			},
		},
		init = function()
			-- Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
			vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
			vim.keymap.set(
				"n",
				"<leader>uf",
				"<cmd>FormatToggle<cr>",
				{ silent = true, desc = "Toggle Format Globally" }
			)
			vim.keymap.set(
				"n",
				"<leader>uF",
				"<cmd>FormatToggle!<cr>",
				{ silent = true, desc = "Toggle Format Locally" }
			)

			vim.keymap.set("n", "<leader>cf", function()
				require("conform").format()
			end, { silent = true, desc = "Format Buffer" })

			vim.keymap.set("v", "<leader>cF", function()
				vim.lsp.buf.format()
			end, { silent = true, desc = "Format Lines" })
		end,
	},
}
