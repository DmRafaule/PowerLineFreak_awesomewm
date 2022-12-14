local gears = require("gears")
local beautiful = require("beautiful")




function SetWallpaper()
    -- Wallpaper
    if beautiful.wallpaper then
        local wp = beautiful.wallpaper
        gears.wallpaper.maximized(wp, nil, true)
    end
end

