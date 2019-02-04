state=require("lib.stateswitcher")

print('loading level_2...')
local Concord = require("lib").init({
    useEvents = true
})
local transform = love.math.newTransform()



state.clear()

bump = require 'lib.bump'

world = bump.newWorld(64) --collision resolution
Game = Concord.instance() --component/system setup


Component = require("src.components")
System = require("src.systems")
DynEnt = Concord.entity

local p
--Add the player
p = DynEnt() -- need a way to add this dynamically... a spawn sytem?
-- Assin Components
p:give(Component.Player,"Charzi",100,100,true)
    :give(Component.Position, 100,100,0,0,10,10)
    :give(Component.Sprite, 'src/imgs/default.png' )
    :give(Component.Bindings)
    :give(Component.Gravity, 10)
    :apply()
local c = p[Component.Sprite]
world:add(p,100,100,c.w,c.h)
Game:addEntity(p)


Game:addSystem(System.PlayerController(), "update")
Game:addSystem(System.PlayerController(), "keypressed")
Game:addSystem(System.PlayerController(), "mousepressed")
Game:addSystem(System.PlayerManager(), "draw")
Game:addSystem(System.PlayerManager(), "update")