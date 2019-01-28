local controller = {}

controller = {
        backToGame = function() --[[<...>]]  end,
        movePlayerUp   = function(position) 
             --position:TranslateVelocity(0,-10)
        end,
        movePlayerDown   = function(position) 
            position:TranslateVelocity(0,10)
        end,
        movePlayerLeft   = function(position) 
            position:TranslateVelocity(-10,0)
        end,
        movePlayerRight   = function(position) 
            position:TranslateVelocity(10,0)
        end,
        jump = function(position) 
            position:setVelocity(0,-2000)
        end,
        select      = function() --[[<...>]] end,
        quit        = function() love.event.quit() end,
}

return controller