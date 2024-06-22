-- This is a test ... WIll had just added this hello, hi!
yPos = 600
xPos = 600
success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest") 
    love.graphics.setNewFont(12)
    --love.graphics.setColor(0,0,0)
    love.graphics.setBackgroundColor(255,155,255)
    plant1 = love.graphics.newImage("boat2.png")
 end

 function love.update(dt)
    if love.keyboard.isDown("up") then
       yPos = yPos - 1
    end
    if love.keyboard.isDown("down") then
        yPos = yPos + 1
     end    
    if love.keyboard.isDown("left") then
        xPos = xPos - 1
    end
    if love.keyboard.isDown("right") then
        xPos = xPos + 1
    end
    
end 

function love.draw()
    --love.graphics.circle( "fill", xPos, yPos, 25 )
    --love.graphics.scale( 5, 5 )
    love.graphics.draw(plant1, xPos, yPos, 0, 5, 5)
    
end
