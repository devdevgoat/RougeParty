local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Sprite = {}

local Sprite = Component(function(e, filename)
    local img = love.graphics.newImage( filename )
    e.img = img
    e.w = img:getWidth()
    e.h = img:getHeight()
end)

return Sprite