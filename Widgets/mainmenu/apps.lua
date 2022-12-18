local awful = require("awful")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local gears = require("gears")
local user_var= require("Theme.user_var")
local naughty = require("naughty")
require("Widgets.mainmenu.common")


-- I know not good name at all but here we are
-- It's representation of all available GUI apps to ther left from AppsW button  
AppsByItSelf = wibox.widget({
    {
        id = "place_container",
        forced_width = 400,
        layout = wibox.layout.fixed.horizontal
    },
    spacing = -10,
    layout = wibox.layout.fixed.horizontal
})

--AppsW button 
AppsW = wibox.widget{
  {
      {
          image  = user_var.apps,
          resize = true,
          widget = wibox.widget.imagebox
      },
      halign = 'center',
      widget = wibox.container.place
  },
  bg = user_var.layout_b,
  shape = gears.shape.transform(gears.shape.powerline) 
              : scale(-1,1)
                  : translate(-75,0),
  forced_width = 75,
  id = 'apps_but',
  widget = wibox.container.background
}

AppsW:connect_signal('mouse::enter',function(c) c:set_bg(user_var.layout_b_hovered) end)
AppsW:connect_signal("mouse::leave", function(c) c:set_bg(user_var.layout_b) end)
AppsW:connect_signal("button::press", function ()
    MainMenu_Switcher("app")
end)


-- Set list of avail programs
local function getApps()
    local list = {}
    for line in  io.lines(gfs.get_configuration_dir().."Widgets/mainmenu/list.txt") do
        list[#list+1] = line
    end
    return list
end

-- Index of sellected app (1 for left one , 4 midle)
local INIT_APP_INDX = 4
local appsNumber = #getApps()
local apps = {}
local currAppIndx = INIT_APP_INDX
local currApp = ""

-- Remove .png and .svg icons extentions
local function extractAppName(nameApp)
  local command = string.gsub(nameApp,".png","")
  if command:find(".svg") ~= nil then
      command = string.gsub(nameApp,".svg","")
  end
  return command
end
-- Set up visible effects
local function proccedAppGUI()
  -- First of all set default values for all
  for it,ch in ipairs(AppsByItSelf:get_children_by_id("place_container")[1]:get_children()) do
    ch.forced_width = 50
    ch.bg = user_var.app_still
    ch.shape = gears.shape.transform(gears.shape.powerline)
                : scale(-1,1)
                    : translate(-50,0)
  end
  -- Now set selected values for chosen one
  local ls = AppsByItSelf:get_children_by_id("place_container")[1]:get_children()[INIT_APP_INDX]
  ls.forced_width = 100
  ls.bg = user_var.app_selected
  ls.shape = gears.shape.transform(gears.shape.powerline)
              : scale(-1,1)
                  : translate(-100,0)
end
-- Return current app name
local function getCurrentApp(shift)
  -- Increase counter
  currAppIndx = currAppIndx + shift
  -- If out of range go to beging or to end element
  if currAppIndx > appsNumber then
    currAppIndx = 1
  elseif currAppIndx <= 0 then
    currAppIndx = appsNumber
  end
  proccedAppGUI()
  return apps[currAppIndx]
end


-- Set up widget
for it, app in ipairs(getApps()) do
    local widget =  wibox.widget({
        {
            {
                image  = gfs.get_configuration_dir().. "Pictures/Apps/"..app,
                resize = true,
                widget = wibox.widget.imagebox
            },
            halign = 'center',
            widget = wibox.container.place
        },
        bg = user_var.app_still,
        shape = gears.shape.transform(gears.shape.powerline) 
                    : scale(-1,1)
                        : translate(-50,0),
        forced_width = 50,
        widget = wibox.container.background
    })
    widget:connect_signal("button::press", function ()
      widget.forced_width = 50
      widget.bg = user_var.app_hoverd
      widget.shape = gears.shape.transform(gears.shape.powerline) 
            : scale(-1,1)
                : translate(-50,0)
      awful.spawn.with_shell(extractAppName(app))
    end)
    widget:connect_signal("mouse::enter", function ()
      widget.forced_width = 100
      widget.bg = user_var.app_selected
      widget.shape = gears.shape.transform(gears.shape.powerline) 
            : scale(-1,1)
                : translate(-100,0)
    end)
    widget:connect_signal("mouse::leave", function ()
      widget.forced_width = 50
      widget.bg = user_var.app_still
      widget.shape = gears.shape.transform(gears.shape.powerline) 
            : scale(-1,1)
                : translate(-50,0)
    end)
    AppsByItSelf:get_children_by_id("place_container")[1]:add(widget)
    apps[it] = app
end

-- Set defaults
currApp = apps[INIT_APP_INDX]
local ls = AppsByItSelf:get_children_by_id("place_container")[1]:get_children()[INIT_APP_INDX]
ls.forced_width = 100
ls.bg = user_var.app_selected
ls.shape = gears.shape.transform(gears.shape.powerline) 
            : scale(-1,1)
                : translate(-100,0)

-- Select next one app
function GNextApp()
  if IsActiveApps == true then
    for it = 1, appsNumber, 1 do
      AppsByItSelf:get_children_by_id("place_container")[1]:swap(it,it+1)
    end
    currApp = getCurrentApp(1)
  end
end
-- Select previouse one app
function GPrevApp()
  if IsActiveApps == true then
    for it = appsNumber, 1, -1 do
      AppsByItSelf:get_children_by_id("place_container")[1]:swap(it,it-1)
    end
    currApp = getCurrentApp(-1)
  end
end
-- Run current selected app/command
function GRunApp()
  if IsActiveApps == true then
    awful.spawn.with_shell(extractAppName(currApp))
  end
end
