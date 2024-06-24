-- This is a test ... WIll had just added this hello, hi!
yPos = 400
xPos = 700
success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest") 
    love.graphics.setNewFont(12)
    --love.graphics.setColor(0,0,0)
    love.graphics.setBackgroundColor(255,155,255)
    water = love.graphics.newImage("water1.png")
    boat = love.graphics.newImage("boat7.png")
 end

 function love.update(dt)
    if love.keyboard.isDown("up") then
       yPos = yPos + 200*dt
    end
    if love.keyboard.isDown("down") then
        yPos = yPos - 200*dt
     end    
    if love.keyboard.isDown("left") then
        xPos = xPos + 200*dt
    end
    if love.keyboard.isDown("right") then
        xPos = xPos - 200*dt
    end
    
end 

function love.draw()
    --love.graphics.circle( "fill", xPos, yPos, 25 )
    --love.graphics.scale( 5, 5 )
    for i=0,320,32 do
        for j=0,320,32 do
            love.graphics.draw(water,xPos+(i*5),yPos+(j*5), 0, 5, 5)
        end
    end
    love.graphics.draw(water,xPos,yPos, 0, 5, 5)
    love.graphics.draw(boat, 700, 400, 0, 5, 5)
    
end
