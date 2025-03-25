return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with default props
            require("mason").setup()
        end
    },
    -- mason lsp config utilizies mason to auto ensure lsp servers
    -- you want are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls"
                }
            })
        end
    },
    -- Mason nvim dap lets mason auto ensure debug adapters ware installed
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "java_debug_adapter",
                    "java-test"
                }
            })
        end
    },
    -- Utility plugin for configuring Java language server for us
    {
       "mfussenegger/nvim-jdtls",
       dependencies = {
            "mfussenegger/nvim-dap"
       }
    },
    {
       "neovim/nvim-lspconfig",
       config = function()
            -- get access to the lspconfig plugin functions
            local lspconfig = require("lspconfig")
            -- get access to the nvim-cmp capabilities
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            -- Setup the typescript language server
            lspconfig.ts_ls.setup({
                capabilities.capabilities,
            })

            -- Setup the go language server
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- Setup the gdscript language server
            lspconfig.gdscript.setup({
                capabilities = capabilities,
            })

            -- Setup the rust analyzer language server
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                settings = {
                    ['rust-analyzer'] = {
                       diagnostics = {
                           enable = true
                       }
                    }
                }
            })

            -- Setup the clangd language server
            lspconfig.clangd.setup({
                capabilities = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp" }
            })

            -- Show code documentation if available
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- go to where the code/variable was defined
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Go To [D]ocumentation" })
            -- Display Code action suggestions for code diagnostics in both normal and visual mode
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- Display all references to the code at the cursor
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Go To [R]eferences" })
            -- Display all implementations to the code at the cursor
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Go To [I]mplementations" })
            -- Smart rename of the code under the cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- Go to where the code/object was declared in the project
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Go To [D]eclaration" })

       end
    }
}
