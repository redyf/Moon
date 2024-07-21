return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			local conform = require("conform")
			conform.setup({
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_fallback = true }
				end,
				notify_on_error = true,
				lsp_fallback = true,
				formatters_by_ft = {
					["html"] = { { "prettierd", "prettier" } },
					["css"] = { { "prettierd", "prettier" } },
					["c"] = { "clang-format" },
					["go"] = { "gofumpt" },
					["java"] = { "google-java-format" },
					["python"] = { "black" },
					["lua"] = { "stylua" },
					["yaml"] = { "prettierd" },
					["rust"] = { "rustfmt" },
					["markdown"] = { { "prettierd", "prettier" } },
					["markdown.mdx"] = { { "prettierd", "prettier" } },
					["javascript"] = { "prettierd", "prettier" },
					["javascriptreact"] = { "prettierd", "prettier" },
					["typescript"] = { "prettierd", "prettier" },
					["typescriptreact"] = { "prettierd", "prettier" },
					["json"] = { "jq" },
					["nix"] = { "alejandra" },
					["haskell"] = { "ormolu" },
					["bash"] = { "beautysh" },
					["ocaml"] = { "ocamlformat" },
				},
			})
		end,
	},
	vim.keymap.set("n", "<leader>uf", "<cmd>FormatToggle<cr>", { silent = true, desc = "Toggle Format Globally" }),
	vim.keymap.set("n", "<leader>uF", "<cmd>FormatToggle!<cr>", { silent = true, desc = "Toggle Format Locally" }),

	vim.keymap.set("n", "<leader>cf", function()
		require("conform").format()
	end, { silent = true, desc = "Format Buffer" }),

	vim.keymap.set("v", "<leader>cF", function()
		vim.lsp.buf.format()
	end, { silent = true, desc = "Format Lines" }),
}
