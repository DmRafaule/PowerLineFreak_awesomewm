local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")


-- Signal function to ecute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
    --c.shape = function (cr,width,height)
    --    gears.shape.rounded_rect(cr,width,height,20)
    --end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) 
    c.border_color = beautiful.border_focus
    c.opacity = 1.0
end)
client.connect_signal("unfocus", function(c) 
    c.border_color = beautiful.border_normal
    c.opacity = 1.0
end)
