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


local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
