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
map("n", "<leader>Q", "<cmd>qa<cr>", "Quit all")
-- qol or fixes
map(n, "<leader>w", "<cmd>w<CR>", "Save")
map(n, "<leader>W", "<cmd>w !sudo tee %<CR>", "Save sudo") -- Use this wisely
map(i, "<C-Del>", "<Cmd>norm! dw<CR>")
map(i, "<A-Del>", "<Cmd>norm! dw<CR>")
map(ic, "<C-BS>", "<C-w>")
map(ic, "<A-BS>", "<C-w>")
map(c, "<C-S-v>", "<C-r>+") -- add Ctrl+Shift+V paste in command-line mode
-- caret movement
map(ic, "<C-b>", "<ESC>^i", "Caret Goto BOF")
map(ic, "<C-e>", "<End>", "Caret Goto EOF")
map(ic, "<C-h>", "<Left>", "Caret Goto left")
map(ic, "<C-l>", "<Right>", "Caret Goto right")
map(ic, "<C-j>", "<Down>", "Caret Goto down")
map(ic, "<C-k>", "<Up>", "Caret Goto up")
-- window management
map(n, "<C-h>", "<C-w>h", "Window Focus left")
map(n, "<C-l>", "<C-w>l", "Window Focus right")
map(n, "<C-j>", "<C-w>j", "Window Focus bottom")
map(n, "<C-k>", "<C-w>k", "Window Focus top")
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
map(n, "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New" })
map(n, "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close" })
map(n, "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close others" })
-- buffer management
-- stylua: ignore start
map(n, "<leader>bn", "<cmd>enew<CR>", "New")
map(n, "L", function() require("otsu-ui.tufline").next() end, "Buffer Goto next")
map(n, "H", function() require("otsu-ui.tufline").prev() end, "Buffer Goto prev")
map(n, "<leader>bq", function() require("otsu-ui.tufline").close_buffer() end, "Close")
map(n, "<leader>bo", function() require("otsu-ui.tufline").closeOtherBufs() end, "Close others")
map(n, "<leader>ba", "<cmd>enew | lua require('otsu-ui.tufline').closeOtherBufs()<CR>", "Close all")
-- stylua: ignore end

-- ui qol's
map(n, "<ESC>", "<cmd>noh<CR>", "Clear highlights")
map(n, "<leader>ui", vim.show_pos, "Inspect pos")
map(n, "<leader>uI", "<cmd>InspectTree<cr>", "Inspect tree")
Otsuvim.toggle.format():map("<leader>uf")
Otsuvim.toggle.option("relativenumber", { name = "relative number" }):map("<leader>ur")
Otsuvim.toggle.option("spell", { name = "spelling" }):map("<leader>us")
Otsuvim.toggle.option("wrap", { name = "wrap" }):map("<leader>uw")
Otsuvim.toggle.inlay_hints():map("<leader>uH")
Otsuvim.toggle.transparency():map("<leader>ut")

-- comment
map(n, "<leader>/", "<cmd>normal gcc<CR>", "Comment toggle")
map(v, "<leader>/", "<cmd>normal gc<CR>", "Comment toggle")

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
