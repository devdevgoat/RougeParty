state=require("lib.stateswitcher")
state.clear()
-- local inspect = require('lib.inspect')
love.graphics.setBackgroundColor(0.5,0.3,0.3)

local Concord = require("lib").init({
    useEvents = true
})

-- local Component = require("src.components")
local Systems = require("src.systems")
local Component  = require("src.components")
local Entity  = Concord.entity
local Menu    = Concord.instance() --this world

local Buttons = {
    Back = Entity(),
    Options = Entity(),
    Play = Entity()
}

Buttons.Play:give(Component.UI,"button")
        :give(Component.Position, 100,200)
        :give(Component.Area, 200,50 )
        :give(Component.Button,"BtnPlay","Play",function () state.switch("src.states.level_1") end  )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply()
Buttons.Back:give(Component.UI,"button")
        :give(Component.Position, 100,260)
        :give(Component.Button,"BntBack","Quit",function () state.switch("main") end  )
        :give(Component.Area, 200,50 )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply() 
Buttons.Options:give(Component.UI,"button")
        :give(Component.Position, 100,320)
        :give(Component.Area, 200,50 )
        :give(Component.Button,"BtnOptions","Play 2",function () state.switch("src.states.level_2") end  )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply()

--Add the buttons to the menu
for key, value in next, Buttons do
    Menu:addEntity(value)
end

--Initialize Logic
Menu:addSystem(Systems.UIManager(), "draw")
Menu:addSystem(Systems.UIManager(), "mousepressed")
Menu:addSystem(Systems.UIManager(), "keypressed")


Concord.addInstance(Menu)


print('start_menu.lua loaded')