-- Set leader to space
vim.g.mapleader = " "

-- =============================
-- ======= LEADER BINDS ========
-- =============================

-- [W]rite current file
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- Save without formatting (assuming no auto-format on save is set, or using a flag)
vim.keymap.set('n', '<leader>d', ':noautocmd w<CR>', { desc = 'Save without formatting' })

-- [G][G]it (Requires 'tpope/vim-fugitive' or 'Neogit')
vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'Open Git' })

-- [Q]uit
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close current buffer' })

-- [C][A]ode Action (Built-in LSP)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })

-- [R][E]name (Built-in LSP)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- [F][S]ymbol (Requires 'Telescope' or 'fzf-lua')
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = 'Find Symbols' })

-- [F][F]ind File (Requires 'Telescope')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find Files' })

-- [F][G]rep (Requires 'Telescope')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live Grep' })

-- [/] Visual Fuzzy Search (Fuzzy search in current buffer)
vim.keymap.set('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Buffer Search' })

-- [C][P] Command Palette
vim.keymap.set('n', '<leader>cp', ':Telescope commands<CR>', { desc = 'Command Palette' })

-- [G][D] Go to Definition
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

-- [G][R] Go to References
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Go to references' })

-- [G][I] Go to Implementation
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

-- Prev/Next diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- Splits
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>b', ':split<CR>', { desc = 'Horizontal Split' })

-- [C][F] Format Document
vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, { desc = 'Format file' })

-- ================================
-- ======= PANE MANAGEMENT ========
-- ================================

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- ========================
-- ======= BUFFERS ========
-- ========================

vim.keymap.set('n', 'L', ':bnext<CR>')
vim.keymap.set('n', 'H', ':bprevious<CR>')
vim.keymap.set('n', '<leader>t', ':%bd|e#|bd#<CR>', { desc = 'Close other buffers' })

-- ==========================
-- ======= FILE TREE ========
-- ==========================
-- This assumes you are using 'nvim-tree' or 'neo-tree'
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle Explorer' })

-- =========================
-- ======= TERMINAL ========
-- =========================

vim.keymap.set('n', '<A-S-j>', ':terminal<CR>', { desc = 'Open Terminal' })
-- Note: Terminal navigation in Neovim usually requires T-mode maps
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- ========================
-- ======= HARPOON ========
-- ========================
-- Requires 'ThePrimeagen/harpoon'
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
