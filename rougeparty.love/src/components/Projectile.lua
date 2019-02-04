--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Projectile = {}

local Projectile = Component(function(e, player, type,x,y,targetx,targety)
    e.origin = player
    e.type = type
    e.x = x
    e.y = y
    e.targetx =targetx
    e.targety = targetx
end)

function Projectile:spawn()
    world:add(self,self.x, self.y,3,3)
    --set the goal for direction
    local goalX, goalY = self.targetx,self.targety
    local actualX, actualY, cols, len = world:move(self, goalX, goalY)
end

function Projectile:translate(x,y)
    self.x = x
    self.y = y
    self.targetx =self.targetx - x
    self.targety = self.targety - y
end

function Projectile:remove()
    
end

return Projectile