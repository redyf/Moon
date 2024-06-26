return {
	{
		"rcarriga/nvim-notify",
		enabled = true,
		lazy = false,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				fps = 60,
				render = "default",
				timeout = 500,
				topDown = true,
			})
			local notify = require("notify")

			-- Enable notifications for toggle commands
			local function show_notification(message, level)
				notify(message, level, { title = "conform.nvim" })
			end

			function ToggleLineNumber()
				if vim.wo.number then
					vim.wo.number = false
					show_notification("Line numbers disabled", "info")
				else
					vim.wo.number = true
					vim.wo.relativenumber = false
					show_notification("Line numbers enabled", "info")
				end
			end

			function ToggleRelativeLineNumber()
				if vim.wo.relativenumber then
					vim.wo.relativenumber = false
					show_notification("Relative line numbers disabled", "info")
				else
					vim.wo.relativenumber = true
					vim.wo.number = false
					show_notification("Relative line numbers enabled", "info")
				end
			end

			function ToggleWrap()
				if vim.wo.wrap then
					vim.wo.wrap = false
					show_notification("Wrap disabled", "info")
				else
					vim.wo.wrap = true
					vim.wo.number = false
					show_notification("Wrap enabled", "info")
				end
			end

			function ToggleInlayHints()
				if vim.lsp.inlay_hints then
					vim.lsp.inlay_hints = false
					show_notification("Inlay Hints disabled", "info")
				else
					vim.lsp.inlay_hints = true
					show_notification("Inlay Hints enabled", "info")
				end
			end

			vim.api.nvim_create_user_command("FormatToggle", function(args)
				local is_global = not args.bang
				if is_global then
					vim.g.disable_autoformat = not vim.g.disable_autoformat
					if vim.g.disable_autoformat then
						show_notification("Autoformat-on-save disabled globally", "info")
					else
						show_notification("Autoformat-on-save enabled globally", "info")
					end
				else
					vim.b.disable_autoformat = not vim.b.disable_autoformat
					if vim.b.disable_autoformat then
						show_notification("Autoformat-on-save disabled for this buffer", "info")
					else
						show_notification("Autoformat-on-save enabled for this buffer", "info")
					end
				end
			end, {
				desc = "Toggle autoformat-on-save",
				bang = true,
			})

			local filtered_message = { "No information available" }

			-- Override notify function to filter out messages
			---@diagnostic disable-next-line: duplicate-set-field
			vim.notify = function(message, level, opts)
				local merged_opts = vim.tbl_extend("force", {
					on_open = function(win)
						local buf = vim.api.nvim_win_get_buf(win)
						vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
					end,
				}, opts or {})

				for _, msg in ipairs(filtered_message) do
					if message == msg then
						return
					end
				end
				return notify(message, level, merged_opts)
			end
		end,
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
	},
}
