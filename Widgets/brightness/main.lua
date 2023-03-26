local wibox = require("wibox")
local common = require("Themes.common")
local colors = require("Themes."..common.theme..".colors")
local icons = require("Themes."..common.theme..".icons")
local gears = require("gears")
local gfs = require("gears.filesystem")
require("Utils.cli")

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
local la = wibox.widget({
    brightness_s,
    layout  = wibox.layout.stack
})

local _M = wibox.widget({
    la,
    bg = colors.brightness_background,
    fg = colors.font_color_light,
    shape = gears.shape.transform(gears.shape.powerline) 
                : scale(-1,1)
                    : translate(-60,0),
    forced_width = 60,
    widget = wibox.container.background
})
_M:connect_signal("mouse::enter",function (c)
  la:insert(2,textW)
end)
_M:connect_signal("mouse::leave",function (c)
  la:remove(2,textW)
end)

function UpdateBrightness()
  local level = tonumber(Capture("xbacklight -get",true))
  textW.markup = tostring(level)..'%'
  local confDir = gfs.get_configuration_dir()
  for i=1,12,1 do
    local from  = 100 - 100/12*i
    local to    = 100 - 100/12*(i-1)
    if level > from and level <= to then
      local res = 12 - (i - 1) 
      brightness_s:get_all_children()[1].image = icons.brightness_folder..tostring(res)..".png" 
    end
  end
end
UpdateBrightness()
return _M
