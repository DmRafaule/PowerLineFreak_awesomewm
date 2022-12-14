-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local user_var = require("Theme.user_var")

-- Keyboard map indicator and switcher
local mytextclock =  wibox.widget({
	  format = "  %d.%m.%H:%M",
	  font = user_var.font,
	  widget = wibox.widget.textclock()
})
return mytextclock
