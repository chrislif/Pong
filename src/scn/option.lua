-----------------------------------------------------------------------------------------
--
-- option.lua
-- Options Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize optionScene
local optionScene = composer.newScene()

-- Local Functions
local function gotoScene(toScene)	-- Helper function to scene
	-- print("change scene to: " .. toScene)
	composer.gotoScene("scn." .. toScene)
end

-- Scene Functions
function optionScene:create(event)	-- On create, before view

end

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
		menuButton:addEventListener("tap", function() gotoScene("menu") end)
	end
end

function optionScene:hide(event)
	
	local phase = event.phase
	
	if (phase == "will") then	-- Just before leave
	
	elseif (phase == "did") then	-- After leave
	
	end
end

-- optionScene Event Listeners
optionScene:addEventListener("show", optionScene)
optionScene:addEventListener("hide", optionScene)

return optionScene