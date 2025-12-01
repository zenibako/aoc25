import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

function playdate.update()
    gfx.clear()
    gfx.drawCircleAtPoint(200, 120, 50)
end
