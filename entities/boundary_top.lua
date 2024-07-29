local world = require("world")

return function (pos_x,pos_y)
  local entity = {}
  entity.body = love.physics.newBody(world,pos_x,pos_y, "static") -- 400 x is the center of the entity
  entity.shape = love.physics.newRectangleShape(800,0)
  entity.fixture = love.physics.newFixture(entity.body,entity.shape)
  entity.fixture:setUserData(entity)

  return entity
end
