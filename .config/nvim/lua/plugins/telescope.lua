return {
    {
        'nvim-telescope/telescope.nvim',
        -- pull a specific version of the plugin
        tag = '0.1.6',
        dependencies = {
            -- general plugins used to build user interface in neovim plugin
            'nvim-lua/plenary.nvim'
        },
        config = function()
            -- get access to telescopes builtin functions
            local builtin = require('telescope.builtin')

            -- Search for files by their names
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles"})
            -- Search for files based on the text inside them
            -- Need to install ripgrep for this to work
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind by [G]rep"})
            -- Search for Code Diagnostics in the current project
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "[F]ind [D]iagnostics"})
            -- Resumes the previous Search done
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "[F]ind [R]esume"})
            -- Search for Recent Files
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = "[F]ind Recent Files ('.' for repeat)"})
            -- Search the currently open Buffers
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind Existing [B]uffers"})
        end
    },
    {
       'nvim-telescope/telescope-ui-select.nvim',
       config = function()
           --  get access to telescape navigation functions
           local actions = require("telescope.actions")
            require("telescope").setup({
                -- use ui-select dropdown as out UI
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                mappings = {
                    i = {
                        -- use <ctrl> n to go to next option
                        ["<C-n>"] = actions.cycle_history_next,
                        -- use <ctrl> p to go to "previous" option
                        ["<C-p>"] = actions.cycle_history_prev,
                        -- use <ctrl> j to go to next preview
                        ["<C-j>"] = actions.move_selection_next,
                        -- use <ctrl> j to go to previous preview
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                -- load the ui-select
                require("telescope").load_extension("ui-select")
           })
        end
    }
}
