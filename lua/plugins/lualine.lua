-- return {
-- {
-- 	"nvim-lualine/lualine.nvim",
-- 	event = "VeryLazy",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local harpoon = require("harpoon.mark")
--
-- 		local function truncate_branch_name(branch)
-- 			if not branch or branch == "" then
-- 				return ""
-- 			end
--
-- 			-- Match the branch name to the specified format
-- 			local user, team, ticket_number = string.find(branch, "(%w+)%/(%w+)%-(%d+)%-")
--
-- 			-- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
-- 			if ticket_number then
-- 				return user .. "/" .. team .. "-" .. ticket_number
-- 			else
-- 				return branch
-- 			end
-- 		end
--
-- 		local function harpoon_component()
-- 			local total_marks = harpoon.get_length()
--
-- 			if total_marks == 0 then
-- 				return ""
-- 			end
--
-- 			local current_mark = "—"
--
-- 			local mark_idx = harpoon.get_current_index()
-- 			if mark_idx ~= nil then
-- 				current_mark = tostring(mark_idx)
-- 			end
--
-- 			return string.format("󱡅 %s/%d", current_mark, total_marks)
-- 		end
--
-- 		local function get_lsp_client(_)
-- 			---@type any?{}
-- 			local client_names = {}
-- 			local msg = "No Active Lsp"
-- 			local clients = vim.lsp.get_clients({ bufnr = 0 })
-- 			if next(clients) == nil then
-- 				return msg
-- 			end
-- 			for _, client in ipairs(clients) do
-- 				table.insert(client_names, client.name)
-- 			end
-- 			return #client_names == 0 and msg or table.concat(client_names, " | ")
-- 		end
-- 		local function wordcount()
-- 			return tostring(vim.fn.wordcount().words) .. " words"
-- 		end
-- 		local function readingtime()
-- 			return tostring(math.ceil(vim.fn.wordcount().words / 200.0)) .. " min"
-- 		end
-- 		local function is_markdown()
-- 			return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
-- 		end
-- 		local function navic()
-- 			return require("nvim-navic").get_location()
-- 		end
-- 		local function navic_is_available()
-- 			return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
-- 		end
-- 		local cmd_mode = function()
-- 			return require("noice").api.status.mode.get()
-- 		end
-- 		local show_mode = function()
-- 			return package.loaded["noice"] and require("noice").api.status.mode.has() or ""
-- 		end
--
-- 		require("lualine").setup({
-- 			-- options = {
-- 			-- 	icons_enabled = true,
-- 			-- 	theme = "auto",
-- 			-- 	component_separators = { left = "|", right = "|" },
-- 			-- 	section_separators = { left = "", right = "" }, --   or █
-- 			-- 	disabled_filetypes = {
-- 			-- 		statusline = { "dashboard", "alpha", "starter" },
-- 			-- 	},
-- 			-- 	ignore_focus = { "neo-tree" },
-- 			-- 	always_divide_middle = true,
-- 			-- 	globalstatus = true,
-- 			-- },
-- 			-- sections = {
-- 			-- 	lualine_a = {
-- 			-- 		{
-- 			-- 			"mode",
-- 			-- 			icon = "",
-- 			-- 		},
-- 			-- 	},
-- 			-- 	lualine_b = {
-- 			-- 		{
-- 			-- 			"branch",
-- 			-- 			icon = "",
-- 			-- 			fmt = truncate_branch_name,
-- 			-- 		},
-- 			-- 		harpoon_component,
-- 			-- 		"diff",
-- 			-- 		"diagnostics",
-- 			-- 	},
-- 			-- 	lualine_c = { { "filename", path = 1 } },
-- 			-- 	lualine_x = { "filetype" },
-- 			-- 	lualine_y = { "progress" },
-- 			-- 	lualine_z = {
-- 			-- 		function()
-- 			-- 			return " " .. os.date("%R")
-- 			-- 		end,
-- 			-- 	},
-- 			-- },
-- 			-- extensions = { "fzf", "lazy" },
-- 			options = {
-- 				component_separators = { "", "" },
-- 				globalstatus = true,
-- 				section_separators = "",
-- 				theme = vim.g.lualine_theme or "auto",
-- 			},
-- 			sections = {
-- 				lualine_a = {
-- 					{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
-- 					{ "filename", newfile_status = true, path = 1 },
-- 				},
-- 				lualine_b = { "diagnostics" },
-- 				lualine_c = {
-- 					{ navic, cond = navic_is_available },
-- 					{ get_lsp_client, icon = "" },
-- 				},
-- 				lualine_x = { { cmd_mode, cond = show_mode } },
-- 				lualine_y = {
-- 					{ wordcount, cond = is_markdown },
-- 					{ readingtime, cond = is_markdown },
-- 				},
-- 				lualine_z = { "diff" },
-- 			},
-- 			extensions = { "lazy", "fzf" },
-- 		})
-- 	end,
-- },
-- }
---@diagnostic disable: undefined-field
local M = {}

-- M.bufferline = {
-- 	"akinsho/bufferline.nvim",
-- 	version = "*",
-- 	dependencies = "nvim-tree/nvim-web-devicons",
-- 	opts = function()
-- 		return {
-- 			options = {
-- 				mode = "tabs",
-- 				style_preset = require("bufferline").style_preset.minimal,
-- 				always_show_bufferline = false,
-- 			},
-- 		}
-- 	end,
-- 	event = #vim.fn.gettabinfo() > 1 and "VeryLazy" or "TabNew",
-- }

M.lualine = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = function()
		local function get_lsp_client(_)
			---@type any?{}
			local client_names = {}
			local msg = "No Active Lsp"
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				table.insert(client_names, client.name)
			end
			return #client_names == 0 and msg or table.concat(client_names, " | ")
		end
		local function wordcount()
			return tostring(vim.fn.wordcount().words) .. " words"
		end
		local function readingtime()
			return tostring(math.ceil(vim.fn.wordcount().words / 200.0)) .. " min"
		end
		local function is_markdown()
			return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
		end
		local function navic()
			return require("nvim-navic").get_location()
		end
		local function navic_is_available()
			return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
		end
		local cmd_mode = function()
			return require("noice").api.status.mode.get()
		end
		local show_mode = function()
			return package.loaded["noice"] and require("noice").api.status.mode.has() or ""
		end
		return {
			options = {
				component_separators = { "", "" },
				globalstatus = true,
				section_separators = "",
				theme = vim.g.lualine_theme or "auto",
			},
			sections = {
				lualine_a = {
					{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
					{ "filename", newfile_status = true, path = 1 },
				},
				lualine_b = { "diagnostics" },
				lualine_c = {
					{ navic, cond = navic_is_available },
					{ get_lsp_client, icon = "" },
				},
				lualine_x = { { cmd_mode, cond = show_mode } },
				lualine_y = {
					{ wordcount, cond = is_markdown },
					{ readingtime, cond = is_markdown },
				},
				lualine_z = { "diff" },
			},
			extensions = {
				"lazy",
				"nvim-dap-ui",
				-- "nvim-tree",
				-- "c_quickfix"
			},
		}
	end,
}

return {
	-- M.bufferline,
	M.lualine,
	M.scope,
}
