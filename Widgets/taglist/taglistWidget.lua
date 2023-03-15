-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local gfs = require("gears.filesystem")
local user_var = require("Theme.user_var")
-- This is needed beacause some icons have to be reloaded(otherwise plane text){{{
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir().."Theme/theme.lua")
-- }}}


local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
                              if client.focus then
                                  client.focus:move_to_tag(t)
                              end
                          end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
                              if client.focus then
                                  client.focus:toggle_tag(t)
                              end
                          end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local mytaglist = awful.widget.taglist {
    screen  = awful.screen.focused(),
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = gears.shape.powerline,
        bg_focus = user_var.taglist_s,
        bg_volatile = user_var.taglist_ns,
        bg_empty = user_var.taglist_ns,
        bg_urgent = user_var.taglist_ns,
        bg_occupied = user_var.taglist_ns,
    },
    layout   = {
        spacing = -20,
        spacing_widget = {
            color  = '#000000',
            shape  = gears.shape.powerline,
            widget = wibox.widget.separator,
        },
        layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.textbox,
                        },
                        margins = 0,
                        widget  = wibox.container.margin,
                    },
                    shape  = gears.shape.circle,
                    widget = wibox.container.margin,
                },
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 0,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 30,
            right = 30,
            widget = wibox.container.margin
        },
        
        id     = 'background_role',
        widget = wibox.container.background,
    },
    buttons = taglist_buttons
}

awful.screen.connect_for_each_screen(function(s)
 -- Create a taglist widget
    awful.tag.add("Coding", {
        --icon               = user_var.awesome_icon,
        layout             = awful.layout.suit.tile,
        master_fill_policy = "expand",
        screen             = s,
        selected           = true,
    })
    awful.tag.add("Exploration", {
        layout = awful.layout.suit.floating,
        screen = s,
    })
end)

local _M = wibox.widget({
    -- Force the textbox to always be 300 pixel long
    {
        {
            markup = "<b>               </b>",
            align  = "left",
            widget = mytaglist,
        },
        shape = gears.shape.rect,
        widget = wibox.container.background,
    },
    width    = 300,
    left = -20,
    strategy = "min",
    layout   = wibox.container.margin,
})

return _M
