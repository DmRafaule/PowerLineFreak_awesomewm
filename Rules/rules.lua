-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
local common  = require("Themes.common")




-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
      rule = { },
      properties = {
        titlebars_enabled = false,
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },
    -- Floating clients.
    {
      rule_any = {
        instance = {
          "galculator",
          "lxappearance",
        },
      },
      properties = {
        floating = true,
      }
    },
    -- Default clients in tags
    {
      rule_any = { class = {common.browser,} },
      properties = { tag = "Exploration", }
    }
}


-- }}}
