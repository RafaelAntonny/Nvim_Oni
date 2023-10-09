-- nvim/lua/onivim/config.lua

-- run at the mill keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true})

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

vim.o.mouse = 'a'
