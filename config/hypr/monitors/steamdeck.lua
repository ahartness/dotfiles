-- Ultra Wide Only Monitor Setup
hl.monitor({
	output = "DP-1",
	disabled = true,
})
hl.monitor({
	output = "DP-2",
	mode = "1280x800@60",
	position = "0x0", -- Why does this not work?
	scale = "1",
})
