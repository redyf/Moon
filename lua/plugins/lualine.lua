return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		enabled = false,
		config = function()
			local lualine = require("lualine")

			local icons = {
				mode = {
					n = "", -- Normal
					i = "✎ ", -- Insert
					v = "◉ ", -- Visual
					[""] = "◉ ", -- Visual Block
					c = "⌘ ", -- Command
					t = " ", -- Terminal
					other = " ", -- Outros modos
				},
				file = {
					modified = "+ ", -- Indicador de arquivo modificado
					readonly = "🔒 ", -- Indicador de arquivo somente leitura
				},
			}

			-- Função para obter o ícone do modo
			local function mode_icon()
				local mode = vim.fn.mode()
				return (icons.mode[mode] or icons.mode.other) .. vim.fn.mode():upper()
			end

			-- Definir um grupo de destaque para lualineblue com fundo azul do Catppuccin Mocha
			vim.api.nvim_set_hl(0, "LualineBlue", { bg = "#89b4fa", fg = "#1e1e2e" }) -- Azul do Catppuccin Mocha, texto escuro

			-- Configuração do lualine
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" }, --   or █
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function()
								return mode_icon()
							end,
						},
					},
					lualine_b = {
						{
							"filename",
							path = 1, -- Mostra o caminho relativo
							symbols = {
								modified = icons.file.modified,
								readonly = icons.file.readonly,
							},
						},
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {
						{
							"filetype",
							fmt = function(str)
								return str
							end, -- Apenas o tipo de arquivo (ex.: lua)
						},
						{
							-- Total de linhas
							function()
								return vim.fn.line("$")
							end,
							padding = { left = 1, right = 1 }, -- Controle de espaçamento
							color = "LualineBlue", -- Aplica o fundo azul
						},
						{
							-- Linha/coluna
							function()
								return string.format("%d/%d", vim.fn.line("."), vim.fn.col("."))
							end,
							padding = { left = 1, right = 1 }, -- Controle de espaçamento
							color = "LualineBlue", -- Aplica o fundo azul
						},
					},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {
						{
							"filename",
							path = 1,
							symbols = {
								modified = icons.file.modified,
								readonly = icons.file.readonly,
							},
						},
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {
						{
							"filetype",
							fmt = function(str)
								return str
							end,
							color = "LualineBlue", -- Aplica o fundo azul
						},
						{
							function()
								return vim.fn.line("$")
							end,
							padding = { left = 0, right = 1 },
							color = "LualineBlue", -- Aplica o fundo azul
						},
						{
							function()
								return string.format("%d/%d", vim.fn.line("."), vim.fn.col("."))
							end,
							padding = { left = 1, right = 1 },
							color = "LualineBlue", -- Aplica o fundo azul
						},
					},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})

			-- Reaplica o highlight ao mudar o colorscheme (caso necessário)
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "LualineBlue", { bg = "#89b4fa", fg = "#1e1e2e" })
				end,
			})
		end,
	},
}
