---DONT FORGET TO EXPOSE IN INIT!
inspect = require('lib.inspect')
local transform = love.math.newTransform()
local Concord = require("lib").init({
    useEvents = true
})

local Component = require('src.components')
local System    = Concord.system



--- Customize Below

local LevelManager = {}
LevelManager = System({Component.Level,Component.TileSet, Component.TileMap})

function LevelManager:init()
    world:add('ground',
            0,
            love.graphics.getHeight()-love.graphics.getHeight()/10,
            love.graphics.getWidth()*10,
            love.graphics.getHeight()/10
        )
end
function LevelManager:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        -- local level    = e:get(Component.Level)
        -- local tileset    = e:get(Component.TileSet)
        -- local tilemap     = e:get(Component.TileMap)

        -- local tilewidth = tileset.TileWidth
        -- local tileheight = tileset.TileHeight
        love.graphics.rectangle("line", 
                                0, 
                                love.graphics.getHeight()-love.graphics.getHeight()/10, 
                                love.graphics.getWidth()*10,
                                love.graphics.getHeight()/10,
                                0, 
                                0, 
                                0 )
        
        
    end
end

function LevelManager:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        
    end
end



return LevelManager