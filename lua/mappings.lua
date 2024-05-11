local map = vim.keymap.set
local n, i, v, c, t = "n", "i", "v", "c", "t"
local niv = { n, i, v }
local ic = { i, c }
local nt = { n, t }

map(n, ";", ":", { desc = "CMD enter command mode" })
map(i, "kj", "<ESC>")
map(i, "jk", "<ESC>")

-- input mode caret movement
map(ic, "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map(ic, "<C-e>", "<End>", { desc = "Move End of line" })
map(ic, "<C-h>", "<Left>", { desc = "Move Left" })
map(ic, "<C-l>", "<Right>", { desc = "Move Right" })
map(ic, "<C-j>", "<Down>", { desc = "Move Down" })
map(ic, "<C-k>", "<Up>", { desc = "Move Up" })

-- window management
map(n, "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map(n, "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map(n, "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map(n, "<C-k>", "<C-w>k", { desc = "Switch Window up" })
map(n, "<C-S-h>", "<C-w>H", { desc = "Move Window left" })
map(n, "<C-S-l>", "<C-w>L", { desc = "Move Window left" })
map(n, "<C-S-j>", "<C-w>J", { desc = "Move Window right" })
map(n, "<C-S-k>", "<C-w>K", { desc = "Move Window down" })
map(nt, "<A-h>", "<Cmd>vert res -1<CR>", { desc = "Resize Window up" })
map(nt, "<A-l>", "<Cmd>vert res +1<CR>", { desc = "Resize Window right" })
map(nt, "<A-j>", "<Cmd>hor res -1<CR>", { desc = "Resize Window down" })
map(nt, "<A-k>", "<Cmd>hor res +1<CR>", { desc = "Resize Window up" })

map(niv, "<C-q>", "<C-w>q", { desc = "Window Close" })

-- editor qol
map(c, "<C-S-v>", "<C-r>+") -- add paste in command mode

map(n, "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map(n, "<C-S-s>", "<cmd>w !sudo tee %<CR>", { desc = "File Sudo Save" }) -- Use this wisely
map(n, "<C-a>", "ggVG", { desc = "File Select all" })
map(n, "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy all" })

map(ic, "<A-BS>", "<C-w>")
map(i, "<A-Del>", "<Cmd>norm! dw<CR>")

map(ic, "<C-BS>", "<C-w>")
map(i, "<C-Del>", "<Cmd>norm! dw<CR>")

map(v, "K", ":m '<-2<CR>gv=gv")
map(v, "J", ":m '>+1<CR>gv=gv")

map(n, "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle NvCheatsheet" })

-- git integration
map(n, "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map(n, "<leader>gc", "<cmd>Telescope git_bcommits<CR>", { desc = "Telescope Git current buffer commits" })
map(n, "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })

-- sessions/projects
map(n, "<leader>pf", "<cmd>Telescope neovim-project discover<CR>", { desc = "Project List all" })
map(n, "<leader>pr", "<cmd>Telescope neovim-project history<CR>", { desc = "Project List recent" })
map(n, "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", { desc = "Project Load last session" })

-- format
map(n, "<leader>F", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format Files" })

-- global lsp mappings
map(n, "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map(n, "[d", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map(n, "]d", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map(n, "<leader>q", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

-- tabufline
map(n, "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New" })

map(n, "<tab>", function()
	require("otsu.tabufline").next()
end, { desc = "Buffer Goto next" })

map(n, "<S-tab>", function()
	require("otsu.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map(n, "<leader>bq", function()
	require("otsu.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map(n, "<leader>boq", function()
	require("otsu.tabufline").closeOtherBufs()
end, { desc = "Buffer Close Others" })

map(n, "<leader>baq", function()
    vim.cmd("Nvdash")
	require("otsu.tabufline").closeOtherBufs()
end, { desc = "Buffer Close All" })

-- Comment
map(n, "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Comment toggle" })

map(
	v,
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Comment toggle" }
)

-- nvimtree
map(n, "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle" })
map(n, "<leader>tf", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus" })

-- fuzzy finders
map(
	n,
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope Find all files" }
)
map(n, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map(n, "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map(n, "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map(n, "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map(n, "<leader>fo", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })

map(n, "<leader>fb", "<cmd>Telescope builtin<CR>", { desc = "Telescope List commands" })
map(n, "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })

map(n, "<leader>n", "<cmd>Telescope notify<CR>", { desc = "Notifications Show recent" })
map(n, "<leader>ot", "<cmd>Telescope themes<CR>", { desc = "Otsu Select theme" })

-- terminal
map(n, "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "Terminal Pick hidden term" })

map(t, "<ESC>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

map(n, "<ESC>", function()
	local win = vim.api.nvim_get_current_win()
	local bufr = vim.api.nvim_win_get_buf(win)

	if vim.api.nvim_buf_get_option(bufr, "buftype") == "terminal" then
		vim.api.nvim_win_close(win, true)
	else
		vim.cmd("noh")
		require("notify").dismiss()
	end
end, { desc = "Terminal Close term" })

-- toggleable terminals
map(nt, "<A-v>", function()
	require("otsu.term").toggle({ pos = "vsp", id = "vtoggleTerm", size = 0.3 })
end, { desc = "Terminal Toggleable vertical term" })

map(nt, "<A-s>", function()
	require("otsu.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
end, { desc = "Terminal Toggleable horizontal term" })

map(nt, "<A-t>", function()
	require("otsu.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle floating term" })

-- whichkey
map(n, "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey Query lookup" })

-- Colorizer
map(n, "<leader>h", "<Cmd>ColorizerToggle<CR>", { desc = "Highlight colors" })

-- Lazy
map(n, "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy" })
