require("Widgets.panel.panel_powerline")


IsActiveApps = false
IsActiveSettings = false
IsActiveSys = false

-- Remove all mainmenu related widgets from main wibar
function MainMenu_Clear()
    StatusmenuW.widget:remove_widgets(AppsByItSelf)
    StatusmenuW.widget:remove_widgets(ThemingW)
    StatusmenuW.widget:remove_widgets(KeyBindW)
    StatusmenuW.widget:remove_widgets(RebootW)
    StatusmenuW.widget:remove_widgets(ShutdownW)
end
-- Switch between buttons
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