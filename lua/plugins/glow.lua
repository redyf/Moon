return {
	"ellisonleao/glow.nvim",
	event = "VeryLazy",
	config = function()
		require("glow").setup({
			pager = false,
			width = 80,
			height = 100,
			width_ratio = 1, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
			height_ratio = 1,
		})
	end,
	init = function()
		vim.keymap.set("n", "<leader>cp", "<cmd>Glow<cr>", { desc = "Glow" })
	end,
}
