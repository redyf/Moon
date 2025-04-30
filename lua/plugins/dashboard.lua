local function getRandomObject(array)
	local randomIndex = math.random(1, #array)
	return array[randomIndex]
end

local LOGOS = {
	-- { filename = "champloo.txt", height = 18, width = 61, animate = true },
	-- { filename = "thousand_sunny.txt", height = 33, width = 68, animate = false },
	-- { filename = "ed.txt", height = 28, width = 73, animate = true },
	{ filename = "ed2.txt", height = 28, width = 73, animate = true },
}

local DIRPATH = "~/.config/nvim/lua/plugins/"

return {
	{
		"goolord/alpha-nvim",
		enabled = true,
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			require("alpha.term")
			dashboard.opts.opts.noautocmd = true
			dashboard.section.terminal.opts.redraw = true

			local logo = getRandomObject(LOGOS)

			local command
			if logo.animate then
				command = "sh " .. DIRPATH .. "show.sh " .. DIRPATH .. "/" .. logo.filename
			else
				command = "cat " .. DIRPATH .. "/" .. logo.filename
			end

			dashboard.section.terminal.command = command
			dashboard.section.terminal.width = logo.width
			dashboard.section.terminal.height = logo.height

			dashboard.opts.layout = {
				{ type = "padding", val = 3 },
				dashboard.section.terminal,
				{ type = "padding", val = 3 },
				{
					type = "text",
					val = "@redyf",
					opts = {
						position = "center",
						hl = "Keyword",
					},
				},
				{ type = "padding", val = 3 },
				dashboard.section.buttons,
				dashboard.section.footer,
			}
			alpha.setup(dashboard.config)

			-- dashboard.section.header.val = {
			-- 	"    ██▀███  ▓█████ ▓█████▄▓██   ██▓  █████▒ ",
			-- 	"   ▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌▒██  ██▒▓██   ▒  ",
			-- 	"   ▓██ ░▄█ ▒▒███   ░██   █▌ ▒██ ██░▒████ ░  ",
			-- 	"   ▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌ ░ ▐██▓░░▓█▒  ░  ",
			-- 	"   ░██▓ ▒██▒░▒████▒░▒████▓  ░ ██▒▓░░▒█░     ",
			-- 	"   ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒   ██▒▒▒  ▒ ░     ",
			-- 	"     ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒ ▓██ ░▒░  ░       ",
			-- 	"     ░░   ░    ░    ░ ░  ░ ▒ ▒ ░░   ░ ░     ",
			-- 	"      ░        ░  ░   ░    ░ ░              ",
			-- 	"                                            ",
			-- 	"              git@github.com:redyf          ",
			-- }
			-- dashboard.section.header.opts = {
			-- 	position = "center",
			-- 	hl = "AlphaHeader",
			-- }

			-- alpha.setup(dashboard.config)
			dashboard.section.buttons.val = {
				-- dashboard.button("f", "  Find File", "<CMD>Telescope find_files<CR>"),
				dashboard.button("f", "  Find File", "<CMD>FzfLua files<CR>"),
				dashboard.button("n", "  New File", "function() vim.cmd[[ene]] end"),
				-- dashboard.button("r", "󰈚  Recent Files", "<CMD>Telescope oldfiles<CR>"),
				dashboard.button("r", "󰈚  Recent Files", function()
					-- Read from ShaDa to include files that were already deleted from the buffer list.
					vim.cmd("rshada!")
					require("fzf-lua").oldfiles()
				end),
				-- dashboard.button("g", "󰈭  Find Word", "<CMD>Telescope live_grep<CR>"),
				dashboard.button("g", "󰈭  Find Word", "<cmd>FzfLua live_grep<cr>"),
				-- dashboard.button("s", "  Restore Session", "function() require('persistence').load() end"),
				dashboard.button("q", "  Quit Neovim", "<cmd>qa<cr>"),
			}
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- 	config = function()
	-- 		require("dashboard").setup({
	--        -- stylua: ignore start
	--        -- config
	--        config = {
	--          header = {
	-- 			'    ██▀███  ▓█████ ▓█████▄▓██   ██▓  █████▒ ',
	-- 			'   ▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌▒██  ██▒▓██   ▒  ',
	-- 			'   ▓██ ░▄█ ▒▒███   ░██   █▌ ▒██ ██░▒████ ░  ',
	-- 			'   ▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌ ░ ▐██▓░░▓█▒  ░  ',
	-- 			'   ░██▓ ▒██▒░▒████▒░▒████▓  ░ ██▒▓░░▒█░     ',
	-- 			'   ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒   ██▒▒▒  ▒ ░     ',
	-- 			'     ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒ ▓██ ░▒░  ░       ',
	-- 			'     ░░   ░    ░    ░ ░  ░ ▒ ▒ ░░   ░ ░     ',
	-- 			'      ░        ░  ░   ░    ░ ░              ',
	-- 			'                                            ',
	-- 			'                                            ',
	--          },
	--          footer = {
	--            "",
	--            "git@github.com:redyf"
	--
	--          }
	--        },
	--  theme = "hyper",
	-- 		})
	-- 	end,
	-- },
}
