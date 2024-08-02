return {
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")

			elixir.setup({
				nextls = { enable = true },
				elixirls = {
					enable = true,
					settings = elixirls.settings({
						dialyzerEnabled = false,
						enableTestLenses = false,
					}),
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "<space>cp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("n", "<space>ctp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("v", "<space>cem", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
					end,
				},
				projectionist = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
