-----------------------------------------------------------------------------------------
--
-- game.lua
-- Game Scene Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"
local physics = require "scr.physics"
local manager = require "scr.manager"
local graphics = require "scr.graphics"

-- Initialize gameScene
local gameScene = composer.newScene()

-- Scene Functions
function gameScene:show(event)	-- Before scene creation

	local phase = event.phase
	local sceneGroup = self.view
	
	if (phase == "will") then	-- Just before view
	
		-- Create Display Groups
		backGroup = display.newGroup()
		frontGroup = display.newGroup()
		
		sceneGroup:insert(backGroup)
		sceneGroup:insert(frontGroup)
		
	elseif (phase == "did") then	-- On view
		
		-- Menu Text Button
		toMenu = graphics.drawText(display.contentWidth - 96, 16, "to Menu")
		toMenu:addEventListener("tap", function() manager.gotoScene("menu") end)
		
		-- Load objects
		ball = graphics.loadBall()
		player = graphics.loadPlayer()
		enemy = graphics.loadEnemy()
		
		-- Assign Id
		player.id = 1
		ball.id = 0
		enemy.id = 2
		
		-- Load boundaries
		leftBound = graphics.loadLeftBound()
		rightBound = graphics.loadRightBound()
		
		-- Organize objects into groups
		frontGroup:insert(ball)
		frontGroup:insert(toMenu)
		frontGroup:insert(player)
		frontGroup:insert(enemy)
		frontGroup:insert(leftBound)
		frontGroup:insert(rightBound)
		
		-- Add to physics
		physics.addBody(player)
		physics.addBody(ball)
		physics.addBody(enemy)
		
		-- Wait for player to start game
		Runtime:addEventListener("tap", gameScene.startGame)
	end
end

function gameScene:startGame(event)	-- Start the game
	physics.run()
	physics.setVector(ball, 0, 0)
	Runtime:removeEventListener("tap", gameScene.startGame)
	player:addEventListener("touch", manager.dragPaddle)
  
	gameLoopTimer = timer.performWithDelay(1, gameLoop, 0)
end

function gameLoop(event)
	manager.moveEnemy(enemy, ball)
end

-- Scene Event Listeners
gameScene:addEventListener("show", gameScene)

return gameScene