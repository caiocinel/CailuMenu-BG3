
local oMovementVars = {
    MovementAcceleration = 12.0,
    MovementSpeedDash = 6.0,
    MovementSpeedRun = 3.75,
    MovementSpeedSprint = 6.0,
    MovementSpeedWalk = 2.0,
    WorldClimbingSpeed = 6.0
}

Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "MovementMultiplier", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})

Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "PlayerHealthPercentage", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})

Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "SetGold", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})

if(Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier == nil) then
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier = 1;
end

if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage == nil) then
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage = 100;
end

if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").SetGold == nil) then
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").SetGold = -1;
end


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
    -- Osi.AddBoosts(GetHostCharacter(), "Ability(Strength, 10)", "", GetHostCharacter())
     
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(None, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(Attack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeWeaponAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedWeaponAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeSpellAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedSpellAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeUnarmedAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedUnarmedAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(SkillCheck, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(SavingThrow, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RawAbility, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(Damage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeOffHandWeaponAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedOffHandWeaponAttack, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(DeathSavingThrow, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeWeaponDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedWeaponDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeSpellDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedSpellDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(MeleeUnarmedDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(RangedUnarmedDamage, 20)", "", GetHostCharacter())
    Osi.AddBoosts(GetHostCharacter(), "MinimumRollResult(Sentinel, 20)", "", GetHostCharacter())



end)

local bVars = {
    MovementMultiplier = 1,
    HealthSetter = 100,
    PlayerHealthPercentage = 100
}

Ext.Events.Tick:Subscribe(function(object, event)

    if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier ~= bVars.MovementMultiplier) then
        for i, v in pairs(oMovementVars) do
            _C().ServerCharacter.Template[i] = oMovementVars[i] *
            Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier;
        end

        bVars.MovementMultiplier = Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier;      
    end


    if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage ~= bVars.PlayerHealthPercentage) then

        local playerHealthPercentage = Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage;

        Osi.SetHitpoints(GetHostCharacter(), Osi.GetMaxHitpoints(GetHostCharacter()) * (playerHealthPercentage / 100),
            "Guaranteed");
        bVars.PlayerHealthPercentage = playerHealthPercentage;
    end

    if(Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").SetGold ~= -1) then
    

        Osi.AddGold(GetHostCharacter(), Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").SetGold - Osi.GetGold(GetHostCharacter()));

        Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").SetGold = -1;
    end


end, { Once = false })



