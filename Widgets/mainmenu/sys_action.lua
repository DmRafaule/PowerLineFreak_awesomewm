local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")

local _M = wibox.widget({
    -- Quit
    {
        {
            {
                image  = user_var.quit_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'quit',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Reboot
    {
        {
            {
                image  = user_var.reboot_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'reboot',
        forced_width = 75,
        widget = wibox.container.background
    },
    -- Shutdown
    {
        {
            {
                image  = user_var.shutdown_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'shutdown',
        forced_width = 75,
        widget = wibox.container.background
    },
    spacing = -15,
    layout = wibox.layout.fixed.horizontal
})


_M:get_children_by_id('quit')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
_M:get_children_by_id('quit')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
_M:get_children_by_id('quit')[1]:connect_signal('button::press', function (c) 
    awesome.quit()
end)
_M:get_children_by_id('reboot')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
_M:get_children_by_id('reboot')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
_M:get_children_by_id('reboot')[1]:connect_signal('button::press', function (c) 
    awful.spawn.with_shell("reboot")
end)
_M:get_children_by_id('shutdown')[1]:connect_signal('mouse::enter', function (c) c:set_bg(user_var.time_b_hovered) end)
_M:get_children_by_id('shutdown')[1]:connect_signal('mouse::leave', function (c) c:set_bg(user_var.time_b) end)
_M:get_children_by_id('shutdown')[1]:connect_signal('button::press', function (c) 
    awful.spawn.with_shell("shutdown now")
end)


return _M
