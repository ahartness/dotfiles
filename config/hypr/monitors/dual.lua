
-- Dual Monitor Setup
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@180",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "DP-2",
    mode     = "3440x1400@100",
    position = "0x-1440", -- Why does this not work?
    scale    = "1",
})
