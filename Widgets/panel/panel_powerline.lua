require("Utils.widgets")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local user_var = require("Theme.user_var")
local timeW = require("Widgets.time.timeWidget")
local kl = require("Widgets.keyboard_layout.kl")
local systrayW = require("Widgets.systray.systrayWidget")
local layoutBoxW = require("Widgets.work_layout.layoutWidget")
local batteryW = require("Widgets.battery.main")
local volumeW = require("Widgets.volume.main")
local brightnessW = require("Widgets.brightness.main")
local net = require("Widgets.net.main")
local tasklistW = require("Widgets.tasklist.tasklistWidget")
local taglistW = require("Widgets.taglist.taglistWidget")


beautiful.init(gears.filesystem.get_configuration_dir().."Theme/theme.lua")


local arrow = wibox.widget({
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
})
local gap_expandW = wibox.widget({
    layout = wibox.layout.align.horizontal,
})


-- Till panel_powerline not returning anything, it for debuging purposed will be global
NavigationmenuW = {
    widget = wibox.widget{
        taglistW,
        tasklistW,
        spacing = 5,
        layout = wibox.layout.fixed.horizontal,
    },
    isSwitched = false
}
StatusmenuW = {
    widget = wibox.widget{
      arrow,
      SetGap(35),
      systrayW,
      SetGap(35),
      kl,
      net,
      brightnessW,
      volumeW,
      batteryW,
      timeW,
      layoutBoxW,
      spacing = -15,
      layout = wibox.layout.fixed.horizontal,
    },
    isSwitched = false
}



awful.screen.connect_for_each_screen(function(s)
    s.main_wibox = awful.wibar({
        position = "bottom",
        screen = s,
        bg = user_var.wibox_b,
    })
    s.main_wibox:setup {
        NavigationmenuW.widget,
        gap_expandW,
        StatusmenuW.widget,
        layout = wibox.layout.align.horizontal,
    }
end)
-- }}}
