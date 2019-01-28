---DONT FORGET TO EXPOSE IN INIT!
local Concord = require("lib").init({
    useEvents = false
})


local Component = require('src.components')
local Entity = require('src.entities')
local System    = Concord.system
local Controller = require('lib.controller')


local PlayerController = System({Component.Position, Component.Bindings})

function PlayerController:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)

        local position  = e:get(Component.Position)
        local bindings   = e:get(Component.Bindings)

        for i=1, #KEYS do
            if(love.keyboard.isDown(KEYS[i]) and bindings.Red.keys.canHold[KEYS[i]] ~= nil) then
                inputHandler( Controller[bindings.Red.keys.canHold[KEYS[i]]](position) )
           end
        end
    end
end

function PlayerController:keypressed(k)
    print(k)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local bindings   = e:get(Component.Bindings)
        local position  = e:get(Component.Position)

        if  bindings.Red.keys[k] ~= nil then
            inputHandler( Controller[ bindings.Red.keys[ k ] ](position) )
        end

    end
    
end

function inputHandler( input )
    local action = input 
    if action then   action()  end
end

return PlayerController