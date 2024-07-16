return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
	end,
	opts = {
		icons = {
			breadcrumb = "»",
			separator = "", -- ➜
			group = "+",
		},
	},
	-- local wk = require("which-key")
	-- local ui = require("harpoon.ui")
	-- local mark = require("harpoon.mark")
	--
	-- wk.register({
	-- 	["<leader>h"] = { name = "󰝆 +harpoon" },
	-- 	["<C-e>"] = {
	-- 		function()
	-- 			ui.toggle_quick_menu()
	-- 		end,
	-- 		desc = "Toggle Quick Menu",
	-- 	},
	-- 	["<leader>ha"] = {
	-- 		function()
	-- 			mark.add_file()
	-- 		end,
	-- 		desc = "Add File",
	-- 	},
	-- 	["<leader>hj"] = {
	-- 		function()
	-- 			ui.nav_file(1)
	-- 		end,
	-- 		desc = "Nav File 1",
	-- 	},
	-- 	["<leader>hk"] = {
	-- 		function()
	-- 			ui.nav_file(2)
	-- 		end,
	-- 		desc = "Nav File 2",
	-- 	},
	-- 	["<leader>hl"] = {
	-- 		function()
	-- 			ui.nav_file(3)
	-- 		end,
	-- 		desc = "Nav File 3",
	-- 	},
	-- 	["<leader>hm"] = {
	-- 		function()
	-- 			ui.nav_file(4)
	-- 		end,
	-- 		desc = "Nav File 4",
	-- 	},
	-- 	["<leader>hn"] = {
	-- 		function()
	-- 			ui.nav_next()
	-- 		end,
	-- 		desc = "Nav Next",
	-- 	},
	-- 	["<leader>hp"] = {
	-- 		function()
	-- 			ui.nav_prev()
	-- 		end,
	-- 		desc = "Nav Next",
	-- 	},
	-- }),
}
