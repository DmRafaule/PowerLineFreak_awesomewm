-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Add config for keybindings 
require("Bindings.keybindings")
-- Add config for error handler
require("Signals.errorHandler")
-- Add config for all signals
require("Signals.signals")
-- Add timer support
require("Signals.timers")
-- Add config for wibar
require("Widgets.widgets")
-- Add config for rules
require("Rules.rules")
-- Add utils
require("Utils.screen")

SetWallpaper()
