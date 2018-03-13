-----------------------------------------------------------------------------------------
--
-- graphics.lua
-- Graphics Code
-----------------------------------------------------------------------------------------
local graphics = {}

function graphics.loadBall()	-- Loads Ball at center
	return display.newCircle(display.contentWidth/2, 
						   display.contentHeight/2,
						   5)	   
end

function graphics.loadEnemy()	-- Loads Enemy Paddle
	return display.newRect(display.contentWidth/2,
						   32,
						   50, 10)
end
						   
function graphics.loadPlayer()	-- Loads Player Paddle
	return display.newRect(display.contentWidth/2,
						   display.contentHeight - 32,
						   50, 10)
end

function graphics.drawText(x, y, text)	-- Draws any text
		local options = {
			x = x,
			y = y,
			text = text,
			fontSize = 15,
			align = "center"
		}
		return display.newText(options)
end

function graphics.loadLeftBound()
	return display.newRect(25,
						   display.contentHeight/2,
						   1, display.contentHeight)
end

function graphics.loadRightBound()
	return display.newRect(display.contentWidth - 25,
						   display.contentHeight/2,
						   1, display.contentHeight)
end

return graphics