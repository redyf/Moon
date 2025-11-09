return {
	{
		"vyfor/cord.nvim",
		branch = "master",
		build = ":Cord update",
		event = "VeryLazy",
		enabled = true,
		opts = {
			display = {
				theme = "atom",
				flavor = "accent",
			},
		},
	},
}
