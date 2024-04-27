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

    if((Vars.PlayerHealth.IsChanged()) or (Vars.PlayerHealth.Type() == 2)) then
        if(Vars.PlayerHealth.Type() == 1) then
            Osi.SetImmortal(GetHostCharacter(), 0);
            Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()), "Guaranteed");
        else
            Osi.SetImmortal(GetHostCharacter(), 1);
            Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()), "Guaranteed");
        end

        Vars.PlayerHealth.Updated();
    end



    if (Vars.Gold.IsChanged()) then
        Osi.AddGold(GetHostCharacter(), Vars.Gold.Value() - Osi.GetGold(GetHostCharacter()));
        Vars.Gold.Updated();
    end
    
    if(Vars.PerfectRolls.IsChanged()) then
        if(Vars.PerfectRolls.Enabled()) then
            EnableLucky()
        else
            DisableLucky()
        end

        Vars.PerfectRolls.Updated();
    end

    if (Vars.InfiniteActions.IsChanged()) then
        if (Vars.InfiniteActions.Enabled()) then
            Osi.AddBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", "", GetHostCharacter())
            Osi.AddBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", "", GetHostCharacter())
        else
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", 0, "", GetHostCharacter())
        end

        Vars.InfiniteActions.Updated();
    end

    if (Vars.UnlimitedCarryCapacity.IsChanged()) then
        if (Vars.UnlimitedCarryCapacity.Enabled()) then
            Osi.AddBoosts(GetHostCharacter(), "CarryCapacityMultiplier(1000)", "", GetHostCharacter())
        else
            Osi.RemoveBoosts(GetHostCharacter(), "CarryCapacityMultiplier(1000)", 0, "", GetHostCharacter())
        end

        Vars.UnlimitedCarryCapacity.Updated();
    end

    if (Vars.MaxStats.IsChanged()) then
        if(Vars.MaxStats.Enabled()) then
            for _, v in pairs(oStatsList) do
                Osi.AddBoosts(GetHostCharacter(),"Ability(" ..v ..", 99)", "", GetHostCharacter())
            end
        else
            for _, v in pairs(oStatsList) do
                Osi.RemoveBoosts(GetHostCharacter(), "Ability(" .. v .. ", 99)", 0, "", GetHostCharacter())
            end
        end


        Vars.MaxStats.Updated();
    end

    if (Vars.OneHitKill.IsChanged()) then
        if (Vars.OneHitKill.Enabled()) then
            Osi.AddBoosts(GetHostCharacter(), "DamageBonus(9999)", "", GetHostCharacter())
        else
            Osi.RemoveBoosts(GetHostCharacter(), "DamageBonus(9999)", 0, "", GetHostCharacter())
        end

        Vars.OneHitKill.Updated();
    end

    if(Vars.MapFog.IsChanged()) then
        if(Vars.MapFog.Enabled()) then
            Osi.ShroudRender(0)
        else
            Osi.ShroudRender(1)
        end

        Vars.MapFog.Updated();
    end

    if(Vars.UnlockWaypoints.IsChanged()) then
        UnlockWaypoints();
        Vars.UnlockWaypoints.Updated();
    end

    if (Vars.LockWaypoints.IsChanged()) then
        LockWaypoints();
        Vars.LockWaypoints.Updated();
    end

    if (Vars.InspirationPoints.IsChanged()) then
        Osi.GiveInspirationPoints(GetHostCharacter(), 4, "", "")
        Vars.LockWaypoints.Updated();
    end

    if (Vars.MaxLevel.IsChanged()) then
        Osi.AddExplorationExperience(GetHostCharacter(), 10000000)
        Vars.MaxLevel.Updated();
    end

end, { Once = false })



