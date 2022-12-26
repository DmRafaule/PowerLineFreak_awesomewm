local gfs = require("gears.filesystem")
local confDir = gfs.get_configuration_dir()

local _M = {
    no_sound = confDir .."Pictures/Icons/volume_mute.png",
    sound_up = confDir .."Pictures/Icons/volume_up.png",
    sound_down = confDir .."Pictures/Icons/volume_down.png",
    sound_min = confDir .."Pictures/Icons/volume_low.png",
    sound_med = confDir .."Pictures/Icons/volume_midlle.png",
    sound_high = confDir .."Pictures/Icons/volume_high.png",
    brightness = confDir .."Pictures/Icons/brightness.png",
    connected_via_wifi = confDir .."Pictures/Icons/wifi.png",
    connected_via_lan = confDir .."Pictures/Icons/lan.png",
    no_connected = confDir .."Pictures/Icons/no_signal.png",
	discharging = confDir .. "Pictures/Icons/discharging.png",
	charging = confDir .. "Pictures/Icons/charging.png",
}

return _M