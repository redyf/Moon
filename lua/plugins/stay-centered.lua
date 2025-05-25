return {
	{
		"arnamak/stay-centered.nvim",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("stay-centered").setup()
		end,
	},
}
