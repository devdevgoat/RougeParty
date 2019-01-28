---DONT FORGET TO EXPOSE IN INIT!
local Concord = require("lib").init({
    useEvents = false
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system
local Controller = require('lib.controller')
local transform = love.math.newTransform()

local CameraController = System({Component.Position, Component.Player})

function CameraController:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position  = e:get(Component.Position)
        local player   = e:get(Component.Player)
        if(player.isLocal) then
            -- local dx = position.x - actualX
            -- local dy = 0
            -- if(position.y > love.graphics.getHeight()-love.graphics.getHeight()/10) then 
            --     dy = position.y - actualY
            --     cumulative_dy = cumulative_dy + dy
            -- elseif (position.y < love.graphics.getHeight()/10) then
            --     dy = position.y - actualY
            --     cumulative_dy = cumulative_dy - dy
            -- else 
            --     dy = cumulative_dy 
            --     cumulative_dy = 0
            -- end
            --print(position.dx..","..position.dy)
            transform:translate(position.dx,0)
           
        end
    end
end

function CameraController:draw()
    love.graphics.applyTransform(transform)
    
end


return CameraController