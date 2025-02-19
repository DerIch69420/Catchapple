-- main.lua
local love = require("love")

local player = require("src.player")

function love.load()
    love.window.setFullscreen(true)
end

function love.update(dt)
    if love.keyboard.isDown("a") then
        player:move(-1000, dt)
    elseif love.keyboard.isDown("d") then
        player:move(1000, dt)
    end
end

function love.draw()
    player:draw()
end
