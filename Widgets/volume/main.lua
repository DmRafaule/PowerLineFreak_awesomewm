local wibox = require("wibox")
local colors = require("Theme.colors")
local icons = require("Theme.icons")
local gears = require("gears")
require("Utils.cli")
local naughty = require("naughty")

local textW = wibox.widget{
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox()
}
local volume_s = wibox.widget{
    {
      image = icons.sound_min,
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
  background_color =  colors.volu_background,
  opacity = 1,
  bar_shape  = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-60,0),
  border_color  = colors.volu_borders,
  border_width = 4,
  widget = wibox.widget.progressbar
})
local la = wibox.widget({
    volume_s,
    layout  = wibox.layout.stack
})

local _M = wibox.widget({
    la,
    bg = colors.volu_background,
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

function UpdateVolume()
  local ismuted =  Capture("pacmd list-sinks | awk '/muted/ { print $2 }'",true)
  local i = string.find(ismuted,"\n")
  if i == nil then
    i = 3
  end
  ismuted = string.sub(ismuted,1,i-1)
  
  if ismuted == "yes" then
    volume_s:get_all_children()[1].image = icons.no_sound
    local sound_level = Capture("amixer get Master | egrep -o '[0-9]{1,3}%'",true)
    for w in string.gmatch(sound_level,'[0-9]+')do
      textW.markup = w..'%'
    end
  end
  if ismuted == "no" then
    local sound_level = Capture("amixer get Master | egrep -o '[0-9]{1,3}%'",true)
    -- Changing volume num
    for w in string.gmatch(sound_level,'[0-9]+')do
      textW.markup = w..'%'
      if tonumber(w) <= 100 and tonumber(w) > 66 then
        volume_s:get_all_children()[1].image = icons.sound_high
      elseif tonumber(w) <= 66 and tonumber(w) > 33 then
        volume_s:get_all_children()[1].image = icons.sound_med
      elseif tonumber(w) <= 33 and tonumber(w) > 0 then
        volume_s:get_all_children()[1].image = icons.sound_min
      else 
        volume_s:get_all_children()[1].image = icons.no_sound
      end
    end
  end
end

UpdateVolume()

return _M
