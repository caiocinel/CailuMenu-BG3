Ext.Require("Const.lua")
Ext.Require("Vars.lua")
Ext.Require("ServerFunctions.lua")

Ext.Osiris.RegisterListener("UsingSpell", 5, "after", function(caster, spell, _, _, _)
    if(Vars.MagicSlots.Enabled()) then
        Osi.RestoreParty(GetHostCharacter())
    end
end)


Ext.Events.Tick:Subscribe(function(object, event)
    
    
    if ((Vars.CanLoop == nil) or (not Vars.CanLoop()) or (GetHostCharacter() == nil)) then
        return
    end

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

    if(Vars.PlayerHeal.IsChanged()) then
        Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()), "Guaranteed");
        Vars.PlayerHeal.Updated();
    end

    if (Vars.GodMode.IsChanged()) then
        if (Vars.GodMode.Enabled()) then
            Osi.SetImmortal(GetHostCharacter(), 1);
            Osi.ApplyStatus(GetHostCharacter(), "FREEDOM_OF_MOVEMENT", -1, 1)
            Osi.ApplyStatus(GetHostCharacter(), "INVULNERABLE", -1, 1)
        else
            Osi.SetImmortal(GetHostCharacter(), 0);
            Osi.RemoveStatus(GetHostCharacter(), "FREEDOM_OF_MOVEMENT")
            Osi.RemoveStatus(GetHostCharacter(), "INVULNERABLE")
        end

        Vars.GodMode.Updated();
    end

    if (Vars.Gold.IsChanged()) then
        Osi.AddGold(GetHostCharacter(), Vars.Gold.Value() - Osi.GetGold(GetHostCharacter()));
        Vars.Gold.Updated();
    end

    if (Vars.Tadpole.IsChanged()) then
        Osi.AddTadpole(GetHostCharacter(), 5)
        Vars.Tadpole.Updated();
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
            Osi.AddBoosts(GetHostCharacter(), "ActionResource(BonusActionPoint, 9999, 0)", "", GetHostCharacter())
        else
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(Movement, 9999, 0)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(ActionPoint, 9999, 0)", 0, "", GetHostCharacter())
            Osi.RemoveBoosts(GetHostCharacter(), "ActionResource(BonusActionPoint, 9999, 0)", 0, "", GetHostCharacter())
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
        Vars.InspirationPoints.Updated();
    end

    if (Vars.MaxLevel.IsChanged()) then
        Osi.AddExplorationExperience(GetHostCharacter(), 10000000)
        Vars.MaxLevel.Updated();
    end

    if (Vars.ChangeClass.IsChanged()) then        
        Osi.StartRespec(GetHostCharacter())
        Vars.ChangeClass.Updated();
    end

    if (Vars.ChangeAppearance.IsChanged()) then
        Osi.StartChangeAppearance(GetHostCharacter())
        Vars.ChangeAppearance.Updated();
    end

    if (Vars.EnableIllithid.IsChanged()) then
        Osi.SetTadpoleTreeState(GetHostCharacter(), 2)
        Vars.EnableIllithid.Updated();
    end

    if (Vars.DisableIllithid.IsChanged()) then
        Osi.SetTadpoleTreeState(GetHostCharacter(), 1)
        Vars.DisableIllithid.Updated();
    end

    if (Vars.GoToCamp.IsChanged()) then
        Osi.ShroudRender(1)
        Osi.TeleportTo(Osi.GetHostCharacter(), "0133f2ad-e121-4590-b5f0-a79413919805")
        Vars.GoToCamp.Updated();
    end

    if (Vars.GatherParty.IsChanged()) then
        Osi.TeleportTo("3ed74f06-3c60-42dc-83f6-f034cb47c679", GetHostCharacter())
        Osi.TeleportTo("58a69333-40bf-8358-1d17-fff240d7fb12", GetHostCharacter())
        Osi.TeleportTo("2c76687d-93a2-477b-8b18-8a14b549304c", GetHostCharacter())
        Osi.TeleportTo("25721313-0c15-4935-8176-9f134385451b", GetHostCharacter())
        Osi.TeleportTo("ad9af97d-75da-406a-ae13-7071c563f604", GetHostCharacter())
        Osi.TeleportTo("c7c13742-bacd-460a-8f65-f864fe41f255", GetHostCharacter())
        Osi.TeleportTo("c774d764-4a17-48dc-b470-32ace9ce447d", GetHostCharacter())
        Osi.TeleportTo("7628bc0e-52b8-42a7-856a-13a6fd413323", GetHostCharacter())
        Osi.TeleportTo("91b6b200-7d00-4d62-8dc9-99e8339dfa1a", GetHostCharacter())
        Osi.TeleportTo("0de603c5-42e2-4811-9dad-f652de080eba", GetHostCharacter())
        Vars.GatherParty.Updated();
    end

    if (Vars.MagicSlots.IsChanged()) then
        Osi.RestoreParty(GetHostCharacter())
        Vars.MagicSlots.Updated();
    end

    if (Vars.BringToTop.IsChanged()) then
        local clone_x, clone_y, clone_z = Osi.GetPosition(GetHostCharacter())
        Osi.TeleportToPosition(GetHostCharacter(), clone_x, clone_y, clone_z, 'CailUMenu', 0, 0, 0, 1, 1);



        Vars.BringToTop.Updated();
    end

end, { Once = false })

