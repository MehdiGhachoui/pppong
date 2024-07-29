local state = require("state")

return function ()
  local window_width,window_height = love.window.getMode()

  local entity = {}
  entity.draw = function (self)
    if state.paused then
      love.graphics.print(
        {{0.2,1,0.2,1}, "PAUSED"},
        math.floor(window_width/2 - 54),-- floor returns a whole number instead of float removes the .xx (basicaly)!
        math.floor(window_height/2),
        0,
        2, -- scalse is basicaly the size -> on x axise
        2  -- scalse is basicaly the size -> on y axise
      )
    end
  end

  return entity
end
