Ext.Require("Const.lua")
Ext.Require("Vars.lua")

local window = Ext.IMGUI.NewWindow("Cailu Menu 2", 600, 200);

local tabs = window.AddTabBar(window, "Tabs");


local tabGeneral = tabs.AddTabItem(tabs, "General");

local enabledMoveSpeed = tabGeneral.AddCheckbox(tabGeneral, "Enable Movement Speed", false);

enabledMoveSpeed.OnChange = function(sender)
    Vars.MoveSpeed.SetEnabled(sender.Checked and 1 or 0);
end

local sliderMovSpeed = tabGeneral.AddSlider(tabGeneral, "Movement Speed", 1, 10, 0);

sliderMovSpeed.OnChange = function(sender)
    Vars.MoveSpeed.Set(sender.Value[1])
end


tabGeneral.AddSeparator(tabGeneral);


local enabledPlayerScale = tabGeneral.AddCheckbox(tabGeneral, "Enable Player Scale", false);

enabledPlayerScale.OnChange = function(sender)
    Vars.PlayerScale.SetEnabled(sender.Checked and 1 or 0);
end

local sliderPlayerScale = tabGeneral.AddSlider(tabGeneral, "Player Scale", 1, 10, 0);

sliderPlayerScale.OnChange = function(sender)
    Vars.PlayerScale.Set(sender.Value[1])
end

tabGeneral.AddSeparator(tabGeneral);

local sliderPlayerHealth = tabGeneral.AddSlider(tabGeneral, "Player Health", 100, 100, 1);
local inputGold = tabGeneral.AddInputInt(tabGeneral, "Gold", 0);

local checkRollCritic = tabGeneral.AddCheckbox(tabGeneral, "Perfect Rolls", false);

local checkGodMode = tabGeneral.AddCheckbox(tabGeneral, "God Mode", false);


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
    _D(Vars.MoveSpeed.Enabled())


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

