local M = {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        -- Set a vim motion to <Shift>M to mark a file with harpoon
        vim.keymap.set("n", "<s-m>", "<cmd>lua require('plugins.harpoon').mark_file()<cr>", { desc = "Harpoon Mark File" })

        -- Set a vim motion to the tab key to open the harpoon menu for navigating to files
        vim.keymap.set("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon Toggle Menu" })
    end
}

function M.mark_file()
    require("harpoon.mark").add_file()
    vim.notify "Marked File with Harpoon"
end

return M
