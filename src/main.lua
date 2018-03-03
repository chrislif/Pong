-----------------------------------------------------------------------------------------
--
-- main.lua
-- Startup Code
-----------------------------------------------------------------------------------------

-- Requires
local composer = require "composer" 

-- Initialize Code
display.setStatusBar(display.HiddenStatusBar)

-- Goto Scene
composer.gotoScene("scn.menu")