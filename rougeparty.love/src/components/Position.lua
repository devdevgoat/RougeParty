--don't forget to expose in init.lua!!!
local Concord = require("lib").init({
    useEvents = false
})

local Component = Concord.component

local Position = {}

local Position = Component(function(e, x, y, vx, vy, s,d)
    e.x = x
    e.y = y
    e.vx = vx or 0
    e.vy = vy or 0
    e.s = s or 0--speed
    e.d = d or 1 --damping
    e.dx = 0 --prior delta x
    e.dy = 0 --prior delta y
end)

function Position:TranslateVelocity(dx,dy)
    self.vx = self.vx + dx
    self.vy = self.vy + dy
end

function Position:applyDamping(dt)
    -- where "player.damping" is a positive value (could be greater than 1)
    local d = 1 + self.d*dt
    if(self.vx > 0.1 or self.vx < -0.1) or (self.vy > 0.1 or self.vy < -0.1) then
        self.vx = self.vx/d
        self.vy = self.vy/d
    end
  end

  function Position:setVelocity(vx,vy)
    self.vx = vx
    self.vy = vy
  end

  function Position:translate(x,y)
    self.x = x
    self.y = y
  end

  function Position:setDelta(dx,dy)
    self.dx = dx
    self.dy = dy
  end


return Position