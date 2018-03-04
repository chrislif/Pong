-----------------------------------------------------------------------------------------
--
-- main.lua
-- Startup Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer" 

-- Initialization Code
display.setStatusBar(display.HiddenStatusBar)
composer.recycleOnSceneChange = true 
composer.isDebug = true

-- Goto Scene
composer.gotoScene("scn.menu")