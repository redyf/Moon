return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"    ██▀███  ▓█████ ▓█████▄▓██   ██▓  █████▒ ",
				"   ▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌▒██  ██▒▓██   ▒  ",
				"   ▓██ ░▄█ ▒▒███   ░██   █▌ ▒██ ██░▒████ ░  ",
				"   ▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌ ░ ▐██▓░░▓█▒  ░  ",
				"   ░██▓ ▒██▒░▒████▒░▒████▓  ░ ██▒▓░░▒█░     ",
				"   ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒   ██▒▒▒  ▒ ░     ",
				"     ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒ ▓██ ░▒░  ░       ",
				"     ░░   ░    ░    ░ ░  ░ ▒ ▒ ░░   ░ ░     ",
				"      ░        ░  ░   ░    ░ ░              ",
				"                                            ",
				"              git@github.com:redyf          ",
			}
			dashboard.section.header.opts = {
				position = "center",
				hl = "AlphaHeader",
			}

			require("alpha").setup(require("alpha.themes.dashboard").config)
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find File", "<CMD>Telescope find_files<CR>"),
				dashboard.button("n", "  New File", "function() vim.cmd[[ene]] end"),
				dashboard.button("r", "󰈚  Recent Files", "<CMD>Telescope oldfiles<CR>"),
				dashboard.button("g", "󰈭  Find Word", "<CMD>Telescope live_grep<CR>"),
				-- dashboard.button("s", "  Restore Session", "function() require('persistence').load() end"),
				dashboard.button("q", "  Quit Neovim", "<cmd>qa<cr>"),
			}
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
