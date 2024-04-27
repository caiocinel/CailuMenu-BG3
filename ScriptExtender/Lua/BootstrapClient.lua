Ext.Require("Const.lua")
Ext.Require("Vars.lua")
Ext.Require("Widgets.lua")

local window = Ext.IMGUI.NewWindow("Cailu Menu 2", 600, 200);

local tabs = window.AddTabBar(window, "Tabs");


local tabGeneral = tabs.AddTabItem(tabs, "General");


ImGuiCheckbox(tabGeneral, "Enable Movement Speed", false, function(sender)
    Vars.MoveSpeed.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiSlider(tabGeneral, "Movement Speed", 1, 10, 0, function(sender)
    Vars.MoveSpeed.Set(sender.Value[1])
end);

ImGuiSeparator(tabGeneral);

ImGuiCheckbox(tabGeneral, "Enable Player Scale", false, function(sender)
    Vars.PlayerScale.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiSlider(tabGeneral, "Player Scale", 1, 10, 0, function(sender)
    Vars.PlayerScale.Set(sender.Value[1])
end);

ImGuiSeparator(tabGeneral);

ImGuiButton(tabGeneral, "Heal Player", function(sender)
    Vars.PlayerHealth.SetType(1);
end);

ImGuiCheckbox(tabGeneral, "God Mode", false, function(sender)
    Vars.PlayerHealth.SetType(2);
end, function(sender) sender.SameLine = true end);

ImGuiSeparator(tabGeneral);

ImGuiInputInt(tabGeneral, "##Gold", 0, function(sender)
    Vars.Gold.Set(sender.Value[1]);
end);

ImGuiButton(tabGeneral, "Set Gold", function(sender)
    Vars.Gold.SetIsChanged();
end, function(sender) sender.SameLine = true end);


ImGuiSeparator(tabGeneral);

ImGuiCheckbox(tabGeneral, "Perfect Rolls", false, function(sender)
    Vars.PerfectRolls.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "Infinite Actions and Movement", false, function(sender)
    Vars.InfiniteActions.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "Unlimited Carry Capacity", false, function(sender)
    Vars.UnlimitedCarryCapacity.SetEnabled(sender.Checked and 1 or 0);
end, function(sender)
    ImGuiText(sender.Tooltip(sender), "Commonly incompatible with carrying capacity mods");
end);




local tabStats = tabs.AddTabItem(tabs, "Stats");
local oStatsWidgets = {}

for key, value in pairs(oStatsList) do
    if(value ~= "None") then
        oStatsWidgets[value] = tabStats.AddSliderInt(tabStats, value, -1, 30, 0);
    end    
end

local statApply = tabStats.AddButton(tabStats, "Apply")

statApply.OnClick = function()
    --_D(Vars.GetAll())
    _D(Vars.GetAll())


    return;
    -- for key, value in pairs(oStatsList) do
    --     if(value ~= "None") then
    --         local originalStats = Vars.Get("Stats");

    --         if(originalStats == nil) then
    --             originalStats = {
    --                 Strength = -1,
    --                 Dexterity = -1,
    --                 Constitution = -1,
    --                 Intelligence = -1,
    --                 Wisdom = -1,
    --                 Charisma = -1,
    --             };
    --         end

    --         originalStats[value] = oStatsWidgets[value].Value[1];
    --         Vars.Set("Stats", originalStats);
    --     end
    -- end
end

