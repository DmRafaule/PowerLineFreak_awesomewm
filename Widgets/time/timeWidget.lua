-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")

-- Keyboard map indicator and switcher
local mytextclock =  wibox.widget({
    {
		{
			format = "  %d.%m.%H:%M",
			font = user_var.font,
			widget = wibox.widget.textclock()
		},
      halign = 'center',
      widget = wibox.container.place
    },
    bg = user_var.time_b,
	shape = gears.shape.rectangular_tag,
    forced_width = 150,
    id = 'main',
    widget = wibox.container.background
})
return mytextclock
