---@diagnostic disable: undefined-global
-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	-- Autostart applications
	hl.exec_cmd("qs -c noctalia-shell")
end)

hl.exec_cmd("qs --no-duplicate -c noctalia-shell")
