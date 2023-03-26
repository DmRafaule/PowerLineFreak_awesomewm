local gfs = require("gears.filesystem")
local confDir = gfs.get_configuration_dir()

local _M = {
  -- Sound
  no_sound = confDir .."Pictures/Icons/neon/volume_mute.png",
  sound_up = confDir .."Pictures/Icons/neon/volume_up.png",
  sound_down = confDir .."Pictures/Icons/neon/volume_down.png",
  sound_min = confDir .."Pictures/Icons/neon/volume_low.png",
  sound_med = confDir .."Pictures/Icons/neon/volume_midlle.png",
  sound_high = confDir .."Pictures/Icons/neon/volume_high.png",
  -- Brightness
  brightness = confDir .."Pictures/Icons/neon/brightness12.png",
  brightness_folder = confDir .."Pictures/Icons/neon/brightness",
  -- Wifi
  connected_via_wifi = confDir .."Pictures/Icons/neon/wifi.png",
  connected_via_lan = confDir .."Pictures/Icons/neon/lan.png",
  no_connected = confDir .."Pictures/Icons/neon/no_signal.png",
  -- Battery
	discharging = confDir .. "Pictures/Icons/neon/discharging.png",
	charging = confDir .. "Pictures/Icons/neon/charging.png",

  -- System action
	shutdown_icon = confDir.."Pictures/Icons/neon/shutdown.png",
	reboot_icon = confDir.."Pictures/Icons/neon/reboot.png",
	quit_icon = confDir.."Pictures/Icons/neon/logout.png",
  -- Layout
	ru_layout_icon = confDir.."Pictures/Icons/neon/ru.png",
	us_layout_icon = confDir.."Pictures/Icons/neon/us.png",
  -- Main menu
	apps  = confDir.."Pictures/Icons/neon/apps1.svg",
	settings = confDir.."Pictures/Icons/neon/settings.png",
	arch = confDir.."Pictures/Icons/neon/arch.svg",
	shortcuts = confDir.."Pictures/Icons/neon/shortcuts.svg",
	colors = confDir.."Pictures/Icons/neon/colors.svg",
	-- Work layout
	work_layout_spiral = confDir.. "Pictures/Icons/neon/spiral.png",
	work_layout_dwindle = confDir.. "Pictures/Icons/neon/dwindle.png",
	work_layout_fairv = confDir.. "Pictures/Icons/neon/fairv.png",
	work_layout_fairh = confDir.. "Pictures/Icons/neon/fairh.png",
	work_layout_tiletop = confDir.. "Pictures/Icons/neon/tiletop.png",
	work_layout_tileleft = confDir.. "Pictures/Icons/neon/tileleft.png",
	work_layout_tilebottom = confDir.. "Pictures/Icons/neon/tilebottom.png",
	work_layout_cornersw = confDir.. "Pictures/Icons/neon/cornersw.png",
	work_layout_cornerse = confDir.. "Pictures/Icons/neon/cornerse.png",
	work_layout_cornernw = confDir.. "Pictures/Icons/neon/cornernw.png",
	work_layout_cornerne = confDir.. "Pictures/Icons/neon/cornerne.png",
	work_layout_fullscreen = confDir.. "Pictures/Icons/neon/fullscreen.png",
	work_layout_magnifier = confDir.. "Pictures/Icons/neon/magnifier.png",
	work_layout_floating = confDir.. "Pictures/Icons/neon/floating.png",
	work_layout_tile = confDir.. "Pictures/Icons/neon/tile.png",
	work_layout_max = confDir.. "Pictures/Icons/neon/max.png",
}

return _M
