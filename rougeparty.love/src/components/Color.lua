local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Color = {}

local Color = Component(function(e,r,g,b,a)
    e.r = r 
    e.g = g
    e.b = b
    e.a = a
end)

return Color