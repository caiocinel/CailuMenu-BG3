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

local window = Ext.IMGUI.NewWindow("Ignore", 600, 200);

local butao = window.AddButton(window, "Texto aleatório")
butao.OnClick = function()    
    
    print(slider.Value[1]);
    print("Clicou");
end

-- Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = slider.Value;



local sliderMovSpeed = window.AddSlider(window, "Movement Speed", 1, 10, 0);
local sliderPlayerHealth = window.AddSlider(window, "PlayerHealth", 100, 100, 1);


local bVars = {
    MovementMultiplier = 1,
    HealthSetter = 100,
    PlayerHealthPercentage = 100
}

Ext.Events.Tick:Subscribe(function(object, event)

    if (sliderMovSpeed.Value[1] ~= bVars.MovementMultiplier) then
        bVars.MovementMultiplier = sliderMovSpeed.Value[1];
        Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").MovementMultiplier = bVars.MovementMultiplier;
    end

    if (sliderPlayerHealth.Value[1] ~= bVars.PlayerHealthPercentage) then
        bVars.PlayerHealthPercentage = sliderPlayerHealth.Value[1];
        Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").PlayerHealthPercentage = bVars.PlayerHealthPercentage;
    end




end, { Once = false })
