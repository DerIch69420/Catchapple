local function enum(values)
    local e = {}
    for i, v in ipairs(values) do
        e[v] = i
    end
    return e
end

return enum

