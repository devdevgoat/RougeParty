
local Concord = require("lib").init({
    useEvents = false
})

local Component = require('src.components')
local Entity    = Concord.entity

local MainMenu = {
    BtnBack = Entity(),
    BtnOptions = Entity(),
    BtnPlay = Entity()
}


-- Assin Components
MainMenu.BtnBack:give(Component.Position, 100,260)
    :give(Component.Button,"BntBack","Quit",function () state.switch("main;2") end  )
    :give(Component.Area, 200,50 )
    :give(Component.Color, 255, 255, 255, 1 )
    :apply() 

-- Assin Components
MainMenu.BtnOptions:give(Component.Position, 100,320)
        :give(Component.Area, 200,50 )
        :give(Component.Button,"BtnOptions","Options",function () state.switch("main;2") end  )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply()

-- Assin Components
MainMenu.BtnPlay:give(Component.Position, 100,200)
        :give(Component.Area, 200,50 )
        :give(Component.Button,"BtnPlay","Play",function () state.switch("src.states.game") end  )
        :give(Component.Color, 255, 255, 255, 1 )
        :apply()

return MainMenu