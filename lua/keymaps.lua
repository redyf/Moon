-- TODO: Move general mappings to which-key

local map = vim.keymap.set

-- Disable arrow keys
map({ "n", "i" }, "<Up>", "<Nop>", { silent = true, desc = "Disable Up arrow key" })
map({ "n", "i" }, "<Down>", "<Nop>", { silent = true, desc = "Disable Down arrow key" })
map({ "n", "i" }, "<Right>", "<Nop>", { silent = true, desc = "Disable Right arrow key" })
map({ "n", "i" }, "<Left>", "<Nop>", { silent = true, desc = "Disable Left arrow key" })

-- General maps
map("n", "<leader>f", "+find/file")
map("n", "<leader>b", "+buffer")
map("n", "<leader>s", "+search")
map("n", "<leader>q", "+quit/session")
map({ "n", "v" }, "<leader>g", "+git")
map("n", "<leader>u", "+ui")
map("n", "<leader>w", "+windows")
map("n", "<leader><tab>", "+tab")
map({ "n", "v" }, "<leader>d", "+debug")
map({ "n", "v" }, "<leader>c", "+code")
map({ "n", "v" }, "<leader>t", "+test")

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { silent = true, desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { silent = true, desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { silent = true, desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { silent = true, desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { silent = true, desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { silent = true, desc = "Previous Tab" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { silent = true, desc = "Other Window" })
map("n", "<leader>wd", "<C-W>c", { silent = true, desc = "Delete Window" })
map("n", "<leader>w-", "<C-W>s", { silent = true, desc = "Split Window Below" })
map("n", "<leader>w|", "<C-W>v", { silent = true, desc = "Split Window Right" })
-- map("n", "<leader>-", "<C-W>s", {silent = true, desc = "Split Window Below"})
map("n", "<leader>|", "<C-W>v", { silent = true, desc = "Split Window Right" })

-- Save file
map("n", "<C-s>", "<cmd>w<cr><esc>", { silent = true, desc = "Save file" })

-- Quit/Session
map("n", "<leader>qq", "<cmd>quitall<cr><esc>", { silent = true, desc = "Quit all" })
map("n", "<leader>qs", "function() lua require('persistence').load() end", { silent = true, desc = "Restore Session" })
map(
	"n",
	"<leader>ql",
	"function() lua require('persistence').load({ last = true })end",
	{ silent = true, desc = "Restore Last Session" }
)
map(
	"n",
	"<leader>qd",
	"function() lua require('persistence').stop() end",
	{ silent = true, desc = "Don't save current session" }
)

-- Toggle
map("n", "<leader>ul", function()
	ToggleLineNumber()
end, { silent = true, desc = "Toggle Line Numbers" })
map("n", "<leader>uL", function()
	ToggleRelativeLineNumber()
end, { silent = true, desc = "Toggle Relative Line Numbers" })
map("n", "<leader>uw", function()
	ToggleWrap()
end, { silent = true, desc = "Toggle Line Wrap" })

-- Enable inlay hints if available
if vim.lsp.inlay_hint then
	map("n", "<leader>uh", function()
		ToggleInlayHints()
	end, { desc = "Toggle Inlay Hints" })
end

-- Cool remaps
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move up when line is highlighted" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move down when line is highlighted" })
map(
	"n",
	"J",
	"mzJ`z",
	{ silent = true, desc = "Allow cursor to stay in the same place after appeding to current line" }
)
map("v", "<", "<gv", { silent = true, desc = "Indent while remaining in visual mode." })
map("v", ">", ">gv", { silent = true, desc = "Indent while remaining in visual mode." })
map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Allow <C-d> and <C-u> to keep the cursor in the middle" })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Allow C-d and C-u to keep the cursor in the middle" })

-- Remap for dealing with word wrap and adding jumps to the jumplist.
map("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { silent = true, expr = true })
map("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { silent = true, expr = true })
map("n", "n", "nzzzv", { silent = true, desc = "Allow search terms to stay in the middle" })
map("n", "N", "Nzzzv", { silent = true, desc = "Allow search terms to stay in the middle" })

-- Paste stuff without saving the deleted word into the buffer
map("x", "<leader>p", [["_dP]], { silent = true, desc = "Deletes to void register and paste over" })

-- Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
map({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Copy to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { silent = true, desc = "Copy to system clipboard" })

-- Delete to void register
map({ "n", "v" }, "<leader>D", [["_d]], { silent = true, desc = "Delete to void register" })

-- <C-c> instead of pressing esc just because
map("i", "<C-c>", "<Esc>", { silent = true, desc = "Exit insert mode" })
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer-script<CR>", { desc = "Switch between projects" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
