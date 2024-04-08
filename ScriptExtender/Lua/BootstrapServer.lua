Ext.Require("Const.lua")
Ext.Require("Utils.lua")
Ext.Require("ServerFunctions.lua")



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


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
    Osi.AddBoosts(GetHostCharacter(), "Ability(Strength, -15)", "", GetHostCharacter())
end)

local bVars = {
    MovementMultiplier = 1,
    HealthSetter = 100,
    PlayerHealthPercentage = 100,
    DiceRollsCritic = 0,
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

    if Utils.Vars.Get("Stats") ~= nil then


        
        _D(_C().Stats.AbilityModifiers)


        for key, value in pairs(_C().Stats) do
             print(key)          
        end

        for i, v in pairs(Utils.Vars.Get("Stats")) do            
            if(v ~= -1) then
                Osi.AddBoosts(GetHostCharacter(), "Attribute("..i..", "..v..")", "", GetHostCharacter())                
            end
        end

        Utils.Vars.Set("Stats", nil)

        
    end


end, { Once = false })



