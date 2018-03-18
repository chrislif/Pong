-----------------------------------------------------------------------------------------
--
-- physics.lua
-- Physics Code
-----------------------------------------------------------------------------------------
-- Initialize Function Table
local physics = {}

physics.bodies = {}

function physics.physicsLoop()
	
end

function physics.addBody(object)
	physics.bodies[object.id] = object
	object.vector = {speed = 0, dir = 0}
end

function physics.run()
	timer.performWithDelay(1, physics.physicsLoop, 0)
end

function physics.setVector(object, speed, dir)

end

return physics