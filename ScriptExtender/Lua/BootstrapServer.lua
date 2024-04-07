
local oMovementVars = {
    MovementAcceleration = 12.0,
    MovementSpeedDash = 6.0,
    MovementSpeedRun = 3.75,
    MovementSpeedSprint = 6.0,
    MovementSpeedWalk = 2.0
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

if(Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier == nil) then
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier = 1;
end

if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage == nil) then
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage = 100;
end


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
    -- Osi.SetHitpoints(GetHostCharacter(), 200, "Guaranteed")

    -- Ext.Dump(_C().ServerCharacter);

    print(_C().ServerCharacter.Invisible)
    _C().ServerCharacter.Invisible = true;
    -- print(_C().ServerCharacter.Template.MovementSpeedWalk)



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


end, { Once = false })



