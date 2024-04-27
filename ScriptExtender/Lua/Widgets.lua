function ImGuiCheckbox(parent, label, default, callback, --[[optional]] customProps)
    local item = parent.AddCheckbox(parent, label, default);
    item.OnChange = callback;

    if(customProps ~= nil) then
        customProps(item)
    end

    return item;
end

function ImGuiSlider(parent, label, min, max, default, callback, --[[optional]] customProps)
    local item = parent.AddSlider(parent, label, min, max, default);
    item.OnChange = callback;

    if (customProps ~= nil) then
        customProps(item)
    end

    return item;
end

function ImGuiSeparator(parent, --[[optional]] customProps)
    local item = parent.AddSeparator(parent);

    if (customProps ~= nil) then
        customProps(item)
    end

    return item;
end

function ImGuiButton(parent, label, callback, --[[optional]] customProps)
    local item = parent.AddButton(parent, label);
    item.OnClick = callback;

    if (customProps ~= nil) then
        customProps(item)
    end

    return item;
end

function ImGuiInputInt(parent, label, default, callback, --[[optional]] customProps)
    local item = parent.AddInputInt(parent, label, default);
    item.OnChange = callback;

    if (customProps ~= nil) then
        customProps(item)
    end

    return item;
end

function ImGuiText(parent, text, --[[optional]] customProps)
    local item = parent.AddText(parent, text);

    if (customProps ~= nil) then
        customProps(item)
    end

    return item;
end