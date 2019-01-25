state=require("lib.stateswitcher")
step=tonumber(passvar[1])
state.clear()

function love.load()
   font = love.graphics.setNewFont( 24 )   
   
end 

function love.draw()
   love.graphics.setBackgroundColor(0.3,0.3,0.3)
   love.graphics.setColor(255,30,30)
   if (step~=2) then
      love.graphics.printf("Welcome to my game!",50,50,love.graphics.getWidth()-100)
   else
      love.graphics.printf("Thanks for playing!",50,50,love.graphics.getWidth()-100)
   end
   love.graphics.setColor(255,255,255)
   love.graphics.printf("Press any key to switch to open the menu.",100,200,love.graphics.getWidth()-200)
end


function love.keyreleased(key)
   state.switch("src.states.main_menu")
end

function love.update(dt)
   if love.keyboard.isDown("escape") then
      love.event.push("quit")
   end
end