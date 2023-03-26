local gears = require("gears")
local common = require "Themes.common"





function SetWallpaper( path )
  path = path or common.wallpaper
  local wp = gears.filesystem.get_configuration_dir().. "Pictures/Wallpapers/" .. path
  gears.wallpaper.maximized(wp,nil,true)
end

-- Set theme for use
function SetTheme( str )
  str = str or "neon"
  common.theme = str
end

-- Get current theme
function GetTheme()
  return common.theme
end
