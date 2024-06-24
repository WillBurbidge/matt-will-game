-- This is a test ... WIll had just added this hello, hi!
yPos = 0
xPos = 0
success = love.window.setMode( 1400, 800 )

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest") -- Filter which makes pixelart look nice.
    love.graphics.setNewFont(12)

    love.graphics.setBackgroundColor(255,255,255) -- Set background colour to white.
    water = love.graphics.newImage("water1.png") -- Loading in water
    animation = newAnimation(love.graphics.newImage("boat-sheet.png"), 32, 32, 1) -- Loading in boat animation
 end

 function love.update(dt)

    -- Section for moving tiles when you press keyboard keys.
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

    -- Small bit to change the animationb based on its chosen duration.
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end 

function love.draw()

    -- For loops for generating a block of water
    for i=0,320,32 do
        for j=0,320,32 do
            love.graphics.draw(water,xPos+(i*5),yPos+(j*5), 0, 5, 5)
        end
    end

    -- These two lines are something to do with the animation of the boat.
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 700, 400, 0, 5)
    
end

-- Function to make animation from a spritemap.
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