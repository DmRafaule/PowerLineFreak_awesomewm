local wibox = require("wibox")
local colors = require("Theme.colors")
local icons = require("Theme.icons")
local gears = require("gears")
--local watch = require("awful.watch")
local timeout = 5

local net_s = wibox.widget{
    {
        image = icons.connected_via_wifi,
        resize = true,
        forced_height = 25,
        forced_width = 25,
        widget = wibox.widget.imagebox,
    },
    layout = wibox.container.place
}
local la = wibox.widget{
    net_s,
    halign = 'center',
    widget = wibox.container.place
}

local _M = wibox.widget({
    la,
    bg = colors.net_background,
    shape_border_color = colors.net_borders,
    shape_border_width = 4,
    shape = gears.shape.transform(gears.shape.powerline) 
                : scale(-1,1)
                    : translate(-60,0),
    forced_width = 60,
    id = 'sett',
    widget = wibox.container.background
})
_M:connect_signal("button::press",function ()
  
end)


--watch("nmcli",timeout,function(widget,stdout)
--  
--end)

return _M
