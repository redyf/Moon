return {
	{
		"SmiteshP/nvim-navic",
		event = "VeryLazy",
		config = function()
			local icons = require("config.icons")
			require("nvim-navic").setup({
				highlight = true,
				lsp = {
					auto_attach = true,
					preference = { "typescript-tools" },
				},
				click = true,
				separator = " " .. icons.ui.ChevronRight .. " ",
				depth_limit = 0,
				depth_limit_indicator = "..",
				icons = {
					File = " ",
					Module = " ",
					Namespace = " ",
					Package = " ",
					Class = " ",
					Method = " ",
					Property = " ",
					Field = " ",
					Constructor = " ",
					Enum = " ",
					Interface = " ",
					Function = " ",
					Variable = " ",
					Constant = " ",
					String = " ",
					Number = " ",
					Boolean = " ",
					Array = " ",
					Object = " ",
					Key = " ",
					Null = " ",
					EnumMember = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
			})
		end,
	},
}
