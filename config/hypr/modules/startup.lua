-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("ghostty")
	hl.exec_cmd("qs -c noctalia-shell")
end)
