return {

  -- Color Theme imports
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "vague-theme/vague.nvim",
    config = function()
      vim.cmd("colorscheme vague")
    end,
  },
}
