pcall(require, "luarocks.loader")


-- Add utils
require("Utils.screen")
SetTheme("dark")
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

SetWallpaper("minimalism/archlike5.png")
