return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.surround").setup()
			require("mini.indentscope").setup()
		end,
	},
}
