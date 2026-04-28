return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "echasnovski/mini.icons", -- Mini Icons for Nvim Tree 
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end
    },
    {
        "folke/noice.nvim", -- CmdLine Center Text Bar
        event = "VeryLazy",
        opts = {
            -- add options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'MeanderingProgrammer/render-markdown.nvim', -- Markdown Preview
        dependencies = {
            'echasnovski/mini.nvim', -- Markdown Preview
        },
        opts = {
            -- add options here
        },
    }
}
