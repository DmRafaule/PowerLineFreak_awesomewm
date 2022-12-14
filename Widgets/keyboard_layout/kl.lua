-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Theme/user_var.lua")
require("Widgets.keyboard_layout.kbdcfg")


-- Keyboard map indicator and switcher
local	_M = kbdcfg({type = "gui"})

_M.add_primary_layout("English", user_var.us_layout_icon, "us")
_M.add_primary_layout("Русский", user_var.ru_layout_icon, "ru")

_M.bind()

-- Mouse bindings
_M.widget:buttons(
  awful.util.table.join(
    awful.button({ }, 1, function () kbdcfg:switch_next() end),
    awful.button({ }, 3, function () kbdcfg.menu:toggle() end)
  )
)

return _M


