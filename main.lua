-- This is a test ... WIll had just added this hello, hi!
pixel = 600

success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setNewFont(12)
    love.graphics.setColor(0,40,0)
    love.graphics.setBackgroundColor(255,155,255)
 end

 function love.update(dt)
    if love.keyboard.isDown("up") then
       pixel = pixel + 1
    end
    if love.keyboard.isDown("down") then
        pixel = pixel - 1
     end
 end

function love.draw()
    love.graphics.print("Test", 800, pixel)
end
