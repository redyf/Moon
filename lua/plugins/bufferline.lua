dofile(vim.g.base46_cache .. "bufferline")

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		enabled = true,
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			-- local catppuccin_hl = require("catppuccin.groups.integrations.bufferline").get()
			--local nord_hl = require("nord").bufferline.highlights({
			--	italic = true,
			--	bold = true,
			-- })
			require("bufferline").setup({
				options = {
					separator_style = "thick", -- slant | "slope" | "thick" | "thin" | { 'any', 'any' },
					-- highlights = catppuccin_hl,
				},
			})
			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle to Next Buffer" })
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle to previous buffer" })
			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle to next buffer" })
			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle to previous buffer" })
			vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
			vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
			-- Uncomment the block below if needed
			-- vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
			vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffers to the right" })
			vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete buffers to the left" })
			vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete other buffers" })
			vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle pin" })
			vim.keymap.set(
				"n",
				"<leader>bP",
				"<Cmd>BufferLineGroupClose ungrouped<CR>",
				{ desc = "Delete non-pinned buffers" }
			)
		end,
	},
}
