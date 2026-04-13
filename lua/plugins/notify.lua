return {
	{
		"rcarriga/nvim-notify",
		enabled = true,
		event = "VeryLazy",
		config = function()
			local notify = require("notify")

			notify.setup({
				background_colour = "#000000",
				fps = 60,
				render = "default",
				timeout = 500,
				top_down = true,
			})

			local function show_notification(message, level)
				notify(message, level, { title = "conform.nvim" })
			end

			function ToggleLineNumber()
				vim.wo.number = not vim.wo.number
				show_notification(vim.wo.number and "Line numbers enabled" or "Line numbers disabled", "info")
			end

			function ToggleRelativeLineNumber()
				vim.wo.relativenumber = not vim.wo.relativenumber
				show_notification(
					vim.wo.relativenumber and "Relative line numbers enabled" or "Relative line numbers disabled",
					"info"
				)
			end

			function ToggleWrap()
				vim.wo.wrap = not vim.wo.wrap
				show_notification(vim.wo.wrap and "Wrap enabled" or "Wrap disabled", "info")
			end

			function ToggleInlayHints()
				local bufnr = 0
				local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })

				vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })

				show_notification(not is_enabled and "Inlay Hints enabled" or "Inlay Hints disabled", "info")
			end

			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					local current_dir = vim.fn.getcwd()
					local is_nixpkgs = current_dir:match("nixpkgs$")

					if is_nixpkgs then
						vim.b.disable_autoformat = true
						show_notification("Autoformat-on-save disabled for nixpkgs", "info")
					else
						vim.b.disable_autoformat = false
					end
				end,
			})

			vim.api.nvim_create_user_command("FormatToggle", function(args)
				local is_global = not args.bang

				if is_global then
					vim.g.disable_autoformat = not vim.g.disable_autoformat

					if vim.g.disable_autoformat then
						show_notification("Autoformat disabled globally", "info")
					else
						show_notification("Autoformat enabled globally", "info")
					end
				else
					vim.b.disable_autoformat = not vim.b.disable_autoformat

					if vim.b.disable_autoformat then
						show_notification("Autoformat disabled for buffer", "info")
					else
						show_notification("Autoformat enabled for buffer", "info")
					end
				end
			end, {
				desc = "Toggle autoformat-on-save",
				bang = true,
			})

			local filtered_message = { "No information available" }

			vim.notify = function(message, level, opts)
				for _, msg in ipairs(filtered_message) do
					if message == msg then
						return
					end
				end

				return notify(message, level, opts)
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
