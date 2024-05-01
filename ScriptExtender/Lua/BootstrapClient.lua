Ext.Require("Const.lua")
Ext.Require("Vars.lua")
Ext.Require("Widgets.lua")

local window = Ext.IMGUI.NewWindow("Cailu Menu 2", 600, 200);

local tabs = window.AddTabBar(window, "Tabs");

local tabGeneral = tabs.AddTabItem(tabs, "General");

ImGuiCheckbox(tabGeneral, "Enable Movement Speed", false, function(sender)
    Vars.MoveSpeed.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiSlider(tabGeneral, "Movement Speed", 1, 10, 0, function(sender)
    Vars.MoveSpeed.Set(sender.Value[1])
end);

ImGuiSeparator(tabGeneral);

ImGuiCheckbox(tabGeneral, "Enable Player Scale", false, function(sender)
    Vars.PlayerScale.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiSlider(tabGeneral, "Player Scale", 1, 10, 0, function(sender)
    Vars.PlayerScale.Set(sender.Value[1])
end);

ImGuiSeparator(tabGeneral);

ImGuiButton(tabGeneral, "Heal Player", function(sender)
    Vars.PlayerHeal.Toggle();
end);

ImGuiCheckbox(tabGeneral, "God Mode", false, function(sender)
    Vars.GodMode.SetEnabled(sender.Checked and 1 or 0);
end, function(sender) sender.SameLine = true end);

ImGuiSeparator(tabGeneral);

ImGuiInputInt(tabGeneral, "##Gold", 0, function(sender)
    Vars.Gold.Set(sender.Value[1]);
end);

ImGuiButton(tabGeneral, "Set Gold", function(sender)
    Vars.Gold.SetIsChanged();
end, function(sender) sender.SameLine = true end);

ImGuiButton(tabGeneral, "Max Inspiration Points ", function(sender)
    Vars.InspirationPoints.Toggle();
end);

ImGuiButton(tabGeneral, "Add Tadpoles", function(sender)
    Vars.Tadpole.Toggle();
end);


ImGuiSeparator(tabGeneral);

ImGuiCheckbox(tabGeneral, "Perfect Rolls", false, function(sender)
    Vars.PerfectRolls.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "Infinite Actions and Movement", false, function(sender)
    Vars.InfiniteActions.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "Unlimited Carry Capacity", false, function(sender)
    Vars.UnlimitedCarryCapacity.SetEnabled(sender.Checked and 1 or 0);
end, function(sender)
    ImGuiText(sender.Tooltip(sender), "Commonly incompatible with carrying capacity mods");
end);

ImGuiCheckbox(tabGeneral, "Max Stats", false, function(sender)
    Vars.MaxStats.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "One Hit Kill", false, function(sender)
    Vars.OneHitKill.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiButton(tabGeneral, "Level Up", function(sender)
    Vars.MaxLevel.Toggle();
end);

ImGuiButton(tabGeneral, "Change Class", function(sender)
    Vars.ChangeClass.Toggle();
end);

ImGuiButton(tabGeneral, "Change Appearance", function(sender)
    Vars.ChangeAppearance.Toggle();
end);

ImGuiButton(tabGeneral, "Enable Illithid", function(sender)
    Vars.EnableIllithid.Toggle()
end);

ImGuiButton(tabGeneral, "Disable Illithid", function(sender)
    Vars.DisableIllithid.Toggle()
end, function(sender) sender.SameLine = true end);

ImGuiButton(tabGeneral, "Gather Party", function(sender)
    Vars.GatherParty.Toggle();
end);

ImGuiCheckbox(tabGeneral, "Infinite Spell Slots", false, function(sender)
    Vars.MagicSlots.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiButton(tabGeneral, "Bring to Top", function(sender)
    Vars.BringToTop.Toggle();
end);

ImGuiCheckbox(tabGeneral, "Unlimited Jump Dist.", false, function(sender)
    Vars.UnlimitedJumpDistance.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "No Combats", false, function(sender)
    Vars.NoCombats.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiCheckbox(tabGeneral, "No Dialogs", false, function(sender)
    Vars.NoDialogs.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiInputText(tabGeneral, "", "", function(sender)
    Vars.AddItem.Set(sender.Value[1]);
end);

ImGuiButton(tabGeneral, "Add Item", function(sender)
    Vars.AddItem.SetIsChanged();
end, function(sender) sender.SameLine = true end);

ImGuiCheckbox(tabGeneral, "Invisibility", false, function(sender)
    Vars.Invisibility.SetEnabled(sender.Checked and 1 or 0);
end);














local tabGeneral = tabs.AddTabItem(tabs, "Maps");

ImGuiCheckbox(tabGeneral, "Remove Map Fog", false, function(sender)
    Vars.MapFog.SetEnabled(sender.Checked and 1 or 0);
end);

ImGuiButton(tabGeneral, "Unlock Waypoints", function(sender)
    Vars.UnlockWaypoints.Toggle();
    Vars.MapFog.SetEnabled(1);
end);

ImGuiButton(tabGeneral, "Lock Waypoints", function(sender)
    Vars.LockWaypoints.Toggle();
    Vars.MapFog.SetEnabled(0);
end);

ImGuiButton(tabGeneral, "Go to Camp", function(sender)
    Vars.GoToCamp.Toggle()
end, function(sender) ImGuiText(sender.Tooltip(sender), "Wither must be in your camp or this will bug") end);
