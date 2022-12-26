local wibox = require "wibox"
local user_var = require "Theme.user_var"
local gears  = require "gears"

-- Create gap widget 
function SetGap(size) 
    local gap = wibox.widget({
        {
            markup = '<b></b>',
            widget = wibox.widget.textbox
        },
        bg = user_var.layout_b..'00',
        shape = gears.shape.transform(gears.shape.powerline)
                    : scale(-1,1)
                        : translate(size * (-1),0),
        forced_width = size,
        widget = wibox.container.background
    })
    return gap
end