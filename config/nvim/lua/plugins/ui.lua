return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            actions = {
              toggle_hidden_ignored = function(picker)
                local show = not (picker.opts.hidden and picker.opts.ignored)
                picker.opts.hidden = show
                picker.opts.ignored = show
                picker.list:set_target()
                picker:find()
              end,
            },
            win = {
              list = {
                keys = {
                  ["h"] = { "toggle_hidden_ignored", desc = "Toggle Hidden and Ignored Files" },
                },
              },
            },
          },
        },
      },
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
      ██╗  ██╗ ██████╗  ████████╗ ███╗   ██╗  ███████╗
      ██║  ██║ ██╔══██╗ ╚══██╔══╝ ████╗  ██║  ██╔════╝
      ███████║ ██████╔╝    ██║    ██╔██╗ ██║  ███████╗
      ██╔══██║ ██╔══██╗    ██║    ██║╚██╗██║  ╚════██║
      ██║  ██║ ██║  ██║    ██║    ██║ ╚████║  ███████║
       ╚═╝  ╚═╝ ╚═╝  ╚═╝    ╚═╝    ╚═╝  ╚═══╝  ╚══════╝ 
          ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
