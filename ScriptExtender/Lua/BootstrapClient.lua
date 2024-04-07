Ext.Vars.RegisterModVariable("787ce468-859f-4e07-83e2-61c31139e1bc", "vPlayerHealth", {
    Server = true,
    Client = true,
    SyncToClient = true,
    WriteableOnServer = true,
    WriteableOnClient = true,
    SyncToServer = true
})

local window = Ext.IMGUI.NewWindow("Ignore", 600, 200);



local texto = window.AddText(window, "Teste");

local butao = window.AddButton(window, "Texto aleatório")

local varTeste = 0;

local slider = window.AddSlider(window, "Slider", varTeste, 100, 0);

butao.OnClick = function()    
    -- Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = 50
    print(slider.Value[1]);
    print("Clicou");
end

-- Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = slider.Value;




for key, value in pairs(slider.Value) do
    print(key)
end

print(slider.Value[1])

