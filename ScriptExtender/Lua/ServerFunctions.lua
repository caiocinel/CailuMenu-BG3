function EnableLucky()
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
end

function DisableLucky()
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(None, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(Attack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeWeaponAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedWeaponAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeSpellAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedSpellAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeUnarmedAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedUnarmedAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(SkillCheck, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(SavingThrow, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RawAbility, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(Damage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeOffHandWeaponAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedOffHandWeaponAttack, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(DeathSavingThrow, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeWeaponDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedWeaponDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeSpellDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedSpellDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(MeleeUnarmedDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(RangedUnarmedDamage, 20)", 0, "", GetHostCharacter())
    Osi.RemoveBoosts(GetHostCharacter(), "MinimumRollResult(Sentinel, 20)", 0, "", GetHostCharacter())    
end


function RemoveScaleMultiplier()
    for _, boostEntry in ipairs(Ext.Entity.Get(GetHostCharacter()).BoostsContainer.Boosts) do
        if boostEntry.Type == "ScaleMultiplier" then
            for _, b in pairs(boostEntry.Boosts) do
                for _, z in pairs(b.ScaleMultiplierBoost) do
                    Osi.RemoveBoosts(GetHostCharacter(), "ScaleMultiplier(" .. z .. ")", 0, "", GetHostCharacter())
                end
            end
        end
    end
end