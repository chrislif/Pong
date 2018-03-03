-----------------------------------------------------------------------------------------
--
-- game.lua
-- Game Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize Scene
local scene = composer.newScene()



function scene:show(event)

	local phase = event.phase
	
	if (phase == "will") then
	
		-- Create Display Groups
		backGroup = display.newGroup()
		frontGroup = display.newGroup()
		
	elseif (phase == "did") then
	
		local options = {
			parent = backGroup,
			x = display.contentWidth/2,
			y = display.contentHeight/2,
			text = "to Menu",
			fontSize = 15,
			align = "center"
		}
		display.newText(options)
		
	end
end

function scene:hide(event)
	
	local phase = event.phase
	
	if (phase == "did") then
	
		-- Remove Display Groups
		backGroup.removeSelf()
		frontGroup.removeSelf()
	end
end

-- Scene Event Listeners
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene