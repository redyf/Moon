return {
	{
		"akinsho/flutter-tools.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({})
			-- .nvim.lua
			-- If you have more than one setup configured you will be prompted when you run
			-- your app to select which one you want to use
			-- require("flutter-tools").setup_project({
			-- 	{
			-- 		name = "ztm-flutter", -- an arbitrary name that you provide so you can recognise this config
			-- 		flavor = "DevFlavor", -- your flavour
			-- 		target = "lib/main.dart", -- your target
			-- 		device = "pixel_6", -- the device ID, which you can get by running `flutter devices`
			-- 	},
			-- })
			require("telescope").load_extension("flutter")
		end,
	},
}
