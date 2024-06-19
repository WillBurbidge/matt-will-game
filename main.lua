-- This is a test ... WIll had just added this hello, hi!


success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setNewFont(12)
    love.graphics.setColor(0,40,0)
    love.graphics.setBackgroundColor(255,155,255)
 end

function love.draw()
    love.graphics.print("Test", 800, 600)
end
