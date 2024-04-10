Ext.Require("Const.lua")
Ext.Require("Utils.lua")
Ext.Require("ServerFunctions.lua")

Utils.Vars.Register("MovementMultiplier", 1);
Utils.Vars.Register("PlayerHealthPercentage", 100);
Utils.Vars.Register("PlayerScale", -1);
Utils.Vars.Register("SetGold", -1);
Utils.Vars.Register("DiceRollsCritic", 0);
Utils.Vars.Register("GodMode", 0);
Utils.Vars.Register("Stats", {
    Strength = -1,
    Dexterity = -1,
    Constitution = -1,
    Intelligence = -1,
    Wisdom = -1,
    Charisma = -1,
});


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
    

end)

local bVars = {
    MovementMultiplier = 1,
    HealthSetter = 100,
    PlayerHealthPercentage = 100,
    DiceRollsCritic = 0,
    PlayerScale = -1,
    GodMode = 0
}

Ext.Events.Tick:Subscribe(function(object, event)

    if (Utils.Vars.Get("MovementMultiplier") ~= nil and Utils.Vars.Get("MovementMultiplier") ~= bVars.MovementMultiplier) then
        for i, v in pairs(oMovementVars) do
            _C().ServerCharacter.Template[i] = oMovementVars[i] * Utils.Vars.Get("MovementMultiplier");
        end

        bVars.MovementMultiplier = Utils.Vars.Get("MovementMultiplier");
    end


    if (Utils.Vars.Get("PlayerHealthPercentage") ~= nil and Utils.Vars.Get("PlayerHealthPercentage") ~= bVars.PlayerHealthPercentage) then

        local newHP = Osi.GetMaxHitpoints(GetHostCharacter()) * (Utils.Vars.Get("PlayerHealthPercentage") / 100);
        Osi.SetHitpoints(GetHostCharacter(), newHP, "Guaranteed");
        bVars.PlayerHealthPercentage = Utils.Vars.Get("PlayerHealthPercentage");
    end
    
    if (Utils.Vars.Get("SetGold") ~= nil and Utils.Vars.Get("SetGold") ~= -1) then
        Osi.AddGold(GetHostCharacter(), Utils.Vars.Get("SetGold") - Osi.GetGold(GetHostCharacter()));
        Utils.Vars.Set("SetGold", -1);
    end

    if (Utils.Vars.Get("DiceRollsCritic") ~= nil and Utils.Vars.Get("DiceRollsCritic") ~= bVars.DiceRollsCritic) then
        bVars.DiceRollsCritic = Utils.Vars.Get("DiceRollsCritic");

        if(bVars.DiceRollsCritic == 1) then
            EnableLucky()
        else
            DisableLucky()
        end
    end

    if (Utils.Vars.Get("GodMode") ~= nil and Utils.Vars.Get("GodMode") ~= bVars.GodMode) then
        bVars.GodMode = Utils.Vars.Get("GodMode");

        if(bVars.GodMode == 1) then
            Osi.AddBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", "", GetHostCharacter())
            Osi.AddBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", "", GetHostCharacter())
            Osi.AddBoosts(GetHostCharacter(), "DamageBonus(999)", "", GetHostCharacter())
            Osi.AddBoosts(GetHostCharacter(), "CarryCapacityMultiplier(10)", "", GetHostCharacter())
        else
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "DamageBonus(999)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "CarryCapacityMultiplier(10)", 0, "", GetHostCharacter())
        end

        Osi.SetImmortal(GetHostCharacter(), bVars.GodMode);
    end

    if(bVars.GodMode == 1) then
        -- print("ATa");
        Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()), "Guaranteed");
    end

    if Utils.Vars.Get("Stats") ~= nil then

        for i, v in pairs(Utils.Vars.Get("Stats")) do            
            if(v ~= -1) then
                Osi.AddBoosts(GetHostCharacter(),
                    "Ability(" ..
                    i ..
                    ", " .. tostring(Ext.Math.Trunc(v - _C().Stats.Abilities[oStatsListIndex[i]])):gsub(".0", "") .. ")",
                    "", GetHostCharacter())
            end
        end

        Utils.Vars.Set("Stats", nil)        
    end

    if (Utils.Vars.Get("PlayerScale") ~= nil and Utils.Vars.Get("PlayerScale") ~= bVars.PlayerScale and Utils.Vars.Get("PlayerScale") ~= 1 or (bVars.PlayerScale == -1 and Utils.Vars.Get("PlayerScale") ~= 1)) then

        if(bVars.PlayerScale ~= -1) then
            Osi.RemoveBoosts(GetHostCharacter(), "ScaleMultiplier(" .. bVars.PlayerScale .. ")", 0, "", GetHostCharacter())
        end

        bVars.PlayerScale = Utils.Vars.Get("PlayerScale");        
        
        if (bVars.PlayerScale ~= -1 and bVars.PlayerScale ~= nil) then
            Osi.AddBoosts(GetHostCharacter(), "ScaleMultiplier(" .. bVars.PlayerScale .. ")", "", GetHostCharacter())
        end
        
    end


end, { Once = false })



