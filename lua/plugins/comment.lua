return {
	"numToStr/Comment.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx and jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
		local ft = require("Comment.ft")
		ft.set("reason", { "//%s", "/*%s*/" })
	end,
}
