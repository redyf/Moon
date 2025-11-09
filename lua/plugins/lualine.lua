return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				vim.o.statusline = " "
			else
				vim.o.laststatus = 0
			end
		end,
		config = function()
			local clients_lsp = function()
				local bufnr = vim.api.nvim_get_current_buf()

				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if next(clients) == nil then
					return ""
				end

				local c = {}
				for _, client in pairs(clients) do
					table.insert(c, client.name)
				end
				return " " .. table.concat(c, "|")
			end

			local M = {
				options = {
					theme = "auto",
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "NvimTree", "snacks_dashboard" },
				},
				sections = {
					lualine_a = {
						{ "mode", icon = "" },
					},
					lualine_b = {
						{
							"filetype",
							icon_only = true,
							padding = { left = 1, right = 0 },
						},
						"filename",
					},
					lualine_c = {
						{
							"branch",
							icon = "",
						},
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							colored = false,
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = { error = " ", warn = " ", hint = " ", info = " " },
							update_in_insert = true,
						},
					},
					lualine_y = { clients_lsp },
					lualine_z = {
						{ "location", icon = "" },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			}

			require("lualine").setup(M)
		end,
	},
}
