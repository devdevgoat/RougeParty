--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Player = {}

local Player = Component(function(e, name,maxhealth,currhealth,isLocal)
    e.isLocal = isLocal
    e.name = name
    e.maxhealth = maxhealth
    e.currhealth = currhealth
end)

function Player:updateHealth(dh)
    local goalhealth = self.currhealth+dh
    if(goalhealth>self.maxhealth) then
        self.currhealth = self.maxhealth
    else
        self.currhealth = goalhealth
    end
end

return Player