-----------------------------------------------------------------------------------------
--
-- manager.lua
-- Helper and Management Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize function table
local manager = {}

-- Functions
function manager.gotoScene(toScene)	-- Helper function for toScene
	print("change scene to: " .. toScene)
	composer.gotoScene("scn." .. toScene)
end

function manager.dragPaddle(event)
	local paddle = event.target
	local phase = event.phase
	
	if ("began" == phase) then
		-- Set focus
		display.currentStage:setFocus(paddle)
		-- Store initial offset
		paddle.touchOffsetX = event.x - paddle.x
	elseif ("moved" == phase) then
		-- Move to new position
		print(paddle.x)
		moveX = event.x - paddle.touchOffsetX
		
		if (moveX > 50) and (moveX < 270) then
			paddle.x = event.x - paddle.touchOffsetX
		end
	end
	
	return true
end

function manager.moveEnemy(event)

end

return manager