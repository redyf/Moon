return {
	{
		"mfussenneger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		opts = {
			linters_by_ft = {
				nix = { "statix" },
				lua = { "selene" },
				python = { "flake8" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				json = { "jsonlint" },
				java = { "checkstyle" },
			},
		},
	},
}
