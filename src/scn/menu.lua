-----------------------------------------------------------------------------------------
--
-- menu.lua
-- Menu Scene Code
--------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"
local manager = require "scr.manager"
local graphics = require "scr.graphics"

-- Initialize Scene
local menuScene = composer.newScene()

-- Scene Functions
function menuScene:create(event)	-- On create, before view
	-- %TODO: Grab highscore

end

function menuScene:show(event)

	local phase = event.phase
	local sceneGroup = self.view
	
	if (phase == "will") then	-- Just before view
		
		-- Create Display Groups
		backGroup = display.newGroup()
		frontGroup = display.newGroup()
		
		-- Put display groups into scene
		sceneGroup:insert(backGroup)
		sceneGroup:insert(frontGroup)
		
	elseif (phase == "did") then	-- On view
		
		-- Title
		titleText = graphics.drawText(display.contentWidth/2, 32, "PONG by Tsundraki")
		
		-- Start Text Button
		startButton = graphics.drawText(display.contentWidth/2, display.contentHeight/2 - 32, "Start Game")
		startButton:addEventListener("tap", function() manager.gotoScene("game") end)
		
		-- Options Text Button
		optionsButton = graphics.drawText(display.contentWidth/2, display.contentHeight/2, "Options")
		optionsButton:addEventListener("tap", function() manager.gotoScene("option") end)
		
		-- Organize into groups
		frontGroup:insert(optionsButton)
		frontGroup:insert(startButton)
		frontGroup:insert(titleText)
		
	end
end

-- Scene Event Listeners
menuScene:addEventListener("create", menuScene)
menuScene:addEventListener("show", menuScene)

return menuScene