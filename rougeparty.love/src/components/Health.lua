local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Health = {}

local Health = Component(function(e, max,cur)
    e.max = max
    e.cur = cur
end)

return Health