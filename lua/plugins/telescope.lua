return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	cmd = { "Telescope" },
	event = "VeryLazy",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"ahmedkhalf/project.nvim",
			event = "VeryLazy",
			config = function()
				local telescope = require("telescope")
				require("telescope").load_extension("projects")
				require("project_nvim").setup({})
			end,
			keys = {
				{ "<leader>fp", "<CMD>Telescope projects<CR>", desc = "Projects" },
			},
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			event = "VeryLazy",
		},
	},
	keys = {
		{ "<leader><space>", "<CMD>Telescope find_files<CR>", desc = "Find project files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find project files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Search git files" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ "<leader>uC", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme Preview" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
	end,
}
