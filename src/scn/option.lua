-----------------------------------------------------------------------------------------
--
-- option.lua
-- Options Scene Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"
local manager = require "scr.manager"

-- Initialize optionScene
local optionScene = composer.newScene()

-- Scene Functions
function optionScene:show(event)

	local phase = event.phase
	local sceneGroup = self.view
	
	if (phase == "will") then	-- Just before view
	
		-- Create Display Groups
		backGroup = display.newGroup()
		frontGroup = display.newGroup()
		
		sceneGroup:insert(backGroup)
		sceneGroup:insert(frontGroup)
		
	elseif (phase == "did") then	-- On view

		local options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = 32,
			text = "Options",
			fontSize = 15,
			align = "center"
		}
		titleText = display.newText(options)
		
		options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = display.contentHeight - 32,
			text = "to Menu",
			fontSize = 15,
			align = "center"
		}
		menuButton = display.newText(options)
		menuButton:addEventListener("tap", function() manager.gotoScene("menu") end)
	end
end

-- Scene Event Listeners
optionScene:addEventListener("show", optionScene)

return optionScene