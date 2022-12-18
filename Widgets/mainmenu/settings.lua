local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")
require("Widgets.mainmenu.common")


-- Key bindings(Just widget button)
KeyBindW = wibox.widget{
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
}
-- Theming (Just widget button)
ThemingW = wibox.widget   {
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
}

-- Settings (Just widget button)
SettingsW = wibox.widget({
    {
        {
            image  = user_var.settings,
            resize = true,
            widget = wibox.widget.imagebox
        },
        halign = 'center',
        widget = wibox.container.place
    },
    bg = user_var.widget_b,
    shape = gears.shape.transform(gears.shape.powerline) 
                : scale(-1,1)
                    : translate(-75,0),
    forced_width = 75,
    id = 'sett_but',
    widget = wibox.container.background
})



KeyBindW:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
KeyBindW:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
KeyBindW:connect_signal('button::press', function (c) 

end)
ThemingW:connect_signal('mouse::enter', function (c) c:set_bg(user_var.widget_b_hovered) end)
ThemingW:connect_signal('mouse::leave', function (c) c:set_bg(user_var.widget_b) end)
ThemingW:connect_signal('button::press', function (c) 

end)

SettingsW:connect_signal('mouse::enter',function(c) c:set_bg(user_var.widget_b_hovered) end)
SettingsW:connect_signal("mouse::leave", function(c) c:set_bg(user_var.widget_b) end)
SettingsW:connect_signal("button::press", function ()
    MainMenu_Switcher("set")
end)