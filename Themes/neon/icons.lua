local gfs = require("gears.filesystem")
local confDir = gfs.get_configuration_dir()

local _M = {
  -- Sound
  no_sound = confDir .."Pictures/Icons/volume_mute.png",
  sound_up = confDir .."Pictures/Icons/volume_up.png",
  sound_down = confDir .."Pictures/Icons/volume_down.png",
  sound_min = confDir .."Pictures/Icons/volume_low.png",
  sound_med = confDir .."Pictures/Icons/volume_midlle.png",
  sound_high = confDir .."Pictures/Icons/volume_high.png",
  -- Brightness
  brightness = confDir .."Pictures/Icons/brightness12.png",
  -- Wifi
  connected_via_wifi = confDir .."Pictures/Icons/wifi.png",
  connected_via_lan = confDir .."Pictures/Icons/lan.png",
  no_connected = confDir .."Pictures/Icons/no_signal.png",
  -- Battery
	discharging = confDir .. "Pictures/Icons/discharging.png",
	charging = confDir .. "Pictures/Icons/charging.png",

  -- System action
	shutdown_icon = confDir.."Pictures/Icons/shutdown.png",
	reboot_icon = confDir.."Pictures/Icons/reboot.png",
	quit_icon = confDir.."Pictures/Icons/logout.png",
  -- Layout
	ru_layout_icon = confDir.."Pictures/Icons/ru.png",
	us_layout_icon = confDir.."Pictures/Icons/us.png",
  -- Main menu
	apps  = confDir.."Pictures/Icons/apps1.svg",
	settings = confDir.."Pictures/Icons/settings.png",
	arch = confDir.."Pictures/Icons/arch.svg",
	shortcuts = confDir.."Pictures/Icons/shortcuts.svg",
	colors = confDir.."Pictures/Icons/colors.svg",
	-- Work layout
	work_layout_spiral = confDir.. "Pictures/Icons/spiral.png",
	work_layout_dwindle = confDir.. "Pictures/Icons/dwindle.png",
	work_layout_fairv = confDir.. "Pictures/Icons/fairv.png",
	work_layout_fairh = confDir.. "Pictures/Icons/fairh.png",
	work_layout_tiletop = confDir.. "Pictures/Icons/tiletop.png",
	work_layout_tileleft = confDir.. "Pictures/Icons/tileleft.png",
	work_layout_tilebottom = confDir.. "Pictures/Icons/tilebottom.png",
	work_layout_cornersw = confDir.. "Pictures/Icons/cornersw.png",
	work_layout_cornerse = confDir.. "Pictures/Icons/cornerse.png",
	work_layout_cornernw = confDir.. "Pictures/Icons/cornernw.png",
	work_layout_cornerne = confDir.. "Pictures/Icons/cornerne.png",
	work_layout_fullscreen = confDir.. "Pictures/Icons/fullscreen.png",
	work_layout_magnifier = confDir.. "Pictures/Icons/magnifier.png",
	work_layout_floating = confDir.. "Pictures/Icons/floating.png",
	work_layout_tile = confDir.. "Pictures/Icons/tile.png",
	work_layout_max = confDir.. "Pictures/Icons/max.png",
}

return _M
