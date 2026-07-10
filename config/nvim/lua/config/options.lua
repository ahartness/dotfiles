
local opt = vim.opt

-- UI Config
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true -- highlight the current line
opt.wrap = true -- enable line wrapping
opt.scrolloff = 10 -- minimum number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- minimum number of screen columns to keep to the left and right of the cursor

-- Searching
opt.incsearch = true -- enable incremental search
opt.hlsearch = false -- do not highlight search results
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- override ignorecase if search pattern contains uppercase letters

-- HINT: use `:h <option>` to figure out the meaning if needed
opt.clipboard = 'unnamedplus' -- use system clipboard
opt.completeopt = {'menu', 'menuone', 'noselect'} -- configure completion options
opt.mouse = 'a' -- enable mouse support

-- Indentation
opt.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
opt.softtabstop = 2 -- number of spaces that a <Tab> counts for while editing
opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- enable smart indentation
opt.autoindent = true -- enable automatic indentation

-- Visual Settings
opt.termguicolors = true -- enable true color support
opt.signcolumn = 'yes' -- always show the sign column
opt.showmatch = true -- highlight matching brackets
opt.matchtime = 2 -- time in tenths of a second to show matching brackets
opt.cmdheight = 1 -- number of lines to use for the command line
opt.showmode = false -- do not show the mode (e.g., -- INSERT --) since it is shown in the status line
opt.pumheight = 10 -- maximum number of items to show in the popup menu
opt.pumblend = 10 -- transparency level for the popup menu
opt.winblend = 0 -- transparency level for floating windows
opt.completeopt = {'menu', 'menuone', 'noselect'} -- configure completion options
opt.conceallevel = 2 -- set conceal level to 0 to make text normally visible
opt.confirm = true -- show a confirmation dialog when closing an unsaved buffer
opt.concealcursor = '' -- do not conceal text even when the cursor is over it
opt.synmaxcol = 300 -- maximum column for syntax highlighting
opt.ruler = false -- do not show the cursor position in the status line
opt.virtualedit = 'block' -- allow the cursor to move one character beyond the end of the line
opt.winminwidth = 5 -- minimum width for a window

-- File Handling
opt.backup = false -- Don't create backup file
opt.writebackup = flase -- dont create backup before writing
opt.swapfile = false -- disable swap file
opt.undofile = true -- Persistent Undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
opt.updatetime = 300 -- Faster completion
opt.timeoutlen = vim.g.vscode and 1000 or 300 
opt.ttimeoutlen = 0 -- key code timeout
opt.autoread = true -- auto reload files changed outside vim
opt.autowrite = true -- autosave

-- Behavior settings
opt.hidden = true -- allow hidden buffers
opt.errorbells = false -- disable error bells
opt.backspace = "indent,eol,start" -- better backspace behavior
opt.autochdir = false -- dont auto change directory
opt.iskeyword:append("-") -- treat a dash (-) as part of word
opt.path:append("**") -- include sub-directories in search
opt.selection = "exclusive" -- Selection behavior
opt.mouse = "a" -- enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with sys clipboard unless on ssh
opt.modifiable = true -- allow buffer modifications
opt.encoding = "UTF-8"

-- Folding Settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99 -- start with all folds open
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Split behavior
opt.splitbelow = true -- force new horizontal splits to be below the current window
opt.splitright = true -- force new vertical splits to be to the right of the current window
opt.splitkeep = "screen"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance Improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Create Undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }

opt.jumpoptions = "view"
opt.laststatus = 3 -- Global statusline
opt.list = false
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true
opt.shiftround = true -- Round indentation
opt.shiftwidth = 2 -- Size of indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.g.markdown_reccomended_style = 0

vim.filetype.add({
  extension = {
    env = "dotenv"
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = { 
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

opt.termguicolors = true -- enable true color support

