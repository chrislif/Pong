-----------------------------------------------------------------------------------------
--
-- manager.lua
-- Helper and Management Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer"

-- Initialize function table
local manager = {}

function manager.gotoScene(toScene)	-- Helper function toScene
	print("change scene to: " .. toScene)
	composer.gotoScene("scn." .. toScene)
end

return manager