local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")

local _M = wibox.widget({
    -- Key bindings
    {
        {
            {
                image  = user_var.shortcuts,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.widget_b,
        shape = gears.shape.rectangular_tag,
        id = 'keyb',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Theming
    {
        {
            {
                image  = user_var.colors,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.widget_b,
        shape = gears.shape.rectangular_tag,
        id = 'themes',
        forced_width = 75,
        widget = wibox.container.background
    },
    spacing = -15,
    layout = wibox.layout.fixed.horizontal
})



_M:get_children_by_id('keyb')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
_M:get_children_by_id('keyb')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
_M:get_children_by_id('keyb')[1]:connect_signal('button::press', function (c) 

end)
_M:get_children_by_id('themes')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
_M:get_children_by_id('themes')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
_M:get_children_by_id('themes')[1]:connect_signal('button::press', function (c) 

end)

return _M
