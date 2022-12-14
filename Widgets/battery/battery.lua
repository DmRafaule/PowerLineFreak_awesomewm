local thm = require("Theme.colors")
local wibox = require("wibox")
local gears = require("gears")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local timeout = 5

local chargeTextW = wibox.widget({
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox()
})
local progressBarW = wibox.widget({
  max_value     = 100,
  value         = 0,
  shape = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-75,0),
  background_color =  thm.batt_background,
  opacity = 1,
  bar_shape  = gears.shape.transform(gears.shape.powerline)
                  : scale(-1,1)
                      : translate(-75,0),
  border_color  = thm.batt_borders,
  border_width = 2,
  widget = wibox.widget.progressbar
})
-- stack of progressbar and charge text
local la = wibox.widget({
    progressBarW,
    layout  = wibox.layout.stack
})
-- Container defining background, shape, position
_M = wibox.widget({
  la,
  bg = thm.batt_background,
  fg = thm.font_color_dark,
  shape = gears.shape.transform(gears.shape.powerline)
              : scale(-1,1)
                  : translate(-75,0),
  forced_width = 75,
  id = 'sett',
  widget = wibox.container.background
})
_M:connect_signal("mouse::enter",function (c)
  la:insert(2,chargeTextW)
end)
_M:connect_signal("mouse::leave",function (c)
  la:remove(2,chargeTextW)
end)

-- Because I don't want to reimplement whole progressbar widget
-- I will calculate battery cappacity assuming that 1 is max 100% and 0.3 is min I mean 0%
-- Watching for battery status
watch("acpi -i",timeout,function (widget,stdout)
  local max = 70
  local min = 30
  local battery_info = {}
  local capacities = {}
  local time = {}
  for s in stdout:gmatch("[^\r\n]+") do
      local status, charge_str, _ = string.match(s, '.+: (%a+), (%d?%d?%d)%%,?(.*)')
      if status ~= nil then
          table.insert(battery_info, {status = status, charge = tonumber(charge_str)})
          table.insert(time,_)
      else
          local cap_str = string.match(s, '.+:.+last full capacity (%d+)')
          table.insert(capacities, tonumber(cap_str))
      end
  end

  local capacity = 0
  for _, cap in ipairs(capacities) do
      capacity = capacity + cap
  end

  local charge = 0
  local status
  local remain = time[1]
  for i, batt in ipairs(battery_info) do
      if capacities[i] ~= nil then
          if batt.charge >= charge then
              status = batt.status -- use most charged battery status
              -- this is arbitrary, and maybe another metric should be used
          end

          charge = charge + batt.charge * capacities[i]
      end
  end
  charge = charge / capacity
  local charge_str = tostring(charge):sub(1,#tostring(charge)-2)
  local color  = ""
  chargeTextW.markup = "<i><b>"..charge_str.."%</b></i>"
  progressBarW.value = charge * (max/100) + min
  if (charge >= 75) then
    color = thm.batt_proggress_barr_100_75
    _M.fg = thm.font_color_dark
  elseif charge < 75 and charge >= 50 then
    color = thm.batt_proggress_barr_75_50
    _M.fg = thm.font_color_dark
  elseif charge < 50 and charge >= 25 then
    color = thm.batt_proggress_barr_50_25
    _M.fg = thm.font_color_light
  else
    color = thm.batt_proggress_barr_25_00
    _M.fg = thm.font_color_light
  end
  progressBarW.color = color
end)



return _M, la, chargeTextW
