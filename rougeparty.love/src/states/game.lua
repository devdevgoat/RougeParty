state=require("lib.stateswitcher")
local Concord = require("lib").init({
    useEvents = false
})

local Component = require("src.components")
local System = require("src.systems")
local Entity = require("src.entities") --for reusable entities
local DynEnt = Concord.entity

--- Customize Below ---
-- Declare Instnace (Menu, Level, etc)
local Game = Concord.instance() --this world



-- Add Entities 
--Add the player
local Player = DynEnt() -- likely not needed, will have to create this on each new player dynamically
-- Assin Components
Player:give(Component.Position, 100,200)
    :give(Component.Sprite, "src/imgs/default.png" )
    :apply()

Game:addEntity(Player)
--Initialize Logic
Game:addSystem(System.PlayerManager(), "draw")





function love.update(dt)
end

function love.draw()
    Game:emit("draw")
end

function love.mousepressed(x,y,button,istouch)
    
end

function love.keyreleased(key)
    if(key == 'escape') then
     state.switch("main;2")
    end
end


function love.keyreleased(key)
    if(key == 'escape') then
     state.switch("src/states/main_menu")
    end
end