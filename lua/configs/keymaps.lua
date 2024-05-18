local keymap = vim.keymap.set
local n, i, v, c = "n", "i", "v", "c"
local niv = { n, i, v }
local nv = { n, v }

local opts = { noremap = true, silent = true }

-- Editor
keymap(niv, "<C-s>", "<Cmd>w<CR>") -- Save
keymap(niv, "<C-q>", "<Cmd>q<CR>") -- Quit Window

keymap(niv, "<CS-s>", "<Cmd>wa<CR>") -- Save all
keymap(niv, "<C-a>", "<ESC>ggVG") -- select all

keymap(n, "<Esc>", "<Cmd>noh | lua require('notify').dismiss()<CR>") -- remove selection highlights

keymap(i, "<C-BS>", "<C-w>") -- Ctrl Backspace to delete backward
keymap(i, "<C-Del>", "<Cmd>norm! dw<CR>") -- Ctrl Del to delete forward
keymap(c, "<C-BS>", "<C-w>") -- Alt Backspace to delete backward

-- Move up and down selection
keymap(v, "K", ":m '<-2<CR>gv=gv")
keymap(v, "J", ":m '>+1<CR>gv=gv")

-- Lazy
keymap(nv, "<leader>l", "<Cmd>Lazy<CR>", opts)

-- Project
keymap(nv, "<leader>fp", "<Cmd>Telescope workspaces<CR>", opts)

-- Windows
-- focus
keymap(n, "<C-h>", "<C-w>h", opts)
keymap(n, "<C-l>", "<C-w>l", opts)
keymap(n, "<C-j>", "<C-w>j", opts)
keymap(n, "<C-k>", "<C-w>k", opts)
-- resize
keymap(n, "<A-h>", "<Cmd>vert res -1<CR>", opts)
keymap(n, "<A-l>", "<Cmd>vert res +1<CR>", opts)
keymap(n, "<A-j>", "<Cmd>hor res -1<CR>", opts)
keymap(n, "<A-k>", "<Cmd>hor res +1<CR>", opts)
-- fast resizing
keymap(n, "<A-S-h>", "<Cmd>vert res -5<CR>", opts)
keymap(n, "<A-S-l>", "<Cmd>vert res +5<CR>", opts)
keymap(n, "<A-S-j>", "<Cmd>hor res -5<CR>", opts)
keymap(n, "<A-S-k>", "<Cmd>hor res +5<CR>", opts)
-- move
keymap(n, "<C-S-h>", "<C-w>H", opts)
keymap(n, "<C-S-l>", "<C-w>L", opts)
keymap(n, "<C-S-j>", "<C-w>J", opts)
keymap(n, "<C-S-k>", "<C-w>K", opts)

-- Tabs
keymap(nv, "<leader>tn", "<Cmd>tabe<CR>", opts)
keymap(nv, "<leader>tq", "<Cmd>tabc<CR>", opts)
keymap(niv, "<C-1>", "<Cmd>tabn 1<CR>", opts)
keymap(niv, "<C-2>", "<Cmd>tabn 2<CR>", opts)
keymap(niv, "<C-3>", "<Cmd>tabn 3<CR>", opts)
keymap(niv, "<C-4>", "<Cmd>tabn 4<CR>", opts)

-- Buffers
keymap(niv, "<C-tab>", "<Cmd>bnext<CR>", opts)
keymap(niv, "<CS-tab>", "<Cmd>bprev<CR>", opts)
keymap(nv, "<leader>bp", "<Cmd>BufferLinePick<CR>", opts)
keymap(nv, "<leader>bq", "<Cmd>bd<CR>", opts)
keymap(nv, "<leader>baq", "<Cmd>tabdo %bd | Alpha | -1bd<CR>", opts)
keymap(nv, "<leader>boq", "<Cmd>BufferLineCloseOthers<CR>", opts)
keymap(nv, "<leader>bpq", "<Cmd>BufferLinePickClose<CR>", opts)
keymap(nv, "<leader>bst", "<Cmd>BufferLineSortByTabs<CR>", opts)

-- Telescope
keymap(nv, "<leader>ff", "<Cmd>Telescope find_files<CR>", opts)
keymap(nv, "<leader>fr", "<Cmd>Telescope oldfiles<CR>", opts)
keymap(nv, "<leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
keymap(nv, "<leader>fo", "<Cmd>Telescope buffers<CR>", opts)

-- Nvim Nree
keymap(n, "<leader>ft", "<Cmd>NvimTreeToggle<CR>", opts)

-- Colorizer
keymap(nv, "<leader>h", "<Cmd>ColorizerToggle<CR>", opts)

-- Session
--keymap(n, '<leader>ml', '<Cmd>lua require("persistence").load({ last = true })<CR>', opts)
--keymap(n, '<leader>ms', '<Cmd>lua require("persistence").load()<CR>', opts)

-- Search & Replace need to get a better soluce
--keymap(n, "<leader>sr", function()
--    local search = vim.fn.input('search for: ')
--    local replace = vim.fn.input('repalce by: ')
--    if search ~= '' and replace ~= '' then
--        local success, error_message= pcall(vim.api.nvim_command, '%s/' .. search .. '/' .. replace .. '/g')
--        if not success then
--            vim.api.nvim_command('echohl ErrorMsg')
--            vim.api.nvim_command('echom "Dayum ... welp there is no pattern valable for that one :/"')
--            vim.api.nvim_command('echohl None')
--        end
--    end
--endr
