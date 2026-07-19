-- Dual Monitor Setup
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@120",
	position = "0x0",
	scale = "1",
})
hl.monitor({
	output = "DP-2",
	mode = "3440x1400@100",
	position = "0x-1440", -- Why does this not work?
	scale = "1",
})

-- Bind workspaces to monitors

-- Workspace 1-6 on DP-1,
for i = 1, 6 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
		persistent = true,
	})
end

-- Workspace 7-10 on DP-2
for i = 7, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-2",
		persistent = true,
	})
end
