---DONT FORGET TO EXPOSE IN INIT!
inspect = require('lib.inspect')
local transform = love.math.newTransform()
local Concord = require("lib").init({
    useEvents = true
})

local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system

--- Customize Below

local PlayerManager = {}
PlayerManager = System({Component.Player,Component.Position, Component.Sprite})


function PlayerManager:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local player    = e:get(Component.Player)
        local position    = e:get(Component.Position)
        local sprite     = e:get(Component.Sprite)

        love.graphics.draw(sprite.img,position.x,position.y,0,1,1)
        love.graphics.rectangle("line", position.x, position.y, sprite.w, sprite.h)
        love.graphics.print('Name:'..player.name,0,0)
        love.graphics.print('Health:' ..player.currhealth..'/'..player.maxhealth,0,24)
        --- this is for scrolling ... love.graphics.applyTransform(transform)
    end
end

function PlayerManager:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local position    = e:get(Component.Position)
        local goalX, goalY = position.x + (position.vx * dt), position.y + (position.vy * dt)
        local actualX, actualY, cols, len = world:move(e, goalX, goalY)
        position:setDelta(position.x-actualX,position.y-actualY)
        position:translate(actualX,actualY)
        position:applyDamping(dt)
        --- for scrolling transform:translate(actualX,actualY)
    end
end

function PlayerManager:mousepressed(x, y, button, istouch)
    local e 
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position  = e:get(Component.Position)
        --could interact with thing here
        
    end
end

return PlayerManager