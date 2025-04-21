return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				c = { "cpplint" },
				cpp = { "cpplint" },
				go = { "golangci-lint" },
				nix = { "statix" },
				lua = { "selene" },
				python = { "ruff" },
				elixir = { "mix" },
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
				json = { "jsonlint" },
				java = { "checkstyle" },
				bash = { "shellcheck" },
			}
		end,
	},
}
