-- Standard awesome library
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
require("awful.autofocus")
-- Theme handling library
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Theme/user_var.lua")
require("Widgets.keyboard_layout.kbdcfg")


-- Keyboard map indicator and MainMenu_Switcher
local	kl = kbdcfg({type = "gui"})

kl.add_primary_layout("English", user_var.us_layout_icon, "us")
kl.add_primary_layout("Русский", user_var.ru_layout_icon, "ru")

kl.bind()

-- Mouse bindings
kl.widget:buttons(
  awful.util.table.join(
    awful.button({ }, 1, function () kbdcfg:switch_next() end),
    awful.button({ }, 3, function () kbdcfg.menu:toggle() end)
  )
)


local _M = wibox.widget({
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
  })

return _M


