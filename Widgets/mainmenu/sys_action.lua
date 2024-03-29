local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("Themes.common")
local colors = require("Themes."..common.theme..".colors")
local icons = require("Themes."..common.theme..".icons")
require("Widgets.mainmenu.common")



-- Reboot (Just widget button)
RebootW = wibox.widget{
        {
            {
                image  = icons.reboot_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = colors.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'reboot',
        forced_width = 75,
        widget = wibox.container.background
}
-- Shutdown (Just widget button)
ShutdownW = wibox.widget{
        {
            {
                image  = icons.shutdown_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = colors.time_b,
        shape = gears.shape.rectangular_tag,
        id = 'shutdown',
        forced_width = 75,
        widget = wibox.container.background
}
-- (Just widget button)
SysActionW = wibox.widget({
    {
        {
            image  = icons.arch,
            resize = true,
            widget = wibox.widget.imagebox
        },
        halign = 'center',
        widget = wibox.container.place
    },
    bg = colors.time_b,
    shape = gears.shape.rectangular_tag,
    forced_width = 75,
    id = 'main_but',
    widget = wibox.container.background
})


RebootW:connect_signal('mouse::enter', function (c) c:set_bg(colors.time_b_hovered) end)
RebootW:connect_signal('mouse::leave', function (c) c:set_bg(colors.time_b) end)
RebootW:connect_signal('button::press', function (c) 
    awful.spawn.with_shell("reboot")
end)
ShutdownW:connect_signal('mouse::enter', function (c) c:set_bg(colors.time_b_hovered) end)
ShutdownW:connect_signal('mouse::leave', function (c) c:set_bg(colors.time_b) end)
ShutdownW:connect_signal('button::press', function (c)
    awful.spawn.with_shell("shutdown now")
end)

SysActionW:connect_signal('mouse::enter',function(c) c:set_bg(colors.time_b_hovered) end)
SysActionW:connect_signal("mouse::leave", function(c) c:set_bg(colors.time_b) end)
SysActionW:connect_signal("button::press", function ()
    MainMenu_Switcher("sys")
end)




-- Select next one app
function GNextSysAct()
end
-- Select previouse one app
function GPrevSysAct()
end
-- Run current selected app/command
function GRunSysAct()
end
