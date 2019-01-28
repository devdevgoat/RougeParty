--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Gravity = {}

local Gravity = Component(function(e, g)
    e.g = g
end)

return Gravity