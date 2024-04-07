Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "vPlayerHealth", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})


Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function(caster, spell, _, _, _)
    print("UsingSpell")

    if (Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth == nil) then
        Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = 125;
    end

    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = Ext.Vars.GetModVariables(
    "787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth * 1.5;

    print(Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth)
end)


Ext.Events.Tick:Subscribe(function(object, event)
    if Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth ~= nil then

    end
end, { Once = false })
