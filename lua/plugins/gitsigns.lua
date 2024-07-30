dofile(vim.g.base46_cache .. "git")

return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				current_line_blame = false,
			})
		end,
		init = function()
			vim.keymap.set({ "n", "v" }, "<leader>gh", "+hunks", { silent = true, desc = "+hunks" })
			vim.keymap.set("n", "<leader>ghb", "<cmd>Gitsigns blame_line<cr>", { silent = true, desc = "Blame Line" })
			vim.keymap.set("n", "<leader>ghd", "<cmd>Gitsigns diffthis<cr>", { silent = true, desc = "Diff This" })
			vim.keymap.set(
				"n",
				"<leader>ghp",
				"<cmd>Gitsigns preview_hunk<cr>",
				{ silent = true, desc = "Preview Hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>ghR",
				"<cmd>Gitsigns reset_buffer<cr>",
				{ silent = true, desc = "Reset Buffer" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ghr",
				"<cmd>Gitsigns reset_hunk<cr>",
				{ silent = true, desc = "Reset Hunk" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ghs",
				"<cmd>Gitsigns stage_buffer<cr>",
				{ silent = true, desc = "Stage Buffer" }
			)
			vim.keymap.set(
				"n",
				"<leader>ghu",
				"<cmd>Gitsigns undo_stage_hunk<cr>",
				{ silent = true, desc = "Undo Stage Hunk" }
			)
		end,
	},
}
