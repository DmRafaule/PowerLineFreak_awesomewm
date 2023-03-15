local awful = require("awful")
local wibox = require("wibox")
local io    = require("io")
local gears = require("gears")
local user_var = require("Theme.user_var")
local tasklistW = require("Widgets.tasklist.tasklistWidget")
local taglistW = require("Widgets.taglist.taglistWidget")



-- For filling up list by all programm and sripts in system using $PATH env var
local function getAvailProg() 
  local list = {}
  local res = ""
  local str = os.getenv("PATH")
  local s = 1
  local e = 1
  while true do
    e = str:find(':',s)
    if e == nil then
      break
    end
    table.insert(list,string.sub(str,s,e-1))
    s = e + 1
  end

  for i,l in ipairs(list) do 
    local buf = io.popen("ls "..l)
    res = res..buf:read("*a")
  end
  return res 
end
-- Finding similar prog/scrips
local function getSimilarProg(pattern)
  local list = {}
  local res  = {}
  local src = getAvailProg()
  local first, last = 0
  while true do
    first, last = src:find("\n"..pattern, first+1)
    last  = src:find("\n",last)
    if not first then break end
    list[src:sub(first, last)] = true
  end

  for l in pairs(list) do 
    table.insert(res,l:sub(2,l:len()-1))       
  end
  return res
end

local min_width = 200
local shift = 1

local H = 25
local W = 200
local BW = 2
local X = 0
local Y = awful.screen.focused{opt=true}.workarea.height - H - 2 * BW 

-- This is just invisible, make it empty
-- Table with wiboxes(for available command)
local prompt_wibox_table = {}
for i=0,5,1 do
  table.insert(prompt_wibox_table,wibox({
    x = 0,
    y = 0,
    visible = false,
    width = min_width,
    font = user_var.font,
    height = 30,
    border_width = 0,
    border_color = user_var.runprmpt_choise_brd,
    bg = user_var.runprmpt_choise_bg,
    fg = user_var.runprmpt_choise_f,
    ontop = true,
    shape = function (cr,width,height)
      gears.shape.powerline(cr,width,height)
    end,
    screen = awful.screen.focused(),
    widget = wibox.widget.textbox()
  }))
end
-- Counter for matches
local w_counter = wibox({
  visible = false,
  width = 100,
  height = H,
  border_width = BW,
  border_color = user_var.runprmpt_counter_brd,
  bg = user_var.runprmpt_counter_b,
  fg = user_var.runprmpt_counter_f,
  shape = function (cr,width,height)
    gears.shape.powerline(cr,width,height)
  end,
  ontop = true,
  screen = awful.screen.focused(),
  widget = wibox.widget{
    {
      id = "actualText",
      forced_width = 50,
      font = user_var.font,
      widget = wibox.widget.textbox(),
    },
    left  = 20,
    right = 10,
    widget = wibox.container.margin
  }
})


local mypromptbox = awful.widget.prompt({ -- Move to Widgets
    prompt = '<b>$: </b>',
    bg_cursor = user_var.runprmpt_cursor,
    fg = user_var.runprmpt_f,
    autoexec = true,
    -- Calls when hit esc
    done_callback = function ()
      for _,wib in ipairs(prompt_wibox_table) do
        wib.visible = false
      end
      awful.screen.focused{opt=true}.prompt.visible = false
      NavigationmenuW.widget:insert(1,taglistW)
      NavigationmenuW.widget:insert(2,tasklistW)
      NavigationmenuW.isSwitched = false
      w_counter.visible = false
    end,
    completion_callback = function (command_bCur, cur_pos, counter)
      local list = getSimilarProg(command_bCur) -- List of all match commands
      local pos_for_w_counter -- Position for counter
      local size = 0  -- Length of result command 
      local res = ""  -- Result command
      if (#list > 0) then
        counter = counter % #list + 1
        size = #list[counter]
        res = list[counter]
        for i,wib in ipairs(prompt_wibox_table) do
          -- Set Position
          wib.x = W * i - 10*i
          wib.y = Y
          -- Set Text, Visibility, and Highliting
          if (i <= #list) then        
              wib.visible = true
              wib.widget.markup = "\t<b>"..list[i].."</b>"
              if (i == counter) then
                wib.bg = user_var.runprmpt_choise_s
              else
                wib.bg = user_var.runprmpt_choise_ns
              end
          -- If we have some unneeded wiboxes we will not display them
          else
            wib.visible = false
          end
          -- If our counter more than size of our wibox's table
          if (counter > #prompt_wibox_table ) then
            -- Make a shift
            wib.widget.markup = "\t<b>"..list[i+shift].."</b>"
            -- Just mark a last one for sure.
            prompt_wibox_table[#prompt_wibox_table].bg = user_var.runprmpt_choise_s
          end
          -- Set position for counter
          if i <= #list then
            pos_for_w_counter = W * i - 10*i
          end
        end
        -- Shift control flow
        if (counter > #prompt_wibox_table and shift < #list - #prompt_wibox_table) then
          shift = shift + 1
        elseif (shift == #list - #prompt_wibox_table) then
          shift = 1
        end
        -- Set counter
        w_counter.visible = true
        w_counter.x = X + pos_for_w_counter + min_width - 10
        w_counter.y = Y
        w_counter.widget:get_children_by_id("actualText")[1].markup = "<b>"..counter.."/"..#list.."</b>"
      end
      return res, cur_pos+size, res
    end
})


awful.screen.connect_for_each_screen(function(s)
  s.prompt = wibox{
    x = X,
    y = Y,
    visible = false,
    border_width = BW,
    border_color = user_var.tasker_brd,
    fg = user_var.runprmpt_f,
    bg = user_var.runprmpt_bg,
    shape = gears.shape.transform(gears.shape.rectangular_tag)
                : scale(-1,1)
                    : translate(-W,0),
    id = 'quit',
    width = W,
    height = H,
    ontop = true,
    widget = mypromptbox,
  }

end)

function Run_prompt()
  mypromptbox:run()
end

