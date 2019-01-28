state=require("lib.stateswitcher")
-- local inspect = require('lib.inspect')


local Concord = require("lib").init({
    useEvents = false
})

-- local Component = require("src.components")
local Systems = require("src.systems")
local Entities = require("src.entities")

--- Customize Below ---
-- Declare Instnace (Menu, Level, etc)
local Menu = Concord.instance() --this world



--Initialize Logic
Menu:addSystem(Systems.UIManager(), "draw")
Menu:addSystem(Systems.UIManager(), "mousepressed")

--Add the buttons to the menu
for key, value in next, Entities.MainMenu do
    Menu:addEntity(value)
end

-- standard functions
function love.update(dt)
    
end

function love.draw()
    Menu:emit("draw")
end

function love.mousepressed(x,y,button,istouch)
    Menu:emit("mousepressed", x,y,button,istouch)
end

function love.keyreleased(key)
    if(key == 'escape') then
     state.switch("main;2")
    end
end

print('loaded')