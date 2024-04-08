Ext.Require("Utils.lua")
Ext.Require("Const.lua")

Utils.Vars.Register("MovementMultiplier", 1);
Utils.Vars.Register("PlayerHealthPercentage", 100);
Utils.Vars.Register("SetGold", -1);
Utils.Vars.Register("DiceRollsCritic", 0);
Utils.Vars.Register("Stats", {
    Strength = -1,
    Dexterity = -1,
    Constitution = -1,
    Intelligence = -1,
    Wisdom = -1,
    Charisma = -1,
    Sentinel = -1
});

local window = Ext.IMGUI.NewWindow("Cailu Menu 2", 600, 200);

local sliderMovSpeed = window.AddSlider(window, "Movement Speed", 1, 10, 0);
local sliderPlayerHealth = window.AddSlider(window, "PlayerHealth", 100, 100, 1);
local inputGold = window.AddSlider(window, "Gold", -1, 1000000, 0);
local checkRollCritic = window.AddCheckbox(window, "Perfect Rolls", false);


window.AddText(window, "---------------------------------------------------------"); -- I miss ImGui::Separator :/


local oStatsWidgets = {}

for key, value in pairs(oStatsList) do
    oStatsWidgets[value] = window.AddSlider(window, value, -1, 30, -30);
end




local bVars = {
    MovementMultiplier = 1,
    HealthSetter = 100,
    PlayerHealthPercentage = 100,
    SetGold = -1,
    DiceRollsCritic = 0,
    Stats = {
        Strength = -1,
        Dexterity = -1,
        Constitution = -1,
        Intelligence = -1,
        Wisdom = -1,
        Charisma = -1,
        Sentinel = -1
    }
}

Ext.Events.Tick:Subscribe(function(object, event)

    if (sliderMovSpeed.Value[1] ~= bVars.MovementMultiplier) then
        bVars.MovementMultiplier = sliderMovSpeed.Value[1];
        Utils.Vars.Set("MovementMultiplier",bVars.MovementMultiplier);
    end

    if (sliderPlayerHealth.Value[1] ~= bVars.PlayerHealthPercentage) then
        bVars.PlayerHealthPercentage = sliderPlayerHealth.Value[1];
        Utils.Vars.Set("PlayerHealthPercentage", bVars.PlayerHealthPercentage);
    end

    if (inputGold.Value[1] ~= bVars.SetGold) then
        bVars.inputGold = inputGold.Value[1];
        Utils.Vars.Set("SetGold", bVars.inputGold);
    end

    if (checkRollCritic.Checked ~= bVars.DiceRollsCritic) then
        bVars.DiceRollsCritic = checkRollCritic.Checked and 1 or 0;
        Utils.Vars.Set("DiceRollsCritic", bVars.DiceRollsCritic);
    end

    for key, value in pairs(oStatsList) do
        if (oStatsWidgets[value].Value[1] ~= bVars.Stats[value]) then
            bVars.Stats[value] = oStatsWidgets[value].Value[1];
            local originalStats = Utils.Vars.Get("Stats");


            if(originalStats == nil) then
                originalStats = {
                    Strength = -1,
                    Dexterity = -1,
                    Constitution = -1,
                    Intelligence = -1,
                    Wisdom = -1,
                    Charisma = -1,
                    Sentinel = -1
                };
            end


            originalStats[value] = bVars.Stats[value];
            Utils.Vars.Set("Stats", originalStats);
        end
    end






end, { Once = false })
