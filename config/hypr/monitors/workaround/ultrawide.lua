---@diagnostic disable: undefined-global
-- DP-2 only.
--
-- DP-1 is deliberately not declared as disabled here. The switch script
-- disables it after this valid configuration has been atomically installed.

hl.monitor({
    output = "DP-2",
    mode = "3440x1440@100.00",
    position = "0x0",
    scale = "1",
})

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-2",
        persistent = true,
    })
end
