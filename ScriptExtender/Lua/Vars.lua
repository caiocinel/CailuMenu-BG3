Vars = {}

var = {}

var.Teste = "ata";

var.MoveSpeed = {
    Enabled = 0,
    Value = 0,
    IsChanged = 0,
    OldValue = 0
}

var.PlayerHealth = {
    Enabled = 0,
    Value = 0,
    OldValue = 0,
    IsChanged = 0
}

var.PlayerScale = {
    Enabled = 0,
    Value = 0,
    OldValue = 0,
    IsChanged = 0
}

var.SetGold = {
    Enabled = 0,
    Value = 0,
    OldValue = 0,
    IsChanged = 0
}

var.DiceRollsCritic = {
    Enabled = 0,
    Value = 0,
    OldValue = 0,
    IsChanged = 0
}

var.GodMode = {
    Enabled = 0,
    Value = 0,
    OldValue = 0
}

var.Stats = {
    Enabled = 0,
    Value = {
        Strength = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        },
        Dexterity = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        },
        Constitution = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        },
        Intelligence = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        },
        Wisdom = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        },
        Charisma = {
            Enabled = 0,
            Value = 0,
            OldValue = 0
        }
    },
}

Vars.Register = function(varName, defaultValue)
    Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", varName, {
        Server = true,
        Client = true,
        SyncToClient = true,
        SyncToServer = true,
        WriteableOnServer = true,
        WriteableOnClient = true,
        SyncOnWrite = true
    })


    if (not Ext.Mod.IsModLoaded("787ce468-859f-4e07-83e2-61c31139e1bc")) then
        return;
    end

    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName] = defaultValue;
end

Vars.Get = function(varName)
    return Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName]
end

Vars.Set = function(varName, value)
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")[varName] = value
end

Vars.GetAll = function()
    return Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc")['Vars'];
end

Vars.CanLoop = function()
    if (not Ext.Mod.IsModLoaded("787ce468-859f-4e07-83e2-61c31139e1bc")) then
        return false;
    end

    if (Vars.GetAll() == nil) then
        return false;
    end

    return true;
end

Vars.MoveSpeed = {};

Vars.MoveSpeed.Enabled = function ()
    local item = Vars.GetAll();    

    if(item == nil) then
        return false;
    end

    return item.MoveSpeed.Enabled == 1;
end

Vars.MoveSpeed.SetEnabled = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.MoveSpeed.Enabled = value;
    item.MoveSpeed.IsChanged = 1;
    
    Vars.Set("Vars", item);
end

Vars.MoveSpeed.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.MoveSpeed.Value;
end

Vars.MoveSpeed.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.MoveSpeed.IsChanged;
end

Vars.MoveSpeed.Updated = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.MoveSpeed.IsChanged = 0;
end

Vars.MoveSpeed.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.MoveSpeed.OldValue;
end

Vars.MoveSpeed.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.MoveSpeed.OldValue = item.MoveSpeed.Value;
    item.MoveSpeed.Value = value;
    item.MoveSpeed.IsChanged = 1;

    Vars.Set("Vars", item);
end

Vars.PlayerHealth = {};

Vars.PlayerHealth.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.PlayerHealth.Enabled;
end

Vars.PlayerHealth.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.PlayerHealth.Value;
end

Vars.PlayerHealth.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.PlayerHealth.IsChanged;
end

Vars.PlayerHealth.Updated = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.PlayerHealth.IsChanged = 0;
end

Vars.PlayerHealth.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.PlayerHealth.OldValue;
end

Vars.PlayerHealth.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.PlayerHealth.OldValue = item.PlayerHealth.Value;
    item.PlayerHealth.Value = value;
    item.PlayerHealth.IsChanged = 1;
    Vars.Set("Vars", item);
end

Vars.PlayerScale = {};

Vars.PlayerScale.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.PlayerScale.Enabled;
end

Vars.PlayerScale.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.PlayerScale.Value;
end

Vars.PlayerScale.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.PlayerScale.IsChanged;
end

Vars.PlayerScale.Updated = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.PlayerScale.IsChanged = 0;
end

Vars.PlayerScale.SetEnabled = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    item.PlayerScale.Enabled = value;
    item.PlayerScale.IsChanged = 1;

end

Vars.PlayerScale.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.PlayerScale.OldValue;
end

Vars.PlayerScale.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.PlayerScale.OldValue = item.PlayerScale.Value;
    item.PlayerScale.Value = value;
    item.PlayerScale.IsChanged = 1;
    Vars.Set("Vars", item);
end

Vars.SetGold = {};

Vars.SetGold.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.SetGold.Enabled;
end

Vars.SetGold.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.SetGold.Value;
end

Vars.SetGold.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.SetGold.IsChanged;
end

Vars.SetGold.Updated = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.SetGold.IsChanged = 0;
end

Vars.SetGold.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.SetGold.OldValue;
end

Vars.SetGold.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.SetGold.OldValue = item.SetGold.Value;
    item.SetGold.Value = value;
    item.SetGold.IsChanged = 1;
    Vars.Set("Vars", item);
end

Vars.DiceRollsCritic = {};

Vars.DiceRollsCritic.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.DiceRollsCritic.Enabled;
end

Vars.DiceRollsCritic.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.DiceRollsCritic.Value;
end

Vars.DiceRollsCritic.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.DiceRollsCritic.IsChanged;
end

Vars.DiceRollsCritic.Updated = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.DiceRollsCritic.IsChanged = 0;
end

Vars.DiceRollsCritic.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.DiceRollsCritic.OldValue;
end

Vars.DiceRollsCritic.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.DiceRollsCritic.OldValue = item.DiceRollsCritic.Value;
    item.DiceRollsCritic.Value = value;
    item.DiceRollsCritic.IsChanged = 1;
    Vars.Set("Vars", item);
end

Vars.GodMode = {};

Vars.GodMode.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.GodMode.Enabled;
end

Vars.GodMode.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.GodMode.Value;
end

Vars.GodMode.OldValue = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.GodMode.OldValue;
end

Vars.GodMode.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.GodMode.OldValue = item.GodMode.Value;
    item.GodMode.Value = value;
    Vars.Set("Vars", item);
end

Vars.Stats = {};

Vars.Stats.Enabled = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.Stats.Enabled;
end

Vars.Stats.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.Stats.Value;
end

Vars.Stats.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.Stats.IsChanged;
end

Vars.Stats.Updated = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.Stats.IsChanged = 0;
end

Vars.Stats.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.Stats.Value = value;
    item.Stats.IsChanged = 1;
    Vars.Set("Vars", item);
end
