local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local UI = {}

local UI = Component(function(e,type)
    e.type = type
end)

return UI
