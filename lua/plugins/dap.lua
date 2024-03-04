return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{
				"leoluz/nvim-dap-go",
				ft = { "go" },
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				opts = function(_, opts) end,
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			local mason_nvim_dap = require("mason-nvim-dap")
			dapui.setup()
			require("dap-go").setup()

			dap.adapters.lldb = {
				type = "executable",
				command = "/run/current-system/sw/bin/lldb-vscode", -- adjust as needed, must be absolute path
				name = "lldb",
			}

			-- -- C++
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Dart
			dap.adapters.dart = {
				{
					type = "executable",
					command = "flutter",
					args = { "debug_adapter" },
				},
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" },
			}
			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Dart",
					dartSdkPath = "/etc/profiles/per-user/redyf/bin/dart",
					flutterSdkPath = "/etc/profiles/per-user/redyf/bin/flutter", -- ensure this is correct
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
					args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = "/etc/profiles/per-user/redyf/bin/dart",
					flutterSdkPath = "/etc/profiles/per-user/redyf/bin/flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			}

			-- -- Rust
			-- dap.configurations.rust = {
			-- 	{
			-- 		name = "Launch",
			-- 		type = "lldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = "${workspaceFolder}",
			-- 		stopOnEntry = false,
			-- 		args = {},
			-- 	initCommands = function()
			-- 		-- Find out where to look for the pretty printer Python module
			-- 		local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
			--
			-- 		local script_import = 'command script import "'
			-- 			.. rustc_sysroot
			-- 			.. '/lib/rustlib/etc/lldb_lookup.py"'
			-- 		local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"
			--
			-- 		local commands = {}
			-- 		local file = io.open(commands_file, "r")
			-- 		if file then
			-- 			for line in file:lines() do
			-- 				table.insert(commands, line)
			-- 			end
			-- 			file:close()
			-- 		end
			-- 		table.insert(commands, 1, script_import)
			--
			-- 		return commands
			-- 	end,
			-- 	name = "Attach to process",
			-- 	type = "rust",
			-- 	request = "attach",
			-- 	pid = require("dap.utils").pick_process,
			-- 	args = {},
			-- 	},
			-- }
		end,
	},
	vim.keymap.set("n", "<leader>dB", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { silent = true, desc = "Breakpoint Condition" }),

	vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { silent = true, desc = "Toggle Breakpoint" }),

	vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { silent = true, desc = "Continue" }),

	vim.keymap.set("n", "<leader>da", function()
		require("dap").continue({ before = get_args })
	end, { silent = true, desc = "Run with Args" }),

	vim.keymap.set("n", "<leader>dC", function()
		require("dap").run_to_cursor()
	end, { silent = true, desc = "Run to cursor" }),

	vim.keymap.set("n", "<leader>dg", function()
		require("dap").goto_()
	end, { silent = true, desc = "Go to line (no execute)" }),

	vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { silent = true, desc = "Step into" }),

	vim.keymap.set("n", "<leader>dj", function()
		require("dap").down()
	end, { silent = true, desc = "Down" }),

	vim.keymap.set("n", "<leader>dk", function()
		require("dap").up()
	end, { silent = true, desc = "Up" }),

	vim.keymap.set("n", "<leader>dl", function()
		require("dap").run_last()
	end, { silent = true, desc = "Run Last" }),

	vim.keymap.set("n", "<leader>do", "<cmd>DapStepOut<cr>", { silent = true, desc = "Step Out" }),

	vim.keymap.set("n", "<leader>dO", "<cmd>DapStepOver<cr>", { silent = true, desc = "Step Over" }),

	vim.keymap.set("n", "<leader>dp", function()
		require("dap").pause()
	end, { silent = true, desc = "Pause" }),

	vim.keymap.set("n", "<leader>dr", "<cmd>DapToggleRepl<cr>", { silent = true, desc = "Toggle REPL" }),

	vim.keymap.set("n", "<leader>ds", function()
		require("dap").session()
	end, { silent = true, desc = "Session" }),

	vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>", { silent = true, desc = "Terminate" }),

	vim.keymap.set("n", "<leader>du", function()
		require("dapui").toggle()
	end, { silent = true, desc = "Dap UI" }),

	vim.keymap.set("n", "<leader>dw", function()
		require("dap.ui.widgets").hover()
	end, { silent = true, desc = "Widgets" }),

	vim.keymap.set({ "n", "v" }, "<leader>de", function()
		require("dapui").eval()
	end, { silent = true, desc = "Eval" }),
}
