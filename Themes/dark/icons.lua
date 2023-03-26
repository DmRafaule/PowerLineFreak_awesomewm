local gfs = require("gears.filesystem")
local confDir = gfs.get_configuration_dir()

local _M = {
  -- Sound
  no_sound = confDir .."Pictures/Icons/dark/volume_mute.png",
  sound_up = confDir .."Pictures/Icons/dark/volume_up.png",
  sound_down = confDir .."Pictures/Icons/dark/volume_down.png",
  sound_min = confDir .."Pictures/Icons/dark/volume_low.png",
  sound_med = confDir .."Pictures/Icons/dark/volume_midlle.png",
  sound_high = confDir .."Pictures/Icons/dark/volume_high.png",
  -- Brightness
  brightness = confDir .."Pictures/Icons/dark/brightness12.png",
  brightness_folder = confDir .."Pictures/Icons/dark/brightness",
  -- Wifi
  connected_via_wifi = confDir .."Pictures/Icons/dark/wifi.png",
  connected_via_lan = confDir .."Pictures/Icons/dark/lan.png",
  no_connected = confDir .."Pictures/Icons/dark/no_signal.png",
  -- Battery
	discharging = confDir .. "Pictures/Icons/dark/discharging.png",
	charging = confDir .. "Pictures/Icons/dark/charging.png",

  -- System action
	shutdown_icon = confDir.."Pictures/Icons/dark/shutdown.png",
	reboot_icon = confDir.."Pictures/Icons/dark/reboot.png",
	quit_icon = confDir.."Pictures/Icons/dark/logout.png",
  -- Layout
	ru_layout_icon = confDir.."Pictures/Icons/dark/ru.png",
	us_layout_icon = confDir.."Pictures/Icons/dark/us.png",
  -- Main menu
	apps  = confDir.."Pictures/Icons/dark/apps.png",
	settings = confDir.."Pictures/Icons/dark/settings.png",
	arch = confDir.."Pictures/Icons/dark/arch.png",
	shortcuts = confDir.."Pictures/Icons/dark/shortcuts.png",
	colors = confDir.."Pictures/Icons/dark/colors.png",
	-- Work layout
	work_layout_spiral = confDir.. "Pictures/Icons/dark/spiral.png",
	work_layout_dwindle = confDir.. "Pictures/Icons/dark/dwindle.png",
	work_layout_fairv = confDir.. "Pictures/Icons/dark/fairv.png",
	work_layout_fairh = confDir.. "Pictures/Icons/dark/fairh.png",
	work_layout_tiletop = confDir.. "Pictures/Icons/dark/tiletop.png",
	work_layout_tileleft = confDir.. "Pictures/Icons/dark/tileleft.png",
	work_layout_tilebottom = confDir.. "Pictures/Icons/dark/tilebottom.png",
	work_layout_cornersw = confDir.. "Pictures/Icons/dark/cornersw.png",
	work_layout_cornerse = confDir.. "Pictures/Icons/dark/cornerse.png",
	work_layout_cornernw = confDir.. "Pictures/Icons/dark/cornernw.png",
	work_layout_cornerne = confDir.. "Pictures/Icons/dark/cornerne.png",
	work_layout_fullscreen = confDir.. "Pictures/Icons/dark/fullscreen.png",
	work_layout_magnifier = confDir.. "Pictures/Icons/dark/magnifier.png",
	work_layout_floating = confDir.. "Pictures/Icons/dark/floating.png",
	work_layout_tile = confDir.. "Pictures/Icons/dark/tile.png",
	work_layout_max = confDir.. "Pictures/Icons/dark/max.png",
}

return _M
