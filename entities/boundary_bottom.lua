local world = require("world")
local state = require("state")

return function (pos_x,pos_y)
  local entity = {}
  entity.body = love.physics.newBody(world,pos_x,pos_y,"static")
  entity.shape = love.physics.newRectangleShape(800,0)
  entity.fixture = love.physics.newFixture(entity.body,entity.shape)
  entity.fixture:setUserData(entity)

  -- whatever touches the bottom
  entity.end_contact = function (self)
    state.game_over = true
  end
  return entity
end
