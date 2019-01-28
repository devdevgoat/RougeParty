--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Bindings = {}
local Red = {
    keys = {
        canHold = {
            left       = "movePlayerLeft",
            right       = "movePlayerRight",
            up       = "movePlayerUp",
            down       = "movePlayerDown",
        },
        escape     = "quit",
        space       = "jump",
        ["return"] = "select", -- return is a keyword that's why it has to be written like this
    },

    buttons = {
        canHold = {
            up         = "movePlayerUp",
            down       = "movePlayerDown",
            left       = "movePlayerLeft",
            right       = "movePlayerRight",
        },
            back = "backToGame",
    }
}

local Bindings = Component(function(e)
    e.Red = Red
end)

print('got me some binding')
return Bindings