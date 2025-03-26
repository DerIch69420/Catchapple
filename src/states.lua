local function enum(values)
    local e = {}
    for i, v in ipairs(values) do
        e[v] = i
    end
    return e
end

local GameStates = enum({
    "StartScreen",
    "Game",
    "Statistics"
})

return {
    GameStates = GameStates
}

