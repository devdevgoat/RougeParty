local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Position = {}

local Position = Component(function(e, x, y)
    e.x = x
    e.y = y
end)

return Position