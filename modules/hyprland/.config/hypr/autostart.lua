hl.on("hyprland.start", function () 
    hl.exec_cmd("noctalia")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("discord")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("flameshot")
    hl.exec_cmd("zen-browser")
end)

