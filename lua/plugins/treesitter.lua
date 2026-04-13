return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,

		init = function()
			local ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"sh",
				"python",
				"go",
				"javascript",
				"typescript",
				"nix",
				"yaml",
				"json",
				"hcl",
				"dockerfile",
				"toml",
				"ini",
				"regex",
				"gitignore",
				"gitcommit",
				"gitattributes",
			}

			pcall(function()
				require("nvim-treesitter").install(ensure_installed)
			end)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local bufnr = args.buf
					local ft = vim.bo[bufnr].filetype

					if ft == "" then
						return
					end

					pcall(vim.treesitter.start, bufnr, ft)

					vim.opt_local.foldmethod = "expr"
					vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				end,
			})
		end,
	},
}
