
local Concord = require("lib").init({
    useEvents = false
})

local Component = require('src.components')
local Entity    = Concord.entity

local Player = Entity() -- likely not needed, will have to create this on each new player dynamically

-- Assin Components
 Player:give(Component.Position, 100,200)
        :give(Component.Sprite, "src/imgs/default.png" )
        :apply()

return Player