return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-project.nvim",
			config = function()
				require("telescope").load_extension("project")
			end,
		},

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			cond = vim.fn.executable("cmake") == 1,
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key",
					["<esc>"] = function(...)
						return require("telescope.actions").close(...)
					end,
				},
			},
		},
		keymaps = {
			{ "<leader><space>", "find_files, {}", "Find project files" },
        {"<leader>/",
        "live_grep",
        "Grep (root dir)"
      },
      "<leader>:" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>b" = {
        action = "buffers, {}";
        desc = "+buffer";
      };
      "<leader>ff" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<leader>fr" = {
        action = "oldfiles, {}";
        desc = "Recent";
      };
      "<leader>fb" = {
        action = "buffers, {}";
        desc = "Buffers";
      };
      "<C-p>" = {
        action = "git_files, {}";
        desc = "Search git files";
      };
      "<leader>gc" = {
        action = "git_commits, {}";
        desc = "Commits";
      };
      "<leader>gs" = {
        action = "git_status, {}";
        desc = "Status";
      };
      "<leader>sa" = {
        action = "autocommands, {}";
        desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find, {}";
        desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands, {}";
        desc = "Commands";
      };
      "<leader>sD" = {
        action = "diagnostics, {}";
        desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags, {}";
        desc = "Help pages";
      };
      "<leader>sH" = {
        action = "highlights, {}";
        desc = "Search Highlight Groups";
      };
      "<leader>sk" = {
        action = "keymaps, {}";
        desc = "Keymaps";
      };
      "<leader>sM" = {
        action = "man_pages, {}";
        desc = "Man pages";
      };
      "<leader>sm" = {
        action = "marks, {}";
        desc = "Jump to Mark";
      };
      "<leader>so" = {
        action = "vim_options, {}";
        desc = "Options";
      };
      "<leader>sR" = {
        action = "resume, {}";
        desc = "Resume";
      };
      "<leader>uC" = {
        action = "colorscheme, {}";
        desc = "Colorscheme preview";
      },
		},
	},
	pickers = {
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
	},
	extensions = {
		-- extension_name = {
		--   extension_config_key = value,
		-- }
	},
}
