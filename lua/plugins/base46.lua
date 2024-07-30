return {
	{
		"NvChad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"NvChad/ui",
		lazy = false,
		build = function()
			dofile(vim.fn.stdpath("data") .. "/lazy/ui/lua/nvchad_feedback.lua")()
		end,
	},
}
