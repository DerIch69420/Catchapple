local love = require("love")

local game = require("src.states")
local Player = require("src.player")
local player = Player.new()

local currentState = game.GameStates.Game

function love.load()
    love.window.setFullscreen(true)
end

function love.update(dt)
    if currentState == game.GameStates.Game then
        if love.keyboard.isDown("a") then
            player:move(-1000, dt)
        elseif love.keyboard.isDown("d") then
            player:move(1000, dt)
        end
    end
end

function love.draw()
    if currentState == game.GameStates.Game then
        player:draw()
    end
end

