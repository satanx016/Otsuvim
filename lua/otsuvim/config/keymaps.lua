local map = vim.keymap.set
local n, i, v, c, t = "n", "i", "v", "c", "t"
local niv = { n, i, v }
local ic = { i, c }
local nt = { n, t }

map(n, "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- lazy
map(n, "<leader>M", "<Cmd>Mason<CR>", { desc = "Mason" }) -- mason

-- essential
map(n, ";", ":", { desc = "CMD enter command mode" })
map(i, "kj", "<ESC>")
map(i, "jk", "<ESC>")
map(v, "K", ":m '<-2<CR>gv=gv")
map(v, "J", ":m '>+1<CR>gv=gv")
-- qol
map(niv, "<C-S-s>", "<cmd>w !sudo tee %<CR>", { desc = "File Sudo Save" }) -- Use this wisely
map(niv, "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map(n, "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy all" })

map(n, "<C-a>", "ggVG", { desc = "File Select all" })

-- fixes
map(i, "<C-Del>", "<Cmd>norm! dw<CR>")
map(i, "<A-Del>", "<Cmd>norm! dw<CR>")
map(ic, "<C-BS>", "<C-w>")
map(ic, "<A-BS>", "<C-w>")
map(c, "<C-S-v>", "<C-r>+") -- add Ctrl+Shift+V paste in command-line mode
-- caret movement
map(ic, "<C-b>", "<ESC>^i", { desc = "Caret Goto beginning of line" })
map(ic, "<C-e>", "<End>", { desc = "Caret Goto end of line" })
map(ic, "<C-h>", "<Left>", { desc = "Caret Goto left" })
map(ic, "<C-l>", "<Right>", { desc = "Caret Goto right" })
map(ic, "<C-j>", "<Down>", { desc = "Caret Goto down" })
map(ic, "<C-k>", "<Up>", { desc = "Caret Goto up" })
-- window management
map(n, "<C-h>", "<C-w>h", { desc = "Window Switch with left" })
map(n, "<C-l>", "<C-w>l", { desc = "Window Switch with right" })
map(n, "<C-j>", "<C-w>j", { desc = "Window Switch with bottom" })
map(n, "<C-k>", "<C-w>k", { desc = "Window Switch with top" })
map(n, "<C-S-h>", "<C-w>H", { desc = "Window Move to the left" })
map(n, "<C-S-l>", "<C-w>L", { desc = "Window Move to the right" })
map(n, "<C-S-j>", "<C-w>J", { desc = "Window Move to the bottom" })
map(n, "<C-S-k>", "<C-w>K", { desc = "Window Move to the top" })
map(nt, "<A-h>", "<Cmd>vert res -1<CR>", { desc = "Window Resize left" })
map(nt, "<A-l>", "<Cmd>vert res +1<CR>", { desc = "Window Resize right" })
map(nt, "<A-j>", "<Cmd>hor res -1<CR>", { desc = "Window Resize down" })
map(nt, "<A-k>", "<Cmd>hor res +1<CR>", { desc = "Window Resize up" })
map(n, "<C-q>", "<C-w>q", { desc = "Window Close" })

-- colorizer
map(n, "<leader>h", "<Cmd>ColorizerToggle<CR>", { desc = "Highlight colors" })

-- nvimtree
map(n, "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle" })
map(n, "<leader>tf", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus" })

-- telescope supermacy
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

map(n, "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "Git Commits" })
map(n, "<leader>fC", "<cmd>Telescope git_bcommits<CR>", { desc = "Git Current buffer commits" })

-- otsutab
map(n, "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New" })

map(n, "<tab>", function()
	require("otsuui.otsutab").next()
end, { desc = "Buffer Goto next" })

map(n, "<S-tab>", function()
	require("otsuui.otsutab").prev()
end, { desc = "Buffer Goto prev" })

map(n, "<leader>bq", function()
	require("otsuui.otsutab").close_buffer()
end, { desc = "Buffer Close" })

map(n, "<leader>bo", function()
	require("otsuui.otsutab").closeOtherBufs()
end, { desc = "Buffer Close Others" })

map(n, "<leader>ba", function()
	vim.cmd("silent only")
	vim.cmd("enew")
	require("otsuui.otsutab").closeOtherBufs()
end, { desc = "Buffer Close All" })

-- neovim-projects
map(n, "<leader>pf", "<cmd>Telescope neovim-project discover<CR>", { desc = "Project List all" })
map(n, "<leader>pr", "<cmd>Telescope neovim-project history<CR>", { desc = "Project List recent" })
map(n, "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", { desc = "Project Load last session" })

-- Gitsigns
map(n, "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git Preview hunk" })
map(n, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Git Stage hunk" })
map(n, "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Git Undo stage hunk" })
map(n, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Git Reset hunk" })
map(n, "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Git Stage buffer" })
map(n, "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Git Reset buffer" })
map(n, "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git Blame line" })
map(n, "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Git Toggle deleted" })
map(n, "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git Toggle line blame" })

-- Neogit & Diffview
map(n, "<leader>gg", "<cmd>Neogit<CR>", { desc = "Git Interface" })
map(n, "<leader>gD", function()
	require("neogit.integrations.diffview").open()
end, { desc = "Git Open Diffview" })

-- clear highlights
map(n, "<ESC>", "<cmd>noh<CR>")

-- comment
map(n, "<leader>/", "gcc", { remap = true, desc = "Comment toggle" })
map(v, "<leader>/", "gc", { remap = true, desc = "Comment toggle" })

-- format
map(n, "<leader>F", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Files" })
