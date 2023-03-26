local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local common = require("Themes.common")
local colors = require("Themes."..common.theme..".colors")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.max,
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  --awful.layout.suit.magnifier,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  --awful.layout.suit.spiral,
  --awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max.fullscreen,
  --awful.layout.suit.corner.nw,
  --awful.layout.suit.corner.ne,
  --awful.layout.suit.corner.sw,
  --awful.layout.suit.corner.se,
}

local layout = wibox.widget({
      {
          awful.widget.layoutbox(),
          halign = 'right',
          widget = wibox.container.place
      },
      bg = colors.time_b,
      shape = gears.shape.rectangular_tag,
      forced_width = 25,
      id = 'main',
      widget = wibox.container.background
  })

layout:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end))
    )
return layout
