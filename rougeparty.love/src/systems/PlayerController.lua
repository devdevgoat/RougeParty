---DONT FORGET TO EXPOSE IN INIT!
local Concord = require("lib").init({
    useEvents = true
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system
local Controller = require('lib.controller')


local PlayerController = System({Component.Position, Component.Bindings, Component.Player})

function PlayerController:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position  = e:get(Component.Position)
        local bindings   = e:get(Component.Bindings)

        for i=1, #Keys do
            if(love.keyboard.isDown(Keys[i]) and bindings.Red.keys.canHold[Keys[i]] ~= nil) then
                inputHandler( Controller[bindings.Red.keys.canHold[Keys[i]]](position) )
           end
        end
    end
end

function PlayerController:keypressed(k)
    --print(k)
    table.insert(Keys,k)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local bindings   = e:get(Component.Bindings)
        local position  = e:get(Component.Position)
        print(k)
        if  bindings.Red.keys[k] ~= nil then
            inputHandler( Controller[ bindings.Red.keys[ k ] ](position) )
        end
    end
end


function PlayerController.keyreleased(k)
    for i=1, #Keys do
        if(Keys[i]==k) then
            table.remove(Keys,i)
            break
        end
    end
end

function PlayerController:mousepressed(x, y, button, istouch, presses)
    local btn
    if(button == 1) then
        btn = "primary"
    elseif button ==2 then
        btn = "secondary"
    end
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local bindings   = e:get(Component.Bindings)
        local position  = e:get(Component.Position)
        local player  = e:get(Component.Player)
        -- local player  = e:get(Component.Player)
        if  bindings.Red.mouse[btn] ~= nil then
            inputHandler( Controller[ bindings.Red.mouse[ btn ] ](player,position,'standard',x,y) )
        end
    end
end

function inputHandler( input )
    local action = input 
    if action then   action()  end
end

return PlayerController