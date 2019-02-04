state=require("lib.stateswitcher")
state.clear()
bump = require 'lib.bump'
world = bump.newWorld(64)



print('loading game...')
local transform = love.math.newTransform()
local Concord = require("lib").init({
    useEvents = true
})

Component = require("src.components")
System = require("src.systems")
Entity = require("src.entities") --for reusable entities
DynEnt = Concord.entity

--- Customize Below ---
-- Declare Instnace (Menu, Level, etc)
Game = Concord.instance() --this world

Keys = {}

Game:addSystem(System.CameraController(), "update")
Game:addSystem(System.CameraController(), "draw")
Game:addSystem(System.LevelManager(), "draw")
Game:addSystem(System.PlayerManager(), "draw")
Game:addSystem(System.PlayerManager(), "update")
Game:addSystem(System.PlayerController(), "update")
Game:addSystem(System.PlayerController(), "keypressed")
Game:addSystem(System.PlayerController(), "mousepressed")
-- Game:addSystem(System.ProjectileController(), "update")
-- Game:addSystem(System.ProjectileController(), "draw")
Game:addSystem(System.Gravity(), "update")







function instantiatePlayer(x,y,sprite_file_name)
    local p
    --Add the player
    p = DynEnt() -- need a way to add this dynamically... a spawn sytem?
    -- Assin Components
    p:give(Component.Player,"Charzi",100,100,true)
        :give(Component.Position, x,y,0,0,10,10)
        :give(Component.Sprite, sprite_file_name )
        :give(Component.Bindings)
        :give(Component.Gravity, 10)
        :apply()
    local c = p[Component.Sprite]
    world:add(p,x,y,c.w,c.h)
    Game:addEntity(p)
    return p
end

instantiatePlayer(100,100,'src/imgs/default.png')
Concord.addInstance(Game)
print('game.lua loaded')