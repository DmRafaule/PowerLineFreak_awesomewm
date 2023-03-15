local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local gfs = require("gears.filesystem")
local user_var = dofile(gfs.get_configuration_dir() .. "Theme/user_var.lua")
local kl = require("Widgets.keyboard_layout.kbdcfg")
local modkey = user_var.modkey
local timeW = require("Widgets.time.timeWidget")
local klW = require("Widgets.keyboard_layout.kl")
local systrayW = require("Widgets.systray.systrayWidget")
local layoutBoxW = require("Widgets.work_layout.layoutWidget")
local batteryW = require("Widgets.battery.main")
local volumeW = require("Widgets.volume.main")
local brightnessW = require("Widgets.brightness.main")
local net = require("Widgets.net.main")
local tasklistW = require("Widgets.tasklist.tasklistWidget")
local taglistW = require("Widgets.taglist.taglistWidget")
require("Widgets.prompt.promptWidget")
require("Widgets.panel.panel_powerline")
require("Widgets.mainmenu.apps")
require("Widgets.mainmenu.sys_action")
require("Widgets.mainmenu.settings")
require("awful.hotkeys_popup.keys")
require("awful.autofocus")




-- Mouse bindings
root.buttons(gears.table.join(
    --awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    -- Increase width
    awful.key({ modkey,           }, "l",
        function ()
          awful.tag.incmwfact( 0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    -- Decrease width 
    awful.key({ modkey,           }, "h",
        function ()
          awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    -- Next wind
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    -- Prev wind
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- Next app
    awful.key({modkey}, "9",
      function ()
        GPrevApp()
      end,
      {description = "shift app switcher to left", group = "client"}
    ),
    awful.key({modkey}, "0",
      function ()
        GNextApp()
      end,
      {description = "shift app switcher to left", group = "client"}
    ),
    awful.key({modkey}, "e",
      function ()
        GRunApp()
      end,
      {description = "run app", group = "client"}
    ),

	  -- Changing keyboard layout
    awful.key({"Shift"}, "Alt_L",
      function ()
        kl.switch_next()
      end),
    -- Hide wibar
    awful.key({nil,},"Menu",
      function()
        awful.screen.connect_for_each_screen(function (s)
          if s.main_wibox.visible then
            s.main_wibox.visible = false
          else
            s.main_wibox.visible = true
          end
        end)
      end,
      {description= "showup wibar menu",group = "client"}),
    -- Switcher between mainmenuW and statusmenuW
    awful.key({modkey},           "Tab",
      function ()
        if StatusmenuW.isSwitched == false then
          StatusmenuW.widget:remove_widgets(systrayW)
          StatusmenuW.widget:remove_widgets(klW)
          StatusmenuW.widget:remove_widgets(net)
          StatusmenuW.widget:remove_widgets(brightnessW)
          StatusmenuW.widget:remove_widgets(volumeW)
          StatusmenuW.widget:remove_widgets(batteryW)
          StatusmenuW.widget:remove_widgets(timeW)
          StatusmenuW.widget:remove_widgets(layoutBoxW)
          MainMenu_Clear()
          StatusmenuW.widget:insert(4,AppsW)
          StatusmenuW.widget:insert(5,SettingsW)
          StatusmenuW.widget:insert(6,SysActionW)
          StatusmenuW.isSwitched = true        
        else
          MainMenu_Clear()
          StatusmenuW.widget:remove_widgets(AppsW)
          StatusmenuW.widget:remove_widgets(SettingsW)
          StatusmenuW.widget:remove_widgets(SysActionW)
          StatusmenuW.widget:insert(4,systrayW)
          StatusmenuW.widget:insert(5,klW)
          StatusmenuW.widget:insert(6,net)
          StatusmenuW.widget:insert(7,brightnessW)
          StatusmenuW.widget:insert(8,volumeW)
          StatusmenuW.widget:insert(9,batteryW)
          StatusmenuW.widget:insert(10,timeW)
          StatusmenuW.widget:insert(11,layoutBoxW)
          StatusmenuW.isSwitched = false        
        end
      end,
      {description = "Open main launcher", group = "launcher"}
    ),
    -- Standard program
    awful.key({ modkey,           }, "t", function () awful.spawn(user_var.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "c", function () awful.spawn.with_shell("kitty "..user_var.editor) end,
              {description = "open a code editor", group = "launcher"}),              
    awful.key({ modkey,           }, "b", function () awful.spawn(user_var.browser) end,
              {description = "open a default browser", group = "launcher"}),
    awful.key({ modkey,           }, "m", function () awful.spawn(user_var.fm) end,
              {description = "open a file manager", group = "launcher"}),
    awful.key({ }, "Print", function ()
      awful.spawn.with_shell("scrot --file '/home/dima/Pictures/screenshot-%Y_%m_%d-%H_%M.png' -q 100")
    end),
    -- Mute 
    awful.key({ nil }, "XF86AudioMute",
      function ()
        awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
        UpdateVolume()
      end),
    -- Volume up
    awful.key({ nil }, "XF86AudioRaiseVolume",
      function ()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +5000")
        UpdateVolume()
      end),
    -- Volume down
    awful.key({ nil }, "XF86AudioLowerVolume",
      function ()
        awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -5000")
        UpdateVolume()
      end),
    -- Brightness up
    awful.key({ nil }, "XF86MonBrightnessUp",
      function ()
        awful.spawn.with_shell("xbacklight -inc 10")
        UpdateBrightness()
      end),
    -- Brightness down
    awful.key({ nil }, "XF86MonBrightnessDown",
      function ()
        awful.spawn.with_shell("xbacklight -dec 10")
        UpdateBrightness()
      end),
    awful.key({ nil }, "F5", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({ modkey, "Control" }, "n",
      function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal(
              "request::activate", "key.unminimize", {raise = true}
          )
        end
      end,
      {description = "restore minimized", group = "client"}),
    -- Runprompt - tags and task switcher
    awful.key({ modkey },            "r",
      function()
        Run_prompt()
        if NavigationmenuW.isSwitched == false then
          awful.screen.focused{opt=true}.prompt.visible = true
          NavigationmenuW.widget:remove_widgets(taglistW)
          NavigationmenuW.widget:remove_widgets(tasklistW)
          NavigationmenuW.isSwitched = true
        else
          awful.screen.focused{opt=true}.prompt.visible = false
          NavigationmenuW.widget:insert(1,taglistW)
          NavigationmenuW.widget:insert(2,tasklistW)
          NavigationmenuW.isSwitched = false
        end
      end,
      {description = "run prompt", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
      function (c)
          c.fullscreen = not c.fullscreen
          c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}
    ),
    -- This wierd key combination was get it by using xbindkeys --key and
    -- then pressing button up above f4 key
    awful.key({ "Alt",   }, "Alt_L",
      function (c)
        c:kill()
      end,
      {description = "close", group = "client"}
    ),
    awful.key({ modkey, "Control" }, "space",
      awful.client.floating.toggle,
      {description = "toggle floating", group = "client"}
    ),
    awful.key({ modkey,           }, "n",
      function (c)
          -- The client currently has the input focus, so it cannot be
          -- minimized, since minimized clients can't have the focus.
          c.minimized = true
      end ,
      {description = "minimize", group = "client"}
    )
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
