local state = require('state')

return function()
  local window_width, window_height = love.window.getMode()

  local entity = {}

  entity.draw = function(self)
    if state.stage_cleared then
      love.graphics.print(
        'STAGE CLEARED',
        math.floor(window_width / 2) - 110,
        math.floor(window_height / 2),
        0,
        2,
        2
      )
    end
  end

  return entity
end
