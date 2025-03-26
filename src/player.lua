local Player = {}
Player.__index = Player

--- Create a new Player instance
function Player.new()
	local self = setmetatable({}, Player)

	self.speed = 300 -- Adjust speed for more controlled movement
	self.width = 100
	self.height = 50

	self.x = love.graphics.getWidth() / 2 - self.width / 2 -- Center horizontally
	self.y = love.graphics.getHeight()*2 - self.height - 10 -- Position at the bottom (10px from the bottom edge)
	return self
end

--- Draw the player on the screen
function Player:draw()
	love.graphics.setColor(1, 0, 0) -- Red color for player
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

--- Move the player within screen bounds
function Player:move(direction, dt)
	local dx = direction * self.speed * dt
	self.x = self.x + dx

	-- Keep player within bounds
	self.x = math.max(0, math.min(self.x, love.graphics.getWidth() - self.width))
end

return Player
