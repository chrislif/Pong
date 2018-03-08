-----------------------------------------------------------------------------------------
--
-- game.lua
-- Game Scene Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"
local physics = require "physics"
local manager = require "scr.manager"
local graphics = require "scr.graphics"

-- Initialize gameScene
local gameScene = composer.newScene()
physics.start()
physics.setGravity(0, 0)

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
		
		-- Add Physics
		physics.addBody(ball, "dynamic", {friction = 0})
		physics.addBody(player, "static", {bounce = 1})
		physics.addBody(enemy, "static", {bounce = 1.2})
		physics.addBody(leftBound, "static", {bounce = 1})
		physics.addBody(rightBound, "static", {bounce = 1})
		
		-- Wait for player to start game
		Runtime:addEventListener("tap", gameScene.startGame)
	end
end

function gameScene:startGame(event)	-- Start the game
	ball:setLinearVelocity(0, 200)
	Runtime:removeEventListener("tap", gameScene.startGame)
	player:addEventListener("touch", manager.dragPaddle)

	gameLoopTimer = timer.performWithDelay(500, gameLoop, 0)
end


function gameLoop(event)
	manager.moveEnemy(event)
end

-- Scene Event Listeners
gameScene:addEventListener("show", gameScene)

return gameScene