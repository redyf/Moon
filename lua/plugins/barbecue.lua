return {
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		name = "barbecue",
		version = "*",
		enabled = true,
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
				theme = "auto",
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",

				-- include this if you have set `show_modified` to `true`
				"BufModifiedSet",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},
}
