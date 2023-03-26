local wibox = require("wibox")
local gears = require("gears")
local common = require("Themes.common")
local colors = require("Themes."..common.theme..".colors")
local icons = require("Themes."..common.theme..".icons")
require("Widgets.mainmenu.common")


-- Key bindings(Just widget button)
KeyBindW = wibox.widget{
    {
        {
            image  = icons.shortcuts,
            resize = true,
            widget = wibox.widget.imagebox
        },
        halign = 'center',
        widget = wibox.container.place
    },
    bg = colors.widget_b,
    shape = gears.shape.rectangular_tag,
    id = 'keyb',
    forced_width = 75,
    widget = wibox.container.background
}
-- Theming (Just widget button)
ThemingW = wibox.widget   {
    {
        {
            image  = icons.colors,
            resize = true,
            widget = wibox.widget.imagebox
        },
        halign = 'center',
        widget = wibox.container.place
    },
    bg = colors.widget_b,
    shape = gears.shape.rectangular_tag,
    id = 'themes',
    forced_width = 75,
    widget = wibox.container.background
}

-- Settings (Just widget button)
SettingsW = wibox.widget({
    {
        {
            image  = icons.settings,
            resize = true,
            widget = wibox.widget.imagebox
        },
        halign = 'center',
        widget = wibox.container.place
    },
    bg = colors.widget_b,
    shape = gears.shape.transform(gears.shape.powerline) 
                : scale(-1,1)
                    : translate(-75,0),
    forced_width = 75,
    id = 'sett_but',
    widget = wibox.container.background
})



KeyBindW:connect_signal('mouse::enter', function (c) c:set_bg(colors.widget_b_hovered) end)
KeyBindW:connect_signal('mouse::leave', function (c) c:set_bg(colors.widget_b) end)
KeyBindW:connect_signal('button::press', function (c) 

end)
ThemingW:connect_signal('mouse::enter', function (c) c:set_bg(colors.widget_b_hovered) end)
ThemingW:connect_signal('mouse::leave', function (c) c:set_bg(colors.widget_b) end)
ThemingW:connect_signal('button::press', function (c) 

end)

SettingsW:connect_signal('mouse::enter',function(c) c:set_bg(colors.widget_b_hovered) end)
SettingsW:connect_signal("mouse::leave", function(c) c:set_bg(colors.widget_b) end)
SettingsW:connect_signal("button::press", function ()
    MainMenu_Switcher("set")
end)



-- Select next one app
function GNextSettOpt()
end
-- Select previouse one app
function GPrevSettOpt()
end
-- Run current selected app/command
function GRunSettOpt()
end
