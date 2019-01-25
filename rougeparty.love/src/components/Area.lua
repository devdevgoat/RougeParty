local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Area = {}

local Area = Component(function(e, w,h)
    e.w = w
    e.h = h
end)

return Area