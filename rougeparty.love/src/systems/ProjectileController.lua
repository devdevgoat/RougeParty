---DONT FORGET TO EXPOSE IN INIT!
local Concord = require("lib").init({
    useEvents = false
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system
local Controller = require('lib.controller')
local transform = love.math.newTransform()

local ProjectileController = System({Component.Projectile})

function ProjectileController:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local projectile  = e:get(Component.Projectile)
        local px,py = projectile.x,projectile.y
        local goalX, goalY = projectile.targetx,projectile.targety
        local actualX, actualY, cols, len = world:move(projectile, goalX, goalY,playerFilter(projectile, projectile.origin))
        projectile:translate(actualX,actualY)
    end
end

function ProjectileController:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local projectile  = e:get(Component.Projectile)
        love.graphics.rectangle("fill",projectile.x,projectile.y,10,10)
    end
end

playerFilter = function(item,other)
    if other.isPlayer then return false end
    print('Collided with '..other.name)
    return true
end

return ProjectileController