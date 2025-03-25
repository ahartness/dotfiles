return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- ts autotage utilizies treesitter to understand the code structure to auto close tsx tags
        "windwp/nvim-ts-autotag"
    },
    -- when the plugin builds run the TSUpdate command to ensure all our servers are install and updated
    build = ':TSUpdate',
    config = function()
        -- gain access to the treesitter config functions
        local ts_config = require("nvim-treesitter.configs")

        ts_config.setup({
            -- make sure we have all the configs installed
            ensure_installed = {
                "vim",
                "vimdoc",
                "lua",
                "java",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "tsx",
                "markdown",
                "markdown_inline",
                "gitignore",
                "gdscript",
                "angular",
                "c",
                "dockerfile",
                "go",
                "python",
                "rust",
                "tmux",
                "yaml",
                "rasi",
                "hyprlang",
                "zig"
            },   
            -- Enable Highlighting
            highlight = { enable = true },
            -- Enable TSX auto closing tags
            autotag = { enable = true }
        })
    end
}
