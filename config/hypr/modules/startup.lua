---@diagnostic disable: undefined-global
-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	-- Autostart applications
	-- hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("noctalia")
end)

-- legacy v4 noctalia
-- hl.exec_cmd("qs --no-duplicate -c noctalia-shell")
