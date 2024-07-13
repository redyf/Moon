return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				c = { "cpplint" },
				go = { "golangci-lint" },
				nix = { "statix" },
				lua = { "selene" },
				python = { "flake8" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				json = { "jsonlint" },
				java = { "checkstyle" },
				haskell = { "hlint" },
				bash = { "shellcheck" },
			}
		end,
	},
}
