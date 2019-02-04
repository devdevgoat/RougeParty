--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = true
})

local Component = Concord.component

local Bindings = {}
local Red = {
    keys = {
        canHold = {
            a       = "movePlayerLeft",
            d       = "movePlayerRight",
            w       = "movePlayerUp",
            s       = "movePlayerDown",
        },
        p     = "instantiatePlayer",
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
    },
    mouse = {
        primary = "fireStandard", 
        secondary = "fireSpecial", 
    }
}

local Bindings = Component(function(e)
    e.Red = Red
end)

print('got me some binding')
return Bindings