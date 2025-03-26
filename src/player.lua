local love = require("love")

local Player = {}
Player.__index = Player

--- Create a new Player instance
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
function Player:move(dx, dt)
    self.x = self.x + dx * self.speed * dt

    -- Keep player within bounds
    self.x = math.max(0, math.min(self.x, love.graphics.getWidth() - self.width))
end

return Player

