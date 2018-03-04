-----------------------------------------------------------------------------------------
--
-- menu.lua
-- Main Menu Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"
local manager = require "scr.manager"

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
		
		sceneGroup:insert(backGroup)
		sceneGroup:insert(frontGroup)
		
	elseif (phase == "did") then	-- On view
		
		-- %TODO: Draw Menu Buttons
		local options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = 32,
			text = "PONG by Tsundraki",
			fontSize = 15,
			align = "center"
		}
		titleText = display.newText(options)
		
		options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = display.contentHeight/2 - 32,
			text = "Start Game",
			fontSize = 15,
			align = "center"
		}
		startButton = display.newText(options)
		startButton:addEventListener("tap", function() manager.gotoScene("game") end)
		
		options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = display.contentHeight/2,
			text = "Options",
			fontSize = 15,
			align = "center"
		}
		optionsButton = display.newText(options)
		optionsButton:addEventListener("tap", function() manager.gotoScene("option") end)
		
	end
end

-- Scene Event Listeners
menuScene:addEventListener("create", menuScene)
menuScene:addEventListener("show", menuScene)

return menuScene