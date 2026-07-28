---@diagnostic disable: undefined-global
-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	-- Autostart applications
end)

hl.exec_cmd("qs --no-duplicate -c noctalia-shell")
