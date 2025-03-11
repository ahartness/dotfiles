return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependecies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons"
    },
    opts = {
    },
    config = function()
       -- gain access to the which key plugin
       local which_key = require('which-key')
       local icon = require('mini.icons')

       -- call the setup function with default props
       which_key.setup({
            win = {
                border = "rounded"
            },
            preset = "helix"
       })

       -- Register all the key mapping prefixes
       -- https://www.nerdfonts.com/cheat-sheet for icons
       which_key.add({
           { "<leader>c", desc = "[C]ode", icon = "  "},
           { "<leader>f", desc = "[F]ind", icon = " "},
           { "<leader>w", desc = "[W]indow", icon = " "},
           { "<leader>e", desc = "[E]xplorer", icon = "󰙅"},
      })
    end
}
