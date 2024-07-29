local world = require("world")
local state = require("state")

return function (pos_x,pos_y)
  local window_width = love.window.getMode()
  local paddle_width = 120
  local paddle_height = 20
  local paddle_speed = 600

  local left_boundary =  paddle_width/2 + 15 -- ODD !!
  local right_boundary = window_width - (paddle_width/2) - 15 -- ODD !!

  local entity = {}
  entity.body = love.physics.newBody(world,pos_x,pos_y,"kinematic")
  entity.shape = love.physics.newRectangleShape(paddle_width,paddle_height)
  entity.fixture = love.physics.newFixture(entity.body,entity.shape)
  entity.fixture:setUserData(entity)

  entity.draw = function (self)
    love.graphics.polygon("line",self.body:getWorldPoints(self.shape:getPoints()))
  end

  entity.update = function (self) -- dt to make a uniform speed
    if state.button_left and state.button_right then return end

    local self_x = self.body:getPosition()

    if state.button_right and self_x < right_boundary then
      self.body:setLinearVelocity(paddle_speed,0)
    elseif state.button_left and self_x > left_boundary then
      self.body:setLinearVelocity(-paddle_speed,0)
    else
      self.body:setLinearVelocity(0,0)
    end
  end

  return entity
end
