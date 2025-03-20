return {
    -- Shortened Github URL
    -- "Mofiqul/dracula.nvim", OG Colorsheme > Dracula
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    -- Sets the LazyVim colorscheme to dracula
    config = function()
        -- vim.cmd.colorscheme "dracula"
        vim.cmd.colorscheme "catppuccin"
        -- vim.g.catppuccino_italic = false
    end
}
