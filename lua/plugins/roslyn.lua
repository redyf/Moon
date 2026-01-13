return {
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		ft = { "cs", "razor" },
		enabled = true,
		event = "VeryLazy",
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
}
