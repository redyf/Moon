vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: Move general mappings to which-key

-- Disable arrow keys
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>", { silent = true, desc = "Disable Up arrow key" })
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>", { silent = true, desc = "Disable Down arrow key" })
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>", { silent = true, desc = "Disable Right arrow key" })
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>", { silent = true, desc = "Disable Left arrow key" })

-- General maps
vim.keymap.set("n", "<leader>f", "+find/file")
vim.keymap.set("n", "<leader>s", "+search")
vim.keymap.set("n", "<leader>q", "+quit/session")
vim.keymap.set({ "n", "v" }, "<leader>g", "+git")
vim.keymap.set("n", "<leader>u", "+ui")
vim.keymap.set("n", "<leader>w", "+windows")
vim.keymap.set("n", "<leader><tab>", "+tab")
vim.keymap.set({ "n", "v" }, "<leader>d", "+debug")
vim.keymap.set({ "n", "v" }, "<leader>c", "+code")
vim.keymap.set({ "n", "v" }, "<leader>t", "+test")

-- Tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { silent = true, desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { silent = true, desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { silent = true, desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { silent = true, desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { silent = true, desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { silent = true, desc = "Previous Tab" })

-- Windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { silent = true, desc = "Other Window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { silent = true, desc = "Delete Window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { silent = true, desc = "Split Window Below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { silent = true, desc = "Split Window Right" })
-- vim.keymap.set("n", "<leader>-", "<C-W>s", {silent = true, desc = "Split Window Below"})
vim.keymap.set("n", "<leader>|", "<C-W>v", { silent = true, desc = "Split Window Right" })

-- Save file
vim.keymap.set("n", "<C-s>", "<cmd>w<cr><esc>", { silent = true, desc = "Save file" })

-- Quit/Session
vim.keymap.set("n", "<leader>qq", "<cmd>quitall<cr><esc>", { silent = true, desc = "Quit all" })
vim.keymap.set(
	"n",
	"<leader>qs",
	"function() lua require('persistence').load() end",
	{ silent = true, desc = "Restore Session" }
)
vim.keymap.set(
	"n",
	"<leader>ql",
	"function() lua require('persistence').load({ last = true })end",
	{ silent = true, desc = "Restore Last Session" }
)
vim.keymap.set(
	"n",
	"<leader>qd",
	"function() lua require('persistence').stop() end",
	{ silent = true, desc = "Don't save current session" }
)

-- Toggle
vim.keymap.set(
	"n",
	"<leader>ul",
	"function() lua ToggleLineNumber() end",
	{ silent = true, desc = "Toggle Line Numbers" }
)
vim.keymap.set(
	"n",
	"<leader>uL",
	"function() lua ToggleRelativeLineNumber() end",
	{ silent = true, desc = "Toggle Relative Line Numbers" }
)
vim.keymap.set("n", "<leader>uw", "function() lua ToggleWrap() end", { silent = true, desc = "Toggle Line Wrap" })

-- Cool remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move up when line is highlighted" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move down when line is highlighted" })
vim.keymap.set(
	"n",
	"J",
	"mzJ`z",
	{ silent = true, desc = "Allow cursor to stay in the same place after appeding to current line" }
)
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Indent while remaining in visual mode." })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent while remaining in visual mode." })
vim.keymap.set(
	"n",
	"<C-d>",
	"<C-d>zz",
	{ silent = true, desc = "Allow <C-d> and <C-u> to keep the cursor in the middle" }
)
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Allow C-d and C-u to keep the cursor in the middle" })

-- Remap for dealing with word wrap and adding jumps to the jumplist.
vim.keymap.set("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
vim.keymap.set("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true, desc = "Allow search terms to stay in the middle" })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Allow search terms to stay in the middle" })

-- Paste stuff without saving the deleted word into the buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true, desc = "Deletes to void register and paste over" })

-- Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Copy to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { silent = true, desc = "Copy to system clipboard" })

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]], { silent = true, desc = "Delete to void register" })

-- <C-c> instead of pressing esc just because
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "<C-f>", "!tmux new tmux-sessionizer<CR>", { silent = true, desc = "Switch between projects" })

-- Enable notifications for toggle commands
-- local notify = require("notify")
--
-- local function show_notification(message, level)
-- 	notify(message, level, { title = "conform.nvim" })
-- end
--
-- function ToggleLineNumber()
-- 	if vim.wo.number then
-- 		vim.wo.number = false
-- 		show_notification("Line numbers disabled", "info")
-- 	else
-- 		vim.wo.number = true
-- 		vim.wo.relativenumber = false
-- 		show_notification("Line numbers enabled", "info")
-- 	end
-- end
--
-- function ToggleRelativeLineNumber()
-- 	if vim.wo.relativenumber then
-- 		vim.wo.relativenumber = false
-- 		show_notification("Relative line numbers disabled", "info")
-- 	else
-- 		vim.wo.relativenumber = true
-- 		vim.wo.number = false
-- 		show_notification("Relative line numbers enabled", "info")
-- 	end
-- end
--
-- function ToggleWrap()
-- 	if vim.wo.wrap then
-- 		vim.wo.wrap = false
-- 		show_notification("Wrap disabled", "info")
-- 	else
-- 		vim.wo.wrap = true
-- 		vim.wo.number = false
-- 		show_notification("Wrap enabled", "info")
-- 	end
-- end
--
-- if vim.lsp.inlay_hint then
-- 	vim.keymap.set("n", "<leader>uh", function()
-- 		vim.lsp.inlay_hint(0, nil)
-- 	end, { desc = "Toggle Inlay Hints" })
-- end
