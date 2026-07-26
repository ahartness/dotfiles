---@diagnostic disable: undefined-global
-- Stacked dual-monitor layout.
--
-- DP-2's native resolution is 3440x1440, not 3440x1400.
-- Conservative refresh rates are used while working around the Aquamarine
-- hotplug/commit crash. Raise them after the stable fix reaches your system.

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@120.00",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "DP-2",
    mode = "3440x1440@100.00",
    position = "0x-1440",
    scale = "1",
})

-- Workspaces 1-6 on DP-1.
for i = 1, 6 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1",
        persistent = true,
    })
end

-- Workspaces 7-10 on DP-2.
for i = 7, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-2",
        persistent = true,
    })
end
