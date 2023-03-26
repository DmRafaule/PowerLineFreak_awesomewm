local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("Themes.common")
local colors = require("Themes."..common.theme..".colors")

beautiful.init(gears.filesystem.get_configuration_dir().."Themes/"..common.theme.."/theme.lua")

-- Keyboard map indicator and switcher
local mytextclock =  wibox.widget({
    {
		{
			format = "  %d.%m.%H:%M",
			widget = wibox.widget.textclock()
		},
      halign = 'center',
      widget = wibox.container.place
    },
    bg = colors.time_b,
	  shape = gears.shape.rectangular_tag,
    forced_width = 150,
    id = 'main',
    widget = wibox.container.background
})
return mytextclock
