local ball = require("entities.ball")
local paddle = require("entities.paddle")
local boundary_top = require("entities.boundary_top") -- calling them create the object but it's not visible since it's not drawn yet
local boundary_bottom = require("entities.boundary_bottom") -- same
local boundary_vertical = require("entities.boundary_vertical") -- same
local brick = require("entities.brick")
local pause_text = require("entities.pause_text")
local level_cleared = require("entities.level_cleared")
local game_over     = require("entities.game_over")


local entities =  {
  boundary_top(400,-6),
  boundary_bottom(400,606),
  boundary_vertical(-6,300),
  boundary_vertical(806,300),
  ball(200,200),
  paddle(300,500),
  level_cleared(),
  pause_text(),
  game_over(),
}

local row_width = love.window.getMode() - 20
for number = 0,38 do
  local brick_x = ((number * 60) %  row_width ) + 40 -- it makes sense if you are lost do the calculations manually  [%780 ]
  local brick_y = (math.floor((number * 60) / row_width) * 40) + 80 -- we are using this to move down every time we reach the row width
  entities[#entities+1] = brick(brick_x,brick_y)
end

return entities
