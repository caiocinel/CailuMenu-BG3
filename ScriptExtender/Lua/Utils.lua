Utils = {}

Utils.Vars = {}

Utils.Vars.Register = function(varName, defaultValue)
    Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", varName, {
        Server = true,
        Client = true,
        SyncToClient = true,
        SyncToServer = true,
        WriteableOnServer = true,
        WriteableOnClient = true
    })

    if(Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName] ~= nil) then
        Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName] = defaultValue;
    end
end

Utils.Vars.Get = function(varName)
    return Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName]
end

Utils.Vars.Set = function(varName, value)
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName] = value
end