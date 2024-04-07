Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "vPlayerHealth", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)

    -- local localPlayer = (Ext.Entity.Get(GetHostCharacter()));

    -- Ext.Stats.Get(GetHostCharacter(), "")

    for key, value in pairs(Ext.Stats) do
        print(key)
        
    end
    

    Osi.SetHitpoints(GetHostCharacter(), 100, "Guaranteed")

        
    -- Osi.CharacterSetHitpointsPercentage(GetHostCharacter(), 100, '1');
    

    

    -- Osi.SetHitpoints(GetHostCharacter(), 999, '1')

end)


Ext.Events.Tick:Subscribe(function(object, event)
    if Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth ~= nil then
        Osi.SetHitpoints(GetHostCharacter(),
            Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth, "Guaranteed")
    end
end, { Once = false })


