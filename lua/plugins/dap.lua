---@diagnostic disable: undefined-global
return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			{ "leoluz/nvim-dap-go", ft = { "go" } },
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text" },
			{ "nvim-neotest/nvim-nio" },
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			ui.setup()

			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { silent = true, desc = "Breakpoint Condition" })

			vim.keymap.set(
				"n",
				"<leader>db",
				"<cmd>DapToggleBreakpoint<cr>",
				{ silent = true, desc = "Toggle Breakpoint" }
			)

			vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { silent = true, desc = "Continue" })

			vim.keymap.set("n", "<leader>da", function()
				dap.continue({ before = get_args })
			end, { silent = true, desc = "Run with Args" })

			vim.keymap.set("n", "<leader>dC", function()
				dap.run_to_cursor()
			end, { silent = true, desc = "Run to cursor" })

			vim.keymap.set("n", "<leader>dg", function()
				dap.goto_()
			end, { silent = true, desc = "Go to line (no execute)" })

			vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { silent = true, desc = "Step into" })

			vim.keymap.set("n", "<leader>dj", function()
				dap.down()
			end, { silent = true, desc = "Down" })

			vim.keymap.set("n", "<leader>dk", function()
				dap.up()
			end, { silent = true, desc = "Up" })

			vim.keymap.set("n", "<leader>dl", function()
				dap.run_last()
			end, { silent = true, desc = "Run Last" })

			vim.keymap.set("n", "<leader>do", "<cmd>DapStepOut<cr>", { silent = true, desc = "Step Out" })

			vim.keymap.set("n", "<leader>dO", "<cmd>DapStepOver<cr>", { silent = true, desc = "Step Over" })

			vim.keymap.set("n", "<leader>dp", function()
				dap.pause()
			end, { silent = true, desc = "Pause" })

			vim.keymap.set("n", "<leader>dr", "<cmd>DapToggleRepl<cr>", { silent = true, desc = "Toggle REPL" })

			vim.keymap.set("n", "<leader>dR", "<cmd>DapRestart<cr>", { silent = true, desc = "Restart" })

			vim.keymap.set("n", "<leader>ds", function()
				dap.session()
			end, { silent = true, desc = "Session" })

			vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>", { silent = true, desc = "Terminate" })

			vim.keymap.set("n", "<leader>du", function()
				ui.toggle()
			end, { silent = true, desc = "Dap UI" })

			vim.keymap.set("n", "<leader>dw", function()
				require("dap.ui.widgets").hover()
			end, { silent = true, desc = "Widgets" })

			vim.keymap.set({ "n", "v" }, "<leader>de", function()
				ui.eval(nil, { enter = true })
			end, { silent = true, desc = "Eval" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
