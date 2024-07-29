local world = require('world')

return function (pos_x,pos_y)
  local max_speed = 880

  local entity = {}
  entity.body = love.physics.newBody(world,pos_x,pos_y,"dynamic")
  entity.body:setMass(32)
  entity.body:setLinearVelocity(300,300)
  entity.shape = love.physics.newCircleShape(0,0,10)
  entity.fixture = love.physics.newFixture(entity.body,entity.shape)
  entity.fixture:setFriction(0)
  entity.fixture:setRestitution(1)
  entity.fixture:setUserData(entity)


  entity.draw = function (self)
    local self_x,self_y = self.body:getWorldCenter() -- we doing this cause it's a circle
    love.graphics.circle("fill",self_x,self_y,self.shape:getRadius())
  end


  entity.update = function (self)
    local vel_x,vel_y = self.body:getLinearVelocity()
    local speed = math.abs(vel_x) + math.abs(vel_y)

    local vel_x_is_critical = math.abs(vel_x) > max_speed * 2 -- why *2 tho ?OHH  because we are only testing x speed
    local vel_y_is_critical = math.abs(vel_y) > max_speed * 2 -- not the sum of both of them :p

    if vel_x_is_critical or vel_y_is_critical then
      self.body:setLinearVelocity(vel_x * .75 , vel_y * .75) -- cut the speed by 75%
    end

    if speed > max_speed then
      self.body:setLinearDamping(0.1)
    else
      self.body:setLinearDamping(0)
    end
  end

  return entity
end
