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
	print("added body '" .. object.id .. "': ")
	print(object)
	print("\n")
end

function physics.run()
	timer.performWithDelay(1, physics.physicsLoop, 0)
end

function physics.setVelocity(object)
	print(physics.bodies[object.id])
end

return physics