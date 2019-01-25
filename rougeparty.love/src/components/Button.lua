local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Button = {}

local Button = Component(function(e, name, text, onclick,font)
    e.name = name
    e.text = text
    e.onclick = onclick
end)

return Button