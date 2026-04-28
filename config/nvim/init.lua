-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end

-- Add the path to lazy plugin repo for the vim runtime
vim.opt.rtp:prepend(lazypath)

-- Declare the options for lazyvim 
local opts = {
    change_detection = {
        enabled = false,
        -- Don't notify us every time a change is made to the config
        notify = false
    },
    checker = {
        -- Auto check for packaged updates
        enabled = true,
        -- Don't spam me with a notification every time there is a package update
        notify = false
    }
}

-- Load the options from config/options.lua
require("config.options")

-- Load the keymaps from config/keymaps.lua
require("config.keymaps")

-- Load the auto commands from config/autocmds.lus
require("config.autocmds")

-- Load the default lazyvim config
-- require("lazyvim.config")

-- Setup Lazy,  THIS SHOULD ALWAYS BE LAST INIT
-- Tell lazy that all plugin spec are found in the plugins directory
-- Pass it the options we input above
require("lazy").setup("plugins", opts)
