local love = require("love")

local game = require("src.states")
local Player = require("src.player")
local player = Player.new()

local currentState = game.GameStates.StartScreen
local lastState = nil

function love.load()
    love.window.setFullscreen(true)
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)  -- Dark gray background
end

function love.update(dt)
    -- Handle state transitions
    if currentState == game.GameStates.Game then
        if love.keyboard.isDown("a") then
            player:move(-1, dt)
        elseif love.keyboard.isDown("d") then
            player:move(1, dt)
        end

        if love.keyboard.isDown("escape") then
            lastState = currentState
            currentState = game.GameStates.StartScreen
        end
    elseif currentState == game.GameStates.StartScreen then
        -- Example transition to the game state (for testing purposes)
        if love.keyboard.isDown("space") then
            lastState = currentState
            currentState = game.GameStates.Game
        end
    elseif currentState == game.GameStates.Statistics then
        -- Example transition to statistics (for testing purposes)
        if love.keyboard.isDown("escape") then
            currentState = lastState
        end
    end
end

function love.draw()
    if currentState == game.GameStates.Game then
        player:draw()
    elseif currentState == game.GameStates.StartScreen then
        love.graphics.setColor(1, 1, 1) -- White text
        love.graphics.printf("Press SPACE to start", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
    elseif currentState == game.GameStates.Statistics then
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Game Stats", 0, 100, love.graphics.getWidth(), "center")
    end
end

