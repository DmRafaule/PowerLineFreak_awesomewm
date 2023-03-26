local gfs = require("gears.filesystem")
local confDir = gfs.get_configuration_dir()

local _M = {
  -- Sound
  no_sound = confDir .."Pictures/Icons/light/volume_mute.png",
  sound_up = confDir .."Pictures/Icons/light/volume_up.png",
  sound_down = confDir .."Pictures/Icons/light/volume_down.png",
  sound_min = confDir .."Pictures/Icons/light/volume_low.png",
  sound_med = confDir .."Pictures/Icons/light/volume_midlle.png",
  sound_high = confDir .."Pictures/Icons/light/volume_high.png",
  -- Brightness
  brightness = confDir .."Pictures/Icons/light/brightness12.png",
  brightness_folder = confDir .."Pictures/Icons/light/brightness",
  -- Wifi
  connected_via_wifi = confDir .."Pictures/Icons/light/wifi.png",
  connected_via_lan = confDir .."Pictures/Icons/light/lan.png",
  no_connected = confDir .."Pictures/Icons/light/no_signal.png",
  -- Battery
	discharging = confDir .. "Pictures/Icons/light/discharging.png",
	charging = confDir .. "Pictures/Icons/light/charging.png",

  -- System action
	shutdown_icon = confDir.."Pictures/Icons/light/shutdown.png",
	reboot_icon = confDir.."Pictures/Icons/light/reboot.png",
	quit_icon = confDir.."Pictures/Icons/light/logout.png",
  -- Layout
	ru_layout_icon = confDir.."Pictures/Icons/light/ru.png",
	us_layout_icon = confDir.."Pictures/Icons/light/us.png",
  -- Main menu
	apps  = confDir.."Pictures/Icons/light/apps.png",
	settings = confDir.."Pictures/Icons/light/settings.png",
	arch = confDir.."Pictures/Icons/light/arch.png",
	shortcuts = confDir.."Pictures/Icons/light/shortcuts.png",
	colors = confDir.."Pictures/Icons/light/colors.png",
	-- Work layout
	work_layout_spiral = confDir.. "Pictures/Icons/light/spiral.png",
	work_layout_dwindle = confDir.. "Pictures/Icons/light/dwindle.png",
	work_layout_fairv = confDir.. "Pictures/Icons/light/fairv.png",
	work_layout_fairh = confDir.. "Pictures/Icons/light/fairh.png",
	work_layout_tiletop = confDir.. "Pictures/Icons/light/tiletop.png",
	work_layout_tileleft = confDir.. "Pictures/Icons/light/tileleft.png",
	work_layout_tilebottom = confDir.. "Pictures/Icons/light/tilebottom.png",
	work_layout_cornersw = confDir.. "Pictures/Icons/light/cornersw.png",
	work_layout_cornerse = confDir.. "Pictures/Icons/light/cornerse.png",
	work_layout_cornernw = confDir.. "Pictures/Icons/light/cornernw.png",
	work_layout_cornerne = confDir.. "Pictures/Icons/light/cornerne.png",
	work_layout_fullscreen = confDir.. "Pictures/Icons/light/fullscreen.png",
	work_layout_magnifier = confDir.. "Pictures/Icons/light/magnifier.png",
	work_layout_floating = confDir.. "Pictures/Icons/light/floating.png",
	work_layout_tile = confDir.. "Pictures/Icons/light/tile.png",
	work_layout_max = confDir.. "Pictures/Icons/light/max.png",
}

return _M
