local gears = require("gears")

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
    timeout = 30,
    autostart = true,
    callback = function()
      collectgarbage()
    end
}
--gears.timer {
--    timeout = 300,
--    autostart = true,
--    callback = function ()
        --local function scanDir(directory)
            --local i, fileList, popen = 0, {}, io.popen
            --for filename in popen([[find "]] ..directory.. [[" -type f]]):lines() do
            --    i = i + 1
            --    fileList[i] = filename
            --end
            --return fileList
            --end
        --local wallpaperList = scanDir(gears.filesystem.get_configuration_dir().. "Pictures/Wallpapers")

        --awful.screen.connect_for_each_screen(function(s) 
        --    local function set_wallpaper (s)
        --        -- Wallpaper
        --        if beautiful.wallpaper then
        --            --local wallpaper = wallpaperList[math.random(1, #wallpaperList)]
        --            -- If wallpaper is a function, call it with the screen
        --            if type(wallpaper) == "function" then
        --                wallpaper = wallpaper(s)
        --            end
        --            gears.wallpaper.maximized(wallpaper, s, true)
        --        end
        --    end
        --    set_wallpaper(s)
        --end)
--    end
--}



-- }}}
