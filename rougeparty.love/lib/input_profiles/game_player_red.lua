local game_player_red = {}


local bindings = {
    backToGame = function() --[[<...>]]  end,
    movePlayerUp   = function() 
        PLAYER.vy = PLAYER.vy  - PLAYER.speed 
     end,
    movePlayerDown   = function() 
        PLAYER.vy = PLAYER.vy  + PLAYER.speed 
     end,
    movePlayerLeft   = function() 
        PLAYER.vx = PLAYER.vx  - PLAYER.speed
    end,
    movePlayerRight   = function() 
        PLAYER.vx = PLAYER.vx  + PLAYER.speed 
    end,
    jump = function() 
        PLAYER.vy =  -PLAYER.jumpHeight
     end,
    select     = function() --[[<...>]] end,
    quit       = function() love.event.quit() end,
    
    incspeed     = function() PLAYER.speed = PLAYER.speed+10 end,
    decspeed     = function() PLAYER.speed = PLAYER.speed-10 end,
    incg     = function() PLAYER.g = PLAYER.g+10 end,
    decg     = function() PLAYER.g = PLAYER.g-10 end,
    incdam     = function() PLAYER.damping = PLAYER.damping+10 end,
    decdam     = function() PLAYER.damping = PLAYER.damping-10 end,
}



local keys = {
    canHold = {
        left       = "movePlayerLeft",
        right       = "movePlayerRight",
    },
    q    = "incspeed",
    w    = "incg",
    e    = "incdam",
    a    = "decspeed",
    s    = "decg",
    d    = "decdam",
        escape     = "quit",
        space       = "jump",
        ["return"] = "select", -- return is a keyword that's why it has to be written like this
}

local buttons = {
    canHold = {
        up         = "movePlayerUp",
        down       = "movePlayerDown",
        left       = "movePlayerLeft",
        right       = "movePlayerRight",
    },
        back = "backToGame",
}

game_player_red = {
    bindings = bindings,
    keys = keys,
    buttons = buttons
}


return game_player_red
