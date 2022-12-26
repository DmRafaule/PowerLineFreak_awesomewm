local wibox = require("wibox")
local colors = require("Theme.colors")
local icons = require("Theme.icons")
local gears = require("gears")

local textW = wibox.widget{
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox()
}
local brightness_s = wibox.widget{
    {
      image = icons.brightness,
      resize = true,
      forced_height = 25,
      forced_width = 25,
      widget = wibox.widget.imagebox,
    },
    layout = wibox.container.place
}
local progressBarW = wibox.widget({
  max_value     = 100,
  value         = 0,
  shape = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-60,0),
  background_color =  colors.brightness_background,
  opacity = 1,
  bar_shape  = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-60,0),
  border_color  = colors.brightness_borders,
  border_width = 4,
  widget = wibox.widget.progressbar
})
local la = wibox.widget({
    brightness_s,
    layout  = wibox.layout.stack
})

local _M = wibox.widget({
    la,
    bg = colors.brightness_background,
    fg = colors.font_color_dark,
    shape = gears.shape.transform(gears.shape.powerline) 
                : scale(-1,1)
                    : translate(-60,0),
    forced_width = 60,
    widget = wibox.container.background
})
_M:connect_signal("mouse::enter",function (c)
  la:insert(3,textW)
end)
_M:connect_signal("mouse::leave",function (c)
  la:remove(3,textW)
end)

return _M