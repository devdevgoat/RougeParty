
local Concord = require("lib").init({
    useEvents = false
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system

--- Customize Below

local PlayerManager = {}
PlayerManager = System({Component.Position, Component.Sprite})

function PlayerManager:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position    = e:get(Component.Position)
        local sprite     = e:get(Component.Sprite)

        love.graphics.draw(sprite.img,position.x,position.y,0,1,1)
        love.graphics.rectangle("line", position.x, position.y, sprite.w, sprite.h)
        

    end
end

function PlayerManager:mousepressed(x, y, button, istouch)
    local e 
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position  = e:get(Component.Position)

        
    end
end

return PlayerManager