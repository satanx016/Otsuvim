local map = vim.keymap.set

-- lazy
map("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" })

-- Remap for dealing with word wrap and adding jumps to the jumplist.
map("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
map("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- qol or fixes
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

map("n", "<A-h>", "<Cmd>vert res +1<CR>", { desc = "Window Resize left" })
map("n", "<A-l>", "<Cmd>vert res -1<CR>", { desc = "Window Resize right" })
map("n", "<A-j>", "<Cmd>hor res -1<CR>", { desc = "Window Resize down" })
map("n", "<A-k>", "<Cmd>hor res +1<CR>", { desc = "Window Resize up" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

Util.toggle({ name = "wrap" }):map("<leader>tw")

-- buffer management
map("n", "<leader>bq", "<cmd>bd<CR>", { desc = "Close" })
map("n", "<leader>ba", "<cmd>%bd!<CR>", { desc = "Close all" })
-- tab management
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close others" })
