state=require("lib.stateswitcher")
state.clear()

local Concord = require("lib").init({
   useEvents = true
})

font = love.graphics.setNewFont( 24 )   
love.graphics.setBackgroundColor(0.3,0.3,0.3)

local Systems = require("src.systems")
local Component  = require("src.components")
local Entity  = Concord.entity

Welcome = Concord.instance() --this world

Play = Entity()

Play:give(Component.UI, 'button')
        :give(Component.Position, 100,200)
        :give(Component.Area, 200,50 )
        :give(Component.Button,"BtnPlay","Start",function () state.switch("src.states.start_menu") end  )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply()

Welcome:addEntity(Play)

Welcome:addSystem(Systems.UIManager(), "draw")
Welcome:addSystem(Systems.UIManager(), "mousepressed")
Welcome:addSystem(Systems.UIManager(), "keypressed")


Concord.addInstance(Welcome)


print('main.lua loaded')