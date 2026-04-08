return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				auto_install = true,
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local bufnr = args.buf
					local ft = vim.bo[bufnr].filetype
					if ft == "" then
						return
					end
					local lang = vim.treesitter.language.get_lang(ft) or ft
					if pcall(vim.treesitter.start, bufnr, lang) then
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					end
				end,
			})
		end,
	},
}
