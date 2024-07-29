local world = require("world")
local entities = require("entities")
local state = require('state')
local input = require("input")

function love.draw()
  -- Why does they work even if we don't draw them ? -- cause draw just make them visible (draw :3)
  -- love.graphics.polygon("line",boundary_top.body:getWorldPoints(boundary_top.shape:getPoints()))
  for _, entity in ipairs(entities) do
    if entity.draw then entity:draw() end
  end
end

function love.focus(focused)
  input.toggle_focus(focused)
end

function love.keypressed(key)
  input.press(key)
end

function  love.keyreleased(key)
 input.release(key)
end

function love.update(dt)
  local have_bricks = false

  if state.game_over or state.paused or state.stage_cleared then
    return
  end

  if not input.paused then
    local index = 1

    while index <= #entities do
      local entity = entities[index]
      if entity.type == 'brick' then have_bricks = true end
      if entity.update then entity:update(dt) end

      -- When an entity has no health (brick has been hit enough times
      -- then we remove it from the list of entities. Don't increment
      -- the index number if doing that though because we have shrunk
      -- the table and made all the items shift down by 1 in the index.
      if entity.health == 0 then
        table.remove(entities,index)
        entity.fixture:destroy() -- destroys the physic object
      else
        index = index + 1
      end
    end

    state.stage_cleared = not have_bricks
    world:update(dt)
  end
end







