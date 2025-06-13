-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Remove Search Highlights"})

-- Exit Vim's Terminal Mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit Terminal Mode"})

-- Better window Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "Move focus to the upper window"})

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "[W]indow Split [V]ertical"})
vim.keymap.set("n", "<leader>wh", ":split<cr>", {desc = "[W]indow Split [H]orizontal"})

-- Visual Mode Indenting
vim.keymap.set("v", "<", "<gv", {desc = "Indent Left in visual mode"})
vim.keymap.set("v", ">", ">gv", {desc = "Indent Right in visual mode"})

-- Open Mason Config
vim.keymap.set("n", "<leader>cm", ":Mason<cr>", {desc = "Open Mason"})

-- Vim motions changes
vim.keymap.set("n", "J", "10j", {desc="Move Down 10 lines with J"})
vim.keymap.set("n", "K", "10k", {desc="Move up 10 lines with J"})

-- Quick ESC
-- vim.keymap.set("i", "jk", "<Esc>", {desc = "Quick ESC"})
-- vim.keymap.set("i", "kj", "<Esc>", {desc = "Quick ESC"})
-- vim.keymap.set("i", "jj", "<Esc>", {desc = "Quick ESC"})

