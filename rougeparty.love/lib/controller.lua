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
        select              = function() --[[<...>]] end,
        quit                = function() love.event.quit() end,
        fireStandard = 
        function(player,position,type,targetx,targety) 
            print('fire standard')
            local projectile = DynEnt()
            projectile:give(Component.Projectile,player,type,position.x,position.y,targetx,targety)
            :apply()
            print('sending x,y='..position.x..','..position.y)
            projectile:get(Component.Projectile):spawn()
            Game:addEntity(projectile)
        end,
        fireSpecial        = function() print('fire special') end,
}

return controller