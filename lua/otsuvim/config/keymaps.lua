local map = function(mode, lhs, rhs, desc, opts)
  vim.keymap.set(mode, lhs, rhs, type(desc) == "string" and vim.tbl_extend("keep", { desc = desc }, opts or {}) or desc)
end
local n, i, v, c, t = "n", "i", "v", "c", "t"
local ic, nt, nv = { i, c }, { n, t }, { n, v }

-- lazy
map(n, "<leader>l", "<Cmd>Lazy<CR>", "Lazy")

-- essentials
map(n, ";", ":", "CMD enter command mode")
map(i, "kj", "<ESC>")
map(i, "jk", "<ESC>")
map(v, "K", ":m '<-2<CR>gv=gv", { silent = true })
map(v, "J", ":m '>+1<CR>gv=gv", { silent = true })
-- quit
map("n", "<leader>Q", "<cmd>qa<cr>", "Quit All")
-- qol or fixes
map(n, "<leader>w", "<cmd>w<CR>", "Save")
map(n, "<leader>W", "<cmd>w !sudo tee %<CR>", "Sudo Save") -- Use this wisely
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
map(n, "<C-h>", "<C-w>h", "Window Swap left")
map(n, "<C-l>", "<C-w>l", "Window Swap right")
map(n, "<C-j>", "<C-w>j", "Window Swap bottom")
map(n, "<C-k>", "<C-w>k", "Window Swap top")
map(n, "<C-S-h>", "<C-w>H", "Window Move left")
map(n, "<C-S-l>", "<C-w>L", "Window Move right")
map(n, "<C-S-j>", "<C-w>J", "Window Move bottom")
map(n, "<C-S-k>", "<C-w>K", "Window Move top")
map(n, "<A-h>", "<Cmd>vert res -1<CR>", "Window Resize left")
map(n, "<A-l>", "<Cmd>vert res +1<CR>", "Window Resize right")
map(n, "<A-j>", "<Cmd>hor res -1<CR>", "Window Resize down")
map(n, "<A-k>", "<Cmd>hor res +1<CR>", "Window Resize up")
map(n, "<C-q>", "<C-w>q", "Window Close")
-- tab management
map(n, "<C-t>", "<cmd>tabnew<cr>", "Tab new")
-- buffer management
-- stylua: ignore start
map(n, "<leader>bn", "<cmd>enew<CR>", "Buffer New")
map(n, "L", function() require("otsu-ui.tufline").next() end, "Buffer Goto next")
map(n, "H", function() require("otsu-ui.tufline").prev() end, "Buffer Goto prev")
map(n, "<leader>bq", function() require("otsu-ui.tufline").close_buffer() end, "Buffer Close")
map(n, "<leader>bo", function() require("otsu-ui.tufline").closeOtherBufs() end, "Buffer Close Others")
map(n, "<leader>ba", "<cmd>lua require('otsu-ui.dash').open();require('otsu-ui.tufline').closeOtherBufs()<CR>", "Buffer Close All")
-- stylua: ignore end

-- ui qol's
map(n, "<ESC>", "<cmd>noh<CR>", "Clear Highlights")
map(n, "<leader>ui", vim.show_pos, "Inspect Pos")
map(n, "<leader>uI", "<cmd>InspectTree<cr>")
Otsuvim.toggle.format():map("<leader>uf")
Otsuvim.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ur")
Otsuvim.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Otsuvim.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Otsuvim.toggle.inlay_hints():map("<leader>uH")
Otsuvim.toggle.transparency():map("<leader>ut")

-- comment
map(n, "<leader>/", "<cmd>normal gcc<CR>", "Comment Toggle")
map(v, "<leader>/", "<cmd>normal gc<CR>", "Comment Toggle")

-- terminals
-- stylua: ignore start
map(nt, "<A-t>", function() require("otsu-ui.terminal").toggle({ type = "float" }) end, "Terminal Toggle float")
map(nt, "<A-s>", function() require("otsu-ui.terminal").toggle({ type = "hsplit" }) end, "Terminal Toggle hsplit")
map(nt, "<A-v>", function() require("otsu-ui.terminal").toggle({ type = "vsplit" }) end, "Terminal Toggle vsplit")
-- stylua: ignore end

-- git
-- stylua: ignore start
map(nv, "<leader>gB", function() Otsuvim.git.git_browse({ open = true }) end, "Git-Browse (open)")
map(nv, "<leader>gY", function() Otsuvim.git.git_browse({ open = false }) end, "Git-Browse (copy)")
-- stylua: ignore end
