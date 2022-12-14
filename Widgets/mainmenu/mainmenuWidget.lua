local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")
local apps = require("Widgets.mainmenu.apps")
local settings = require("Widgets.mainmenu.settings")
local sys_action = require("Widgets.mainmenu.sys_action")
require("Widgets.mainmenu.common")



local widget = wibox.widget({
    {
        -- arrow after gap
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-20,0),
            forced_width = 20,
            widget = wibox.container.background
        },
        -- gap 
        {
            {
                markup = '<b></b>',
                widget = wibox.widget.textbox
            },
            bg = user_var.layout_b..'00',
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-45,0),
            forced_width = 45,
            widget = wibox.container.background
        },
        -- Apps
        {
            {
                {
                    image  = user_var.apps,
                    resize = true,
                    widget = wibox.widget.imagebox
                },
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.layout_b,
            shape = gears.shape.transform(gears.shape.powerline) 
                        : scale(-1,1)
                            : translate(-75,0),
            forced_width = 75,
            id = 'apps_but',
            widget = wibox.container.background
        },
        -- Settings
        {
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
        },
        -- System actions
        {
            {
                {
                    image  = user_var.arch,
                    resize = true,
                    widget = wibox.widget.imagebox
                },
                halign = 'center',
                widget = wibox.container.place
            },
            bg = user_var.time_b,
            shape = gears.shape.rectangular_tag,
            forced_width = 75,
            id = 'main_but',
            widget = wibox.container.background
        },
        id = 'mainmenu',
        spacing = -20,
        layout = wibox.layout.fixed.horizontal
    },
    halign = 'right',
    layout = wibox.container.place
})

-- Clear all widgets on mainmenuWidget
local function clearall()
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(apps)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(settings)
    widget:get_children_by_id('mainmenu')[1]:remove_widgets(sys_action)
end
-- Switch between buttons
local function switcher(toswitch)
    local currActive = false
    if toswitch == "app" then
        currActive = IsActiveApps
    elseif toswitch == "set" then
        currActive = IsActiveSettings
    elseif toswitch == "sys" then
        currActive = IsActiveSys
    end

    if not currActive then
        clearall()
        IsActiveApps = false
        IsActiveSettings = false
        IsActiveSys = false
        if toswitch == "app" then
            IsActiveApps = not IsActiveApps
            widget:get_children_by_id('mainmenu')[1]:insert(3, apps)
        elseif toswitch == "set" then
            IsActiveSettings = not IsActiveSettings
            widget:get_children_by_id('mainmenu')[1]:insert(4, settings)
        elseif toswitch == "sys" then
            IsActiveSys = not IsActiveSys
            widget:get_children_by_id('mainmenu')[1]:insert(5, sys_action)
        end
    else
        if toswitch == "app" then
            IsActiveApps = false
        elseif toswitch == "set" then
            IsActiveSettings = false
        elseif toswitch == "sys" then
            IsActiveSys = false
        end
        clearall()
    end

end



-- APPS
widget:get_children_by_id('apps_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.layout_b_hovered) end)
widget:get_children_by_id('apps_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.layout_b) end)
widget:get_children_by_id('apps_but')[1]:connect_signal("button::press", function ()
    switcher("app")
end)



-- SETTINGS
widget:get_children_by_id('sett_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.widget_b_hovered) end)
widget:get_children_by_id('sett_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.widget_b) end)
widget:get_children_by_id('sett_but')[1]:connect_signal("button::press", function ()
    switcher("set")
end)



-- MAIN LAUNCHER
widget:get_children_by_id('main_but')[1]:connect_signal('mouse::enter',function(c) c:set_bg(user_var.time_b_hovered) end)
widget:get_children_by_id('main_but')[1]:connect_signal("mouse::leave", function(c) c:set_bg(user_var.time_b) end)
widget:get_children_by_id('main_but')[1]:connect_signal("button::press", function ()
    switcher("sys") 
end)



awful.screen.connect_for_each_screen(function (s)
    local width = s.workarea.width
    local height = 29
    s.mainmenu = wibox({
        x = s.workarea.width - width,
        y = s.workarea.height - height,
        visible = false,
        width = width,
        height = height,
        border_width = 0,
        border_color = user_var.mm_brd,
        bg = user_var.mm_b..'00',
        ontop = true,
        screen = s,
        widget = widget,
    })
end)
