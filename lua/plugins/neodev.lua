return {
	"folke/neodev.nvim",
	event = "VeryLazy",
	opts = {
		library = {
			enabled = true,
			plugins = { "neotest", "nvim-dap-ui" },
			types = true,
		},
	},
}
