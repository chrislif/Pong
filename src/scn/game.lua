-----------------------------------------------------------------------------------------
--
-- game.lua
-- Game Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize gameScene
local gameScene = composer.newScene()

-- Local Functions
local function gotoScene(toScene)	-- Helper function to scene
	-- print("change scene to: " .. toScene)
	composer.gotoScene("scn." .. toScene)
end

-- Scene Functions
function gameScene:create(event)	-- On create, before view

end

function gameScene:show(event)

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
			text = "Game",
			fontSize = 15,
			align = "center"
		}
		titleText = display.newText(options)
		
		local options = {
			parent = frontGroup,
			x = display.contentWidth/2,
			y = display.contentHeight - 32,
			text = "to Menu",
			fontSize = 15,
			align = "center"
		}
		toMenu = display.newText(options)
		toMenu:addEventListener("tap", function() gotoScene("menu") end)
	end
end

function gameScene:hide(event)
	
	local phase = event.phase
	
	if (phase == "will") then	-- Just before leave
	
	elseif (phase == "did") then	-- After leave
	
	end
end

-- gameScene Event Listeners
gameScene:addEventListener("show", gameScene)
gameScene:addEventListener("hide", gameScene)

return gameScene