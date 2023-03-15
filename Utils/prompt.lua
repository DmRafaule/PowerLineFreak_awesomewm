local tasklistW = require("Widgets.tasklist.tasklistWidget")
local taglistW = require("Widgets.taglist.taglistWidget")


function RemovePrompt()
  runPromtW.visible = false;
  NavigationmenuW.widget:insert(1,taglistW)
  NavigationmenuW.widget:insert(2,tasklistW)
  NavigationmenuW.isSwitched = false
end

function AddPrompt()
  runPromtW.visible = true;
  NavigationmenuW.widget:remove_widgets(taglistW)
  NavigationmenuW.widget:remove_widgets(tasklistW)
  NavigationmenuW.isSwitched = true
end
