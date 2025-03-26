local love = require("love")

--- @class Player
--- @field x number
--- @field y number
--- @field speed number
--- @field width number
--- @field height number
local Player = {}
Player.__index = Player

--- Create a new Player instance
--- @return Player
function Player.new()
    local self = setmetatable({}, Player)
    self.x = 50
    self.y = 1000 -- love.graphics.getHeight()
    self.speed = 1
    self.width = 200
    self.height = 50
    return self
end

--- Draw the player on the screen
function Player:draw()
    love.graphics.setColor(1, 0, 0) -- Red
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

--- Move the player within screen bounds
--- @param dx number Movement direction (-1 for left, 1 for right)
--- @param dt number Delta time
function Player:move(dx, dt)
    self.x = self.x + dx * self.speed * dt

    -- Keep player within bounds
    self.x = math.max(0, math.min(self.x, love.graphics.getWidth() - self.width))
end

return Player

