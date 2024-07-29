local world = require("world")

return function (pos_x,pos_y)
  local entity = {}
  entity.type = "brick"
  entity.body = love.physics.newBody(world,pos_x,pos_y,"static")
  entity.shape = love.physics.newRectangleShape(50,20)
  entity.fixture = love.physics.newFixture(entity.body,entity.shape)
  entity.fixture:setUserData(entity)

  entity.health = 2

  entity.draw = function (self)
    love.graphics.polygon("fill",self.body:getWorldPoints(self.shape:getPoints()))
  end

  -- whatever touches the brick
  entity.end_contact = function (self)
    self.health = self.health - 1
  end

  return entity
end
