-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Left Column and similar settings
vim.opt.number = true -- display line numbers
vim.opt.relativenumber = true -- display relative line numbers
vim.opt.numberwidth = 2 -- set the width of the line number column
vim.opt.wrap = true -- sets word wrap
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.scrolloff = 10 -- number of lines to key above/below the cursor
vim.opt.sidescrolloff = 8 -- number of columns to keep to the left/right of the cursor

-- Tab spacing/behavior
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- number of spaces to use for auto-indent
vim.opt.tabstop = 4 -- number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- number of spaces that a <Tab> key in the file counts for
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.smartindent = true -- smarter indenting behavior

-- General settings
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- disable netrw

vim.opt.backup = false -- disable backup files
vim.opt.clipboard = "unnamedplus" -- use system clipboard, doesnt work right on WSL
vim.opt.conceallevel = 0 -- show concealable characters
vim.opt.fileencoding = "utf-8" -- set file encoding
vim.opt.mouse = "a" -- enable mouse support
vim.opt.showmode = false -- don't show mode
vim.opt.splitbelow = true -- force horizontal splits to be below
vim.opt.splitright = true -- force vertical splits to be to the right
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.timeoutlen = 1000 -- set timeout length for mapped sequences
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- set faster completion
vim.opt.writebackup = false -- disable backup files
vim.opt.cursorline = true

-- Search settings
vim.opt.hlsearch = true -- highlight search results
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- override ignorecase if search contains uppercase
