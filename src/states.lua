local enum = require("src.enum")

local States = {}

States.GameStates = enum({
    "StartScreen",
    "Game",
    "Statistics"
})

return States
