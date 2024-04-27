Vars = {}

local var = {}

var.Teste = "ata";

var.MoveSpeed = {
    Enabled = 0,
    Value = 0,
    IsChanged = 0,
    OldValue = 0
}

var.PlayerScale = {
    Enabled = 0,
    Value = 0,
    OldValue = 0,
    IsChanged = 0
}

var.PlayerHealth = {
    Type = 0,
    IsChanged = 0
}

var.Gold = {
    IsChanged = 0,
    Value = 0
}

var.PerfectRolls = {
    Enabled = 0,
    IsChanged = 0
}

var.InfiniteActions = {
    Enabled = 0,
    IsChanged = 0
}

var.UnlimitedCarryCapacity = {
    Enabled = 0,
    IsChanged = 0
}

var.MaxStats = {
    Enabled = 0,
    IsChanged = 0
}

var.Tadpole = {
    IsChanged = 0,
    Value = 0
}

var.OneHitKill = {
    Enabled = 0,
    IsChanged = 0
}

Vars.Register = function(varName, defaultValue)
    Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", varName, {
        Server = true,
        Client = true,
        SyncToClient = true,
        SyncToServer = true,
        WriteableOnServer = true,
        WriteableOnClient = true
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

Vars.OneHitKill = {};

Vars.OneHitKill.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.OneHitKill.Enabled == 1;
end

Vars.OneHitKill.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.OneHitKill.Enabled = value;
    if (item.OneHitKill.Value ~= 0) then
        item.OneHitKill.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end


Vars.OneHitKill.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.OneHitKill.IsChanged == 1;
end

Vars.OneHitKill.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.OneHitKill.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.Tadpole = {};

Vars.Tadpole.Value = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    return item.Tadpole.Value;
end

Vars.Tadpole.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.Tadpole.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.Tadpole.Set = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return;
    end

    item.Tadpole.Value = value;

    Vars.Set("Vars", item);
end

Vars.Tadpole.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    return item.Tadpole.IsChanged == 1;
end

Vars.Tadpole.SetIsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return;
    end

    item.Tadpole.IsChanged = 1;
    Vars.Set("Vars", item);
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
    if(item.MoveSpeed.Value ~= 0) then
        item.MoveSpeed.IsChanged = 1;
    end
    
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

    return item.MoveSpeed.IsChanged == 1;
end

Vars.MoveSpeed.Updated = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.MoveSpeed.IsChanged = 0;
    Vars.Set("Vars", item);
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

Vars.PlayerScale = {};

Vars.PlayerScale.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.PlayerScale.Enabled == 1;
end

Vars.PlayerScale.Value = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    return item.PlayerScale.Value;
end

Vars.PlayerScale.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.PlayerScale.IsChanged == 1;
end

Vars.PlayerScale.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.PlayerScale.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.PlayerScale.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.PlayerScale.Enabled = value;
    if (item.PlayerScale.Value ~= 0) then
        item.PlayerScale.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end

Vars.PlayerScale.OldValue = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    return item.PlayerScale.OldValue;
end

Vars.PlayerScale.Set = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return;
    end

    item.PlayerScale.OldValue = item.PlayerScale.Value;
    item.PlayerScale.Value = value;
    item.PlayerScale.IsChanged = 1;
    Vars.Set("Vars", item);
end

Vars.PlayerHealth = {};

Vars.PlayerHealth.Type = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.PlayerHealth.Type;
end

Vars.PlayerHealth.IsChanged = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    return item.PlayerHealth.IsChanged == 1;
end

Vars.PlayerHealth.Updated = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.PlayerHealth.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.PlayerHealth.SetType = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.PlayerHealth.Type = value;
    item.PlayerHealth.IsChanged = 1;

    Vars.Set("Vars", item);
end

Vars.Gold = {};

Vars.Gold.Value = function ()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.Gold.Value;
end

Vars.Gold.Updated = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return false;
    end

    item.Gold.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.Gold.Set = function (value)
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.Gold.Value = value;

    Vars.Set("Vars", item);
end

Vars.Gold.IsChanged = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return 0;
    end

    return item.Gold.IsChanged == 1;
end

Vars.Gold.SetIsChanged = function()
    local item = Vars.GetAll();

    if(item == nil) then
        return;
    end

    item.Gold.IsChanged = 1;
    Vars.Set("Vars", item);
end


Vars.PerfectRolls = {};

Vars.PerfectRolls.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.PerfectRolls.Enabled == 1;
end

Vars.PerfectRolls.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.PerfectRolls.Enabled = value;
    if (item.PerfectRolls.Value ~= 0) then
        item.PerfectRolls.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end


Vars.PerfectRolls.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.PerfectRolls.IsChanged == 1;
end

Vars.PerfectRolls.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.PerfectRolls.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.InfiniteActions = {};

Vars.InfiniteActions.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.InfiniteActions.Enabled == 1;
end

Vars.InfiniteActions.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.InfiniteActions.Enabled = value;
    if (item.InfiniteActions.Value ~= 0) then
        item.InfiniteActions.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end


Vars.InfiniteActions.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.InfiniteActions.IsChanged == 1;
end

Vars.InfiniteActions.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.InfiniteActions.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.UnlimitedCarryCapacity = {};

Vars.UnlimitedCarryCapacity.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.UnlimitedCarryCapacity.Enabled == 1;
end

Vars.UnlimitedCarryCapacity.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.UnlimitedCarryCapacity.Enabled = value;
    if (item.UnlimitedCarryCapacity.Value ~= 0) then
        item.UnlimitedCarryCapacity.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end


Vars.UnlimitedCarryCapacity.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.UnlimitedCarryCapacity.IsChanged == 1;
end

Vars.UnlimitedCarryCapacity.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.UnlimitedCarryCapacity.IsChanged = 0;
    Vars.Set("Vars", item);
end

Vars.MaxStats = {};

Vars.MaxStats.Enabled = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.MaxStats.Enabled == 1;
end

Vars.MaxStats.SetEnabled = function(value)
    local item = Vars.GetAll();

    if (item == nil) then
        return 0;
    end

    item.MaxStats.Enabled = value;
    if (item.MaxStats.Value ~= 0) then
        item.MaxStats.IsChanged = 1;
    end

    Vars.Set("Vars", item);
end


Vars.MaxStats.IsChanged = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    return item.MaxStats.IsChanged == 1;
end

Vars.MaxStats.Updated = function()
    local item = Vars.GetAll();

    if (item == nil) then
        return false;
    end

    item.MaxStats.IsChanged = 0;
    Vars.Set("Vars", item);
end


Ext.Events.SessionLoading:Subscribe(function(object, event)
    Vars.Register("Vars", var);
end)
