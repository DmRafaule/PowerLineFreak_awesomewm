require("Widgets.panel.panel_powerline")


IsActiveApps = false
IsActiveSettings = false
IsActiveSys = false
local MainMenuList = {"app", "set", "sys"}
local MainMenuList_CurrentIndex = 0

-- Remove all mainmenu related widgets from main wibar
function MainMenu_Clear()
    StatusmenuW.widget:remove_widgets(AppsByItSelf)
    StatusmenuW.widget:remove_widgets(ThemingW)
    StatusmenuW.widget:remove_widgets(KeyBindW)
    StatusmenuW.widget:remove_widgets(RebootW)
    StatusmenuW.widget:remove_widgets(ShutdownW)
end
-- Switch between buttons
function MainMenu_SwitchNext()
  MainMenuList_CurrentIndex = MainMenuList_CurrentIndex + 1
  if MainMenuList_CurrentIndex > #MainMenuList then
    MainMenuList_CurrentIndex = 1
  end
  return MainMenuList_CurrentIndex
end

function MainMenu_SwitchPrev()
  MainMenuList_CurrentIndex = MainMenuList_CurrentIndex - 1
  if MainMenuList_CurrentIndex < 1 then
    MainMenuList_CurrentIndex = #MainMenuList
  end
  return MainMenuList_CurrentIndex
end

function MainMenu_RunCurrent()
  MainMenu_Switcher(MainMenuList[MainMenuList_CurrentIndex])
end
function MainMenu_Switcher(toswitch)
    local currActive = false
    if toswitch == "app" then
        currActive = IsActiveApps
    elseif toswitch == "set" then
        currActive = IsActiveSettings
    elseif toswitch == "sys" then
        currActive = IsActiveSys
    end

    if not currActive then
        MainMenu_Clear()
        IsActiveApps = false
        IsActiveSettings = false
        IsActiveSys = false
        if toswitch == "app" then
            IsActiveApps = not IsActiveApps
            StatusmenuW.widget:insert(4, AppsByItSelf)
        elseif toswitch == "set" then
            IsActiveSettings = not IsActiveSettings
            StatusmenuW.widget:insert(5, ThemingW)
            StatusmenuW.widget:insert(6, KeyBindW)
        elseif toswitch == "sys" then
            IsActiveSys = not IsActiveSys
            StatusmenuW.widget:insert(6, RebootW)
            StatusmenuW.widget:insert(7, ShutdownW)
        end
    else
        if toswitch == "app" then
            IsActiveApps = false
        elseif toswitch == "set" then
            IsActiveSettings = false
        elseif toswitch == "sys" then
            IsActiveSys = false
        end
        MainMenu_Clear()
    end

end
