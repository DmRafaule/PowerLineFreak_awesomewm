local wibox = require("wibox")
local user_var = require("Theme.user_var")
local gears = require("gears")


local _M = wibox.widget({
      {
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.widget_b,
      shape = gears.shape.transform(gears.shape.powerline) 
                  : scale(-1,1)
                      : translate(-50,0),
      forced_width = 50,
      id = 'sett',
      widget = wibox.container.background
})

return _M