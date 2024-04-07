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

local slider = window.AddSlider(window, "Slider", 25, 100, 0);

butao.OnClick = function()    
    Ext.Vars.GetModVariables("787ce468-859f-4e07-83e2-61c31139e1bc").vPlayerHealth = 50
    print("Clicou");
end



-- for key, value in pairs(Ext.Vars.GetModVariables("CailuMenu")) do
--     print(key)
-- end
