return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
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
		end,
	},
}
