-- Called at the end of any contact in the world. Parameters:
-- {fixture} fixture_a - first fixture object in the collision.
-- {fixture} fixture_b - second fixture object in the collision.
-- {contact} contact - world object created on and at the point of contact
--   See further: https://love2d.org/wiki/Contact
local begin_contact_callback = function (fixture_a, fixture_b, contact)

end

local end_contact_callback = function (fixture_a, fixture_b, contact)
  local entity_a = fixture_a:getUserData()
  local entity_b = fixture_b:getUserData()

  if entity_a.end_contact then entity_a:end_contact() end
  if entity_b.end_contact then entity_b:end_contact() end

end

local pre_solve_callback = function (fixture_a, fixture_b, contact)

end

local post_solve_callback = function (fixture_a, fixture_b, contact)

end

local world = love.physics.newWorld(0,0)

world:setCallbacks(
  nil, --begin_contact_callback,
  end_contact_callback,
  nil, -- pre_solve_callback,
  nil--post_solve_callback,
)

return world
