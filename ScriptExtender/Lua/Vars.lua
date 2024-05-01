Vars = {}

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

Vars.UseCheckboxState = function (key)
    local variable = {
        Enabled = 0,
        IsChanged = 0
    }


    local functions = {};

    functions.Enabled = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        return item[key].Enabled == 1;
    end

    functions.SetEnabled = function(value)
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        item[key].Enabled = value;
        if (item[key].Value ~= 0) then
            item[key].IsChanged = 1;
        end

        Vars.Set("Vars", item);
    end


    functions.IsChanged = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        return item[key].IsChanged == 1;
    end

    functions.Updated = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        item[key].IsChanged = 0;
        Vars.Set("Vars", item);
    end

    return variable, functions;
end

Vars.UseButtonState = function(key)
    local variable = {
        IsChanged = 0
    }


    local functions = {};

    functions.Toggle = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        item[key].IsChanged = 1;
        Vars.Set("Vars", item);
    end


    functions.IsChanged = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        return item[key].IsChanged == 1;
    end

    functions.Updated = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        item[key].IsChanged = 0;
        Vars.Set("Vars", item);
    end

    return variable, functions
end

Vars.UseTextState = function(key)
    local variable = {
        IsChanged = 0,
        Value = 0
    }


    local functions = {};

    functions.Value = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        return item[key].Value;
    end

    functions.Updated = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        item[key].IsChanged = 0;
        Vars.Set("Vars", item);
    end

    functions.Set = function(value)
        local item = Vars.GetAll();

        if (item == nil) then
            return;
        end

        item[key].Value = value;

        Vars.Set("Vars", item);
    end

    functions.IsChanged = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        return item[key].IsChanged == 1;
    end

    functions.SetIsChanged = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return;
        end

        item[key].IsChanged = 1;
        Vars.Set("Vars", item);
    end

    return variable, functions
end

Vars.UseSliderState = function(key)
    local variable = {
        Enabled = 0,
        Value = 0,
        IsChanged = 0,
        OldValue = 0
    }


    local functions = {};

    functions.Enabled = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        return item[key].Enabled == 1;
    end

    functions.SetEnabled = function(value)
        local item = Vars.GetAll();

        if (item == nil) then
            return;
        end

        item[key].Enabled = value;
        if (item[key].Value ~= 0) then
            item[key].IsChanged = 1;
        end

        Vars.Set("Vars", item);
    end

    functions.Value = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        return item[key].Value;
    end

    functions.IsChanged = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        return item[key].IsChanged == 1;
    end

    functions.Updated = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return false;
        end

        item[key].IsChanged = 0;
        Vars.Set("Vars", item);
    end

    functions.OldValue = function()
        local item = Vars.GetAll();

        if (item == nil) then
            return 0;
        end

        return item[key].OldValue;
    end

    functions.Set = function(value)
        local item = Vars.GetAll();

        if (item == nil) then
            return;
        end

        item[key].OldValue = item[key].Value;
        item[key].Value = value;
        item[key].IsChanged = 1;

        Vars.Set("Vars", item);
    end

    return variable, functions
end

local var = {}


var.MoveSpeed, Vars.MoveSpeed = Vars.UseSliderState("MoveSpeed");
var.PlayerScale, Vars.PlayerScale = Vars.UseSliderState("PlayerScale");
var.Gold , Vars.Gold = Vars.UseTextState("Gold");
var.PerfectRolls, Vars.PerfectRolls = Vars.UseCheckboxState("PerfectRolls");
var.InfiniteActions, Vars.InfiniteActions = Vars.UseCheckboxState("InfiniteActions");
var.UnlimitedCarryCapacity, Vars.UnlimitedCarryCapacity = Vars.UseCheckboxState("UnlimitedCarryCapacity");
var.MaxStats, Vars.MaxStats = Vars.UseCheckboxState("MaxStats");
var.OneHitKill, Vars.OneHitKill = Vars.UseCheckboxState("OneHitKill");
var.MapFog, Vars.MapFog = Vars.UseCheckboxState("MapFog");
var.UnlockWaypoints, Vars.UnlockWaypoints = Vars.UseButtonState("UnlockWaypoints");
var.LockWaypoints, Vars.LockWaypoints = Vars.UseButtonState("LockWaypoints");
var.InspirationPoints, Vars.InspirationPoints = Vars.UseButtonState("InspirationPoints");
var.MaxLevel, Vars.MaxLevel = Vars.UseButtonState("MaxLevel");
var.ChangeClass, Vars.ChangeClass = Vars.UseButtonState("ChangeClass");
var.ChangeAppearance, Vars.ChangeAppearance = Vars.UseButtonState("ChangeAppearance");
var.Tadpole, Vars.Tadpole = Vars.UseButtonState("Tadpole");
var.GodMode, Vars.GodMode = Vars.UseCheckboxState("GodMode");
var.PlayerHeal, Vars.PlayerHeal = Vars.UseButtonState("PlayerHeal");
var.EnableIllithid , Vars.EnableIllithid = Vars.UseButtonState("EnableIllithid");
var.DisableIllithid, Vars.DisableIllithid = Vars.UseButtonState("DisableIllithid");
var.GoToCamp , Vars.GoToCamp = Vars.UseButtonState("GoToCamp");
var.GatherParty, Vars.GatherParty = Vars.UseButtonState("GatherParty");
var.MagicSlots, Vars.MagicSlots = Vars.UseCheckboxState("MagicSlots");
var.BringToTop, Vars.BringToTop = Vars.UseButtonState("BringToTop");
var.UnlimitedJumpDistance, Vars.UnlimitedJumpDistance = Vars.UseCheckboxState("UnlimitedJumpDistance");
var.NoCombats, Vars.NoCombats = Vars.UseCheckboxState("NoCombats");
var.NoDialogs, Vars.NoDialogs = Vars.UseCheckboxState("NoDialogs");
var.AddItem, Vars.AddItem = Vars.UseTextState("AddItem");
var.Invisibility, Vars.Invisibility = Vars.UseCheckboxState("Invisibility");

Ext.Events.SessionLoading:Subscribe(function(object, event)
    Vars.Register("Vars", var);
end)
