-- This is a test ... WIll had just added this hello, hi!
yPos = 0
xPos = 0
success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest") 
    love.graphics.setNewFont(12)
    --love.graphics.setColor(0,0,0)
    love.graphics.setBackgroundColor(255,155,255)
    water = love.graphics.newImage("water1.png")
    boat = love.graphics.newImage("boat7.png")
    animation = newAnimation(love.graphics.newImage("boat-sheet.png"), 32, 32, 1)
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
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
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
    --love.graphics.draw(boat, 700, 400, 0, 5, 5)

    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 700, 400, 0, 5)
    
end

function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end