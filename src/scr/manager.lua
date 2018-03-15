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
function manager.sign(i) 
	if (i == 0) then
		return 0
	elseif (i > 0) then
		return 1
	else 
		return -1
	end
end

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
		moveX = event.x - paddle.touchOffsetX
		
		if (moveX > 50) and (moveX < 270) then
			paddle.x = event.x - paddle.touchOffsetX
		end
	end
	
	return true
end

function manager.moveEnemy(enemy, ball)
	local speed = 1
	local direction = manager.sign(ball.x - enemy.x)

	if (enemy.x ~= ball.x) then
		if (math.abs(ball.x - enemy.x) < speed) then
			return
		else
			enemy.x = enemy.x + (speed * direction)
		end
	end
end

return manager