return {
    -- Shortened Github URL
    -- "Mofiqul/dracula.nvim", OG Colorsheme > Dracula
    -- "catppuccin/nvim",
    -- "bluz71/vim-nightfly-guicolors",
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    -- Sets the LazyVim colorscheme to dracula
    config = function()
        -- vim.cmd.colorscheme "dracula"
        -- vim.cmd.colorscheme "catppuccin"
        -- vim.cmd.colorscheme "nightfly"
        vim.cmd.colorscheme "onenord"
        -- vim.g.catppuccino_italic = false
    end
}
