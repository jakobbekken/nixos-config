local g = vim.g
local km = vim.keymap

g.mapleader = " "
g.maplocalleader = ","

--
-- Search
--

-- Replace all matching hovered word
km.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { noremap = true, silent = false })

-- Clear search highlight
km.set("n", "<leader>h", ":noh<CR>")

--
-- Selection
--

-- Select entire text
km.set("n", "<leader>aa", "ggVG")

-- Move up or down
km.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
km.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
