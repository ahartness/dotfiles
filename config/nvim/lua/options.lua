-- HINT: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} -- configure completion options
vim.opt.mouse = 'a' -- enable mouse support

-- Tab
vim.opt.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2 -- number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- convert tabs to spaces

-- UI Config
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.splitbelow = true -- force new horizontal splits to be below the current window
vim.opt.splitright = true -- force new vertical splits to be to the right of the current window
vim.opt.termguicolors = true -- enable true color support

-- Searching
vim.opt.incsearch = true -- enable incremental search
vim.opt.hlsearch = false -- do not highlight search results
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- override ignorecase if search pattern contains uppercase letters
