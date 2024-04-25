Ext.Require("Const.lua")
Ext.Require("Vars.lua")
Ext.Require("ServerFunctions.lua")

Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
        
end)


Ext.Events.Tick:Subscribe(function(object, event)
    
    
    if((Vars.CanLoop == nil) or (not Vars.CanLoop())) then
        return
    end

    -- _D(Vars.GetAll())


    if (Vars.MoveSpeed.IsChanged()) then

        if(Vars.MoveSpeed.Enabled()) then
            for i, v in pairs(oMovementVars) do
                _C().ServerCharacter.Template[i] = oMovementVars[i] * Vars.MoveSpeed.Value();
            end
        else
            for i, v in pairs(oMovementVars) do
                _C().ServerCharacter.Template[i] = oMovementVars[i];
            end
        end

        Vars.MoveSpeed.Updated();
    end

    if (Vars.PlayerScale.IsChanged()) then
        if(not Vars.PlayerScale.Enabled()) then
            RemoveScaleMultiplier()
        else
            RemoveScaleMultiplier()
            Osi.AddBoosts(GetHostCharacter(), "ScaleMultiplier(" .. Vars.PlayerScale.Value() .. ")", "", GetHostCharacter())
        end
    
        Vars.PlayerScale.Updated();
    end


    -- if (Vars.Get("PlayerHealthPercentage") ~= nil and Vars.Get("PlayerHealthPercentage") ~= bVars.PlayerHealthPercentage) then

    --     local newHP = Osi.GetMaxHitpoints(GetHostCharacter()) * (Vars.Get("PlayerHealthPercentage") / 100);
    --     Osi.SetHitpoints(GetHostCharacter(), newHP, "Guaranteed");
    --     bVars.PlayerHealthPercentage = Vars.Get("PlayerHealthPercentage");
    -- end
    
    -- if (Vars.Get("SetGold") ~= nil and Vars.Get("SetGold") ~= -1) then
    --     Osi.AddGold(GetHostCharacter(), Vars.Get("SetGold") - Osi.GetGold(GetHostCharacter()));
    --     Vars.Set("SetGold", -1);
    -- end

    -- if (Vars.Get("DiceRollsCritic") ~= nil and Vars.Get("DiceRollsCritic") ~= bVars.DiceRollsCritic) then
    --     bVars.DiceRollsCritic = Vars.Get("DiceRollsCritic");

    --     if(bVars.DiceRollsCritic == 1) then
    --         EnableLucky()
    --     else
    --         DisableLucky()
    --     end
    -- end

    -- if (Vars.Get("GodMode") ~= nil and Vars.Get("GodMode") ~= bVars.GodMode) then
    --     bVars.GodMode = Vars.Get("GodMode");

    --     if(bVars.GodMode == 1) then
    --         Osi.AddBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", "", GetHostCharacter())
    --         Osi.AddBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", "", GetHostCharacter())
    --         Osi.AddBoosts(GetHostCharacter(), "DamageBonus(999)", "", GetHostCharacter())
    --         Osi.AddBoosts(GetHostCharacter(), "CarryCapacityMultiplier(10)", "", GetHostCharacter())
    --     else
    --         Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", 0, "", GetHostCharacter())
    --         Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", 0, "", GetHostCharacter())
    --         Osi.RemoveBoosts(GetHostCharacter(), "DamageBonus(999)", 0, "", GetHostCharacter())
    --         Osi.RemoveBoosts(GetHostCharacter(), "CarryCapacityMultiplier(10)", 0, "", GetHostCharacter())
    --     end

    --     Osi.SetImmortal(GetHostCharacter(), bVars.GodMode);
    -- end

    -- if(bVars.GodMode == 1) then
    --     -- print("ATa");
    --     Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()), "Guaranteed");
    -- end

    -- if Vars.Get("Stats") ~= nil then

    --     for i, v in pairs(Vars.Get("Stats")) do            
    --         if(v ~= -1) then
    --             Osi.AddBoosts(GetHostCharacter(),
    --                 "Ability(" ..
    --                 i ..
    --                 ", " .. tostring(Ext.Math.Trunc(v - _C().Stats.Abilities[oStatsListIndex[i]])):gsub(".0", "") .. ")",
    --                 "", GetHostCharacter())
    --         end
    --     end

    --     Vars.Set("Stats", nil)        
    -- end

end, { Once = false })



