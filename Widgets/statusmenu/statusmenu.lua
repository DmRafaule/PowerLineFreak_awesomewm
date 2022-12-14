local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local user_var = require("Theme.user_var")
local timeW = require("Widgets.time.timeWidget")
local kl = require("Widgets.keyboard_layout.kl")
local systrayW = require("Widgets.systray.systrayWidget")
local layoutBoxW = require("Widgets.work_layout.layoutWidget")
local batteryW = require("Widgets.battery.battery")


-- TODO  
-- 1) Rewrite all wrapers into widgets files
-- 2) Rewrite all signals into files under widget folder()
-- 3) Rewrite brightness w
-- 4) Rewrite sound volume w
-- 5) Rewrite net w

local _M = wibox.widget({
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
  -- gap between systray and arrow
  {
      {
          markup = '<b></b>',
          widget = wibox.widget.textbox
      },
      bg = user_var.layout_b..'00',
      shape = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-35,0),
      forced_width = 35,
      widget = wibox.container.background
  },
  systrayW,
  -- gap between layout and systray
  {
      {
          markup = '<b></b>',
          widget = wibox.widget.textbox
      },
      bg = user_var.layout_b..'00',
      shape = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-35,0),
      forced_width = 35,
      widget = wibox.container.background
  },
  -- layout
  {
      {
          kl.widget,
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.layout_b,
      shape = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-75,0),
      forced_width = 75,
      id = 'apps',
      widget = wibox.container.background
  },
  -- net
  {
      {
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.widget_b,
      shape = gears.shape.transform(gears.shape.powerline) 
                  : scale(-1,1)
                      : translate(-50,0),
      forced_width = 50,
      id = 'sett',
      widget = wibox.container.background
  },
  -- Brightness
  {
      {
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.widget_b,
      shape = gears.shape.transform(gears.shape.powerline) 
                  : scale(-1,1)
                      : translate(-50,0),
      forced_width = 50,
      id = 'sett',
      widget = wibox.container.background
  },
  -- Volume
  {
      {
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.widget_b,
      shape = gears.shape.transform(gears.shape.powerline) 
                  : scale(-1,1)
                      : translate(-50,0),
      forced_width = 50,
      id = 'sett',
      widget = wibox.container.background
  },
  -- Battery
  batteryW,
  -- Textclock
  {
      {
          timeW,
          halign = 'center',
          widget = wibox.container.place
      },
      bg = user_var.time_b,
      shape = gears.shape.rectangular_tag,
      forced_width = 150,
      id = 'main',
      widget = wibox.container.background
  },
  -- Layoutbox
  {
      {
          layoutBoxW,
          halign = 'right',
          widget = wibox.container.place
      },
      bg = user_var.time_b,
      shape = gears.shape.rectangular_tag,
      forced_width = 25,
      id = 'main',
      widget = wibox.container.background
  },
  spacing = -15,
  layout = wibox.layout.fixed.horizontal,
})

return _M

