local map = vim.keymap.set
local n, i, v, c, t = "n", "i", "v", "c", "t"
local ic = { i, c }
local nt = { n, t }
local nv = { n, v }

map(n, "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- lazy
map(n, "<leader>M", "<Cmd>Mason<CR>", { desc = "Mason" }) -- mason

-- essentials
map(n, ";", ":", { desc = "CMD enter command mode" })
map(i, "kj", "<ESC>")
map(i, "jk", "<ESC>")
map(v, "K", ":m '<-2<CR>gv=gv")
map(v, "J", ":m '>+1<CR>gv=gv")
-- quit
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" })
-- qol or fixes
map(n, "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map(n, "<leader>W", "<cmd>w !sudo tee %<CR>", { desc = "Sudo Save" }) -- Use this wisely
map(n, "<C-a>", "ggVG", { desc = "Select all" })
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
map(n, "<leader>h", "<Cmd>ColorizerToggle<CR>", { desc = "Highlight Colors" })

-- nvimtree
map(n, "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer Toggle" })
map(n, "<leader>E", "<cmd>NvimTreeFocus<CR>", { desc = "Explorer Focus" })

-- telescope supermacy
-- stylua: ignore
map(n, "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Find all Files" })
map(n, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map(n, "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find Oldfiles" })
map(n, "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current Buffer" })
map(n, "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map(n, "<leader>fo", "<cmd>Telescope buffers<CR>", { desc = "Find openned Buffers" })
map(n, "<leader>fb", "<cmd>Telescope builtin<CR>", { desc = "List Commands" })
map(n, "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Page" })
map(n, "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "Git List Commits" })
map(n, "<leader>fC", "<cmd>Telescope git_bcommits<CR>", { desc = "Git List buf Commits" })

-- otsutab
-- stylua: ignore start
map(n, "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New" })
map(n, "<tab>", function() require("otsuui.otsutab").next() end, { desc = "Buffer Goto next" })
map(n, "<S-tab>", function() require("otsuui.otsutab").prev() end, { desc = "Buffer Goto prev" })
map(n, "<leader>bq", function() require("otsuui.otsutab").close_buffer() end, { desc = "Buffer Close" })
map(n, "<leader>bo", function() require("otsuui.otsutab").closeOtherBufs() end, { desc = "Buffer Close Others" })
map(n, "<leader>ba", "<cmd>silent only | enew | lua require('otsuui.otsutab').closeOtherBufs()<CR>", { desc = "Buffer Close All" })
-- stylua: ignore end

-- neovim-projects
map(n, "<leader>pf", "<cmd>Telescope neovim-project discover<CR>", { desc = "List All" })
map(n, "<leader>pr", "<cmd>Telescope neovim-project history<CR>", { desc = "List Recent" })
map(n, "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", { desc = "Load Last Session" })

-- Gitsigns & Neogit & Diffview
-- stylua: ignore start
map(n, "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit Interface" })
map(n, "[H", "<cmd>Gitsigns nav_hunk first<CR>", { desc = "First Hunk" })
map(n, "]H", "<cmd>Gitsigns nav_hunk last<CR>", { desc = "Last Hunk" })
map(n, "[h", "<cmd>Gitsigns nav_hunk prev<CR>", { desc = "Prev Hunk" })
map(n, "]h", "<cmd>Gitsigns nav_hunk next<CR>", { desc = "Next Hunk" })
map(n, "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
map(nv, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map(nv, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map(n, "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
map(n, "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
map(n, "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
map(n, "<leader>ghb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame" })
map(n, "<leader>ghB", function () require("gitsigns").blame_line({ full=true })end, { desc = "Full Blame" })
map(n, "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
map(n, "<leader>gD", function() require("neogit.integrations.diffview").open() end, { desc = "Diffview" })
-- stylua: ignore end

-- clear highlights
map(n, "<ESC>", "<cmd>noh<CR>", { desc = "Clear Highlights" })

-- comment
map(n, "<leader>/", "gcc", { remap = true, desc = "Comment Toggle" })
map(v, "<leader>/", "gc", { remap = true, desc = "Comment Toggle" })

-- format
-- stylua: ignore
map(n, "<leader>F", function() require("conform").format({ async = true, lsp_fallback = true }) end, { desc = "Format Files" })
