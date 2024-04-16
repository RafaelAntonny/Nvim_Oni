-- nvim/lua/onivim/config.lua

-- run at the mill keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- SPACE + e + f to toggle nvim tree (open/close)
vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
-- SPACE + e to focus nvim-tree, if nvim-tree is not open the it will open it
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<cr>", { silent = true, noremap = true })

-- move between buffers (bufferline specific)
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<cr>", { silent = true, noremap = true })

-- closes current buffer with space + x
vim.keymap.set("n", "<leader>x", ":BufDel<cr>", {silent = true, noremap = true})

-- clipboard
vim.o.clipboard = "unnamedplus"

vim.o.number = true
-- vim.o.relativenumber = true for relative numbers

-- indentation 4 spaces 
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- no less than 10 lines on screen
vim.o.scrolloff = 10

-- compatiblity/good colors
vim.o.termguicolors = true

vim.o.mousemoveevent = true

vim.o.mouse = 'a'

-- makes things show in one long line instead of wrapping (super annoying btw)
vim.o.wrap = false
