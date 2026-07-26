---@diagnostic disable: undefined-global
-- DP-1 only.
--
-- DP-2 is deliberately not declared as disabled here. The switch script
-- disables it after this valid configuration has been atomically installed.

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@120.00",
    position = "0x0",
    scale = "1",
})

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
        persistent = true,
    })
end
