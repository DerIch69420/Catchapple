-- player.lua

local Player = {}

Player.x = 50
Player.y = 1000
Player.speed = 100

function Player:move(dx, dt)
	Player.x = Player.x + dx * dt
end

function Player:draw()
	love.graphics.rectangle("fill", Player.x, Player.y, 50, 50)
end

return Player
