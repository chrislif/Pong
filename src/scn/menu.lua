-----------------------------------------------------------------------------------------
--
-- menu.lua
-- Main Menu Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize Scene
local scene = composer.newScene()

-- Scene Functions
function scene:create(event)	-- On create, before view

	-- %TODO: Grab highscore

end

function scene:show(event)

	local phase = event.phase
	
	if (phase == "will") then	-- Just before view
		
		-- Create Display Groups
		backGroup = display.newGroup()
		frontGroup = display.newGroup()
		
	elseif (phase == "did") then	-- On view
		
		-- %TODO: Draw Menu Buttons
		
		local options = {
			parent = backGroup,
			x = display.contentWidth/2,
			y = display.contentHeight/2,
			text = "Start Game",
			fontSize = 15,
			align = "center"
		}
		display.newText(options)
		
	end
end

function scene:hide(event)

	local phase = event.phase
	
	if (phase == "will") then	-- Just before leave
	
	elseif (phase == "did") then	-- After leave
	
		-- Remove Display Groups
		backGroup.removeSelf()
		frontGroup.removeSelf()
		
	end
end

-- Scene Event Listeners
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene