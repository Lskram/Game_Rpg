local player=require("scripts.player")
local newEnemy = require("scripts.enyme")
local enemies = {}
local sti=require "libs.sti"

function love.load()
    map=sti("Maps/map.lua")
    player.load()
    table.insert(enemies, newEnemy(100, 100))
    table.insert(enemies, newEnemy(200, 150))
    table.insert(enemies, newEnemy(300, 200))
end

function love.update(dt)
    player.update(dt)
    for _, enemy in ipairs(enemies) do
        enemy.update(dt)
    end
end

function love.draw()
    map:draw()
    player.draw()
    for _, enemy in ipairs(enemies) do
        enemy.draw()
    end
end
        