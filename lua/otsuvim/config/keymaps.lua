local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end
local n, i, v, c, t = "n", "i", "v", "c", "t"
local ic = { i, c }
local nt = { n, t }
local nv = { n, v }

map(n, "<leader>L", "<Cmd>Lazy<CR>", "Lazy") -- lazy

-- essentials
map(n, ";", ":", "CMD enter command mode")
map(i, "kj", "<ESC>")
map(i, "jk", "<ESC>")
map(v, "K", ":m '<-2<CR>gv=gv")
map(v, "J", ":m '>+1<CR>gv=gv")
-- quit
map("n", "<leader>Q", "<cmd>qa<cr>", "Quit All")
-- qol or fixes
map(n, "<leader>w", "<cmd>w<CR>", "Save")
map(n, "<leader>W", "<cmd>w !sudo tee %<CR>", "Sudo Save") -- Use this wisely
map(n, "<C-a>", "ggVG", "Select all")
map(i, "<C-Del>", "<Cmd>norm! dw<CR>")
map(i, "<A-Del>", "<Cmd>norm! dw<CR>")
map(ic, "<C-BS>", "<C-w>")
map(ic, "<A-BS>", "<C-w>")
map(c, "<C-S-v>", "<C-r>+") -- add Ctrl+Shift+V paste in command-line mode
-- caret movement
map(ic, "<C-b>", "<ESC>^i", "Caret Goto beginning of line")
map(ic, "<C-e>", "<End>", "Caret Goto end of line")
map(ic, "<C-h>", "<Left>", "Caret Goto left")
map(ic, "<C-l>", "<Right>", "Caret Goto right")
map(ic, "<C-j>", "<Down>", "Caret Goto down")
map(ic, "<C-k>", "<Up>", "Caret Goto up")
-- window management
map(n, "<C-h>", "<C-w>h", "Window Switch with left")
map(n, "<C-l>", "<C-w>l", "Window Switch with right")
map(n, "<C-j>", "<C-w>j", "Window Switch with bottom")
map(n, "<C-k>", "<C-w>k", "Window Switch with top")
map(n, "<C-S-h>", "<C-w>H", "Window Move to the left")
map(n, "<C-S-l>", "<C-w>L", "Window Move to the right")
map(n, "<C-S-j>", "<C-w>J", "Window Move to the bottom")
map(n, "<C-S-k>", "<C-w>K", "Window Move to the top")
map(nt, "<A-h>", "<Cmd>vert res -1<CR>", "Window Resize left")
map(nt, "<A-l>", "<Cmd>vert res +1<CR>", "Window Resize right")
map(nt, "<A-j>", "<Cmd>hor res -1<CR>", "Window Resize down")
map(nt, "<A-k>", "<Cmd>hor res +1<CR>", "Window Resize up")
map(n, "<C-q>", "<C-w>q", "Window Close")

-- colorizer
map(n, "<leader>h", "<Cmd>ColorizerToggle<CR>", "Highlight Colors")

-- nvimtree
map(n, "<leader>e", "<cmd>NvimTreeToggle<CR>", "Explorer NvimTree")

-- telescope supermacy
-- stylua: ignore
map(n, "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find all Files")
map(n, "<leader>fb", "<cmd>Telescope buffers<CR>", "Buffers")
map(n, "<leader>ff", "<cmd>Telescope find_files<cr>", "Files")
map(n, "<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent Files")

map(n, '<leader>s"', "<cmd>Telescope registers<cr>", "Registers")
map(n, "<leader>sa", "<cmd>Telescope autocommands<cr>", "Auto Commands")
map(n, "<leader>sb", "<cmd>Telescope builtin<CR>", "Pickers")
map(n, "<leader>sc", "<cmd>Telescope commands<cr>", "Commands")
map(n, "<leader>sd", "<cmd>Telescope diagnostics_document<cr>", "Diagnostics")
map(n, "<leader>sh", "<cmd>Telescope help_tags<CR>", "Help Page")
map(n, "<leader>sg", "<cmd>Telescope live_grep<CR>", "Grep")
map(n, "<leader>sk", "<cmd>Telescope keymaps<CR>", "Keymaps")
map(n, "<leader>sw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Word")

map(n, "<leader>gfc", "<cmd>Telescope git_commits<CR>", "Commits")
map(n, "<leader>gfC", "<cmd>Telescope git_bcommits<CR>", "Commits (%)")
map(n, "<leader>gff", "<cmd>Telescope git_files<CR>", "Files (git-files)")
map(n, "<leader>gfs", "<cmd>Telescope git_stash<CR>", "Stash")
map(n, "<leader>gfb", "<cmd>Telescope git_branches<CR>", "Branches")
map(n, "<leader>gs", "<cmd>Telescope git_status<CR>", "Status")

-- otsutab
-- stylua: ignore start
map(n, "<leader>bn", "<cmd>enew<CR>", "Buffer New")
map(n, "<tab>", function() require("otsu-ui.otsutab").next() end, "Buffer Goto next")
map(n, "<S-tab>", function() require("otsu-ui.otsutab").prev() end, "Buffer Goto prev")
map(n, "<leader>bq", function() require("otsu-ui.otsutab").close_buffer() end, "Buffer Close")
map(n, "<leader>bo", function() require("otsu-ui.otsutab").closeOtherBufs() end, "Buffer Close Others")
map(n, "<leader>ba", "<cmd>silent only | enew | lua require('otsu-ui.otsutab').closeOtherBufs()<CR>", "Buffer Close All")
-- stylua: ignore end

-- neovim-projects
map(n, "<leader>pf", "<cmd>NeovimProjectDiscover<CR>", "List All")
map(n, "<leader>pr", "<cmd>NeovimProjectHistory<CR>", "List Recent")
map(n, "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", "Restore Last Project")

-- Neogit & Diffview
map(n, "<leader>gg", "<cmd>Neogit<CR>", "Neogit Interface")
-- stylua: ignore
map(n, "<leader>gD", function() require("neogit.integrations.diffview").open() end, "Diffview")

-- ui qol's
map(n, "<ESC>", "<cmd>noh<CR>", "Clear Highlights")
map(n, "<leader>ui", vim.show_pos, "Inspect Pos")
map(n, "<leader>uI", "<cmd>InspectTree<cr>")
Otsuvim.toggle.map("<leader>uf", Otsuvim.toggle.format())
Otsuvim.toggle.map("<leader>ur", Otsuvim.toggle("relativenumber", { name = "Relative Number" }))
Otsuvim.toggle.map("<leader>us", Otsuvim.toggle("spell", { name = "Spelling" }))
Otsuvim.toggle.map("<leader>uw", Otsuvim.toggle("wrap", { name = "Wrap" }))
Otsuvim.toggle.map("<leader>uh", Otsuvim.toggle.inlay_hints())
Otsuvim.toggle.map("<leader>ut", Otsuvim.toggle.transparency())

-- comment
map(n, "<leader>/", "<cmd>normal gcc<CR>", "Comment Toggle")
map(v, "<leader>/", "<cmd>normal gc<CR>", "Comment Toggle")

-- format
-- stylua: ignore
map(n, "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, "Format")
