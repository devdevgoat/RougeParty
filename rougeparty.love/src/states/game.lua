state=require("lib.stateswitcher")
bump = require 'lib.bump'
world = bump.newWorld(64)
local transform = love.math.newTransform()
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

KEYS = {}

ground = {
    name="ground",
    mode = "line",
    x = 0,
    y = love.graphics.getHeight()-love.graphics.getHeight()/10,
    w =  love.graphics.getWidth()*10,
    h =  love.graphics.getHeight()/10,
    rx = nil,
    ry = nil,
    seg = nil 
}


Game:addSystem(System.CameraController(), "update")
Game:addSystem(System.CameraController(), "draw")
Game:addSystem(System.PlayerManager(), "draw")
Game:addSystem(System.PlayerManager(), "update")
Game:addSystem(System.PlayerController(), "update")
Game:addSystem(System.PlayerController(), "keypressed")
Game:addSystem(System.Gravity(), "update")


world:add(ground,ground.x,ground.y,ground.w,ground.h)

function love.load()





end


function love.update(dt)
    Game:emit("update",dt)

    if(Player) then
        local pos = Player:get(Component.Position)
        print(pos.x-pos.dx..','..pos.y-pos.dy)
        --transform:translate(pos.x-pos.dx,pos.y-pos.dy)
    end
end

function love.draw()
    --love.graphics.applyTransform(transform)
    Game:emit("draw")
    draw_rec(ground)
    
end

function love.mousepressed(x,y,button,istouch)
    Player = instantiatePlayer(100,100,"src/imgs/default.png")
end

function instantiatePlayer(x,y,sprite_file_name)
    print('t')
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


function love.keypressed(key)
    if(key == 'escape') then

    else
        --add to keys table
        table.insert(KEYS,key)
    end
    Game:emit("keypressed",key)
end


function love.keyreleased(key)
    if(key == 'escape') then
     state.switch("src/states/main_menu")
    end
    for i=1, #KEYS do
        if(KEYS[i]==key) then
            table.remove(KEYS,i)
            break
        end
    end
    
end

function draw_rec(t)
    love.graphics.rectangle( t.mode or "line", t.x, t.y, t.w, t.h, t.rx or 0, t.ry or 0, t.seg or 0 )
end

