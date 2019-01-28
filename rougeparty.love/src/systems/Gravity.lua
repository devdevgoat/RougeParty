---DONT FORGET TO EXPOSE IN INIT!
local Concord = require("lib").init({
    useEvents = false
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system
local Controller = require('lib.controller')


local Gravity = System({Component.Position, Component.Gravity})

function Gravity:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local position  = e:get(Component.Position)
        local gravity   = e:get(Component.Gravity)
        position:TranslateVelocity(0,gravity.g)
    end
end

return Gravity