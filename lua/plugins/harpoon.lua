return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		enabled = false,
		config = function()
			local telescope = require("telescope")
			require("telescope").load_extension("harpoon")
			require("harpoon").setup({})

			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<C-e>", function()
				ui.toggle_quick_menu()
			end, { remap = true })
			vim.keymap.set("n", "<leader>ha", function()
				mark.add_file()
			end, { remap = true })
			vim.keymap.set("n", "<leader>hj", function()
				ui.nav_file(1)
			end, { remap = true })
			vim.keymap.set("n", "<leader>hk", function()
				ui.nav_file(2)
			end, { remap = true })
			vim.keymap.set("n", "<leader>hl", function()
				ui.nav_file(3)
			end, { remap = true })
			vim.keymap.set("n", "<leader>hm", function()
				ui.nav_file(4)
			end, { remap = true })
			vim.keymap.set("n", "<leader>hn", function()
				ui.nav_next()
			end, { remap = true })
			vim.keymap.set("n", "<leader>hp", function()
				ui.nav_prev()
			end, { remap = true })
		end,
	},
}
