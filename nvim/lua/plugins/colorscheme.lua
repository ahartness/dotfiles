return {
    -- Shortened Github URL
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    -- Sets the LazyVim colorscheme to dracula
    config = function()
        vim.cmd.colorscheme "dracula"
    end
}       
