return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			notify_on_error = true,
			lsp_fallback = true,
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
			formatters_by_ft = {
				["html"] = { "prettier", "prettierd", stop_after_first = true },
				["css"] = { "prettier", "prettierd", stop_after_first = true },
				["c"] = { "clang-format" },
				["cpp"] = { "clang-format" },
				["go"] = { "gofmt" },
				["java"] = { "google-java-format" },
				["python"] = { "ruff" },
				["lua"] = { "stylua" },
				["yaml"] = { "prettier", "prettierd", stop_after_first = true },
				["rust"] = { "rustfmt" },
				["markdown"] = { "prettier", "prettierd", stop_after_first = true },
				["markdown.mdx"] = { "prettier", "prettierd", stop_after_first = true },
				["javascript"] = { "prettier", "prettierd", stop_after_first = true },
				["javascriptreact"] = { "prettier", "prettierd", stop_after_first = true },
				["typescript"] = { "prettier", "prettierd", stop_after_first = true },
				["typescriptreact"] = { "prettier", "prettierd", stop_after_first = true },
				["json"] = { "jq" },
				["nix"] = { "nixfmt" },
				["bash"] = { "beautysh" },
				["elixir"] = { "mix" },
				["eelixir"] = { "mix" },
				["heex"] = { "mix" },
				["surface"] = { "mix" },
				["tf"] = { "terraform_fmt" },
				["terraform"] = { "terraform_fmt" },
			},
		},
		init = function()
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
				require("conform").format({ async = true })
			end, { silent = true, desc = "Format Lines" })
		end,
	},
}
