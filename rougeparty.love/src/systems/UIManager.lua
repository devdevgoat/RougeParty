---DONT FORGET TO EXPOSE IN INIT! 
local inspect = require('lib.inspect')
local Concord = require("lib").init({
    useEvents = true
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system

local UIManager = {}
UIManager = System({Component.UI})

function UIManager:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local ui = e:get(Component.UI)
        love.graphics.setColor(255, 255, 255)
        
        if color then
            love.graphics.setColor(color.r, color.g, color.b, color.a)
        end

        if(ui.type =='button') then
            local button    = e:get(Component.Button)
            local position  = e:get(Component.Position)
            local area      = e:get(Component.Area)
            local color     = e:get(Component.Color)
            love.graphics.setLineWidth( 3 )
            love.graphics.rectangle("line", position.x, position.y, area.w, area.h, 4,4,2)
            love.graphics.printf(button.text,position.x,position.y+area.h/2-12,area.w,"center")
        end
        

    end
end

function UIManager:entityAdded(e)
    
end

function UIManager:mousepressed(x, y, button, istouch)
    local e 
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local button    = e:get(Component.Button)
        local position  = e:get(Component.Position)
        local area      = e:get(Component.Area)

        if(x and y) then
            if x >= position.x and x <= position.x + area.w and y >= position.y and y <= position.y + area.h then
                local action = button.onclick
                if action then action() end
            end
        end
    end
end

function UIManager:keypressed(key)
    if(key == 'escape') then
        print("GOODBYE!")
        love.event.push("quit") 
        --state.switch("main") --"main;2" would pass 2 to main
       end
end

return UIManager