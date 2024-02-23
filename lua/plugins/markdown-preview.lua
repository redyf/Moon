return {
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		enabled = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = { "floorp" }
			vim.g.mkdp_theme = { "dark" }
		end,
		ft = { "markdown" },
	},
	vim.keymap.set("n", "<leader>cp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" }),
}
