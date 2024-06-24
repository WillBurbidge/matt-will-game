function TilePlacer(posx, posy)
    imager = {0,255}
    imageg = {0,255}
    imageb = {0,255}
    --imageref = {"/Assets/BackgroundTiles/water-lilypad.png","/Assets/BackgroundTiles/tree-1.png"}

    --local water_lilypad_img = love.image.newImageData('/Assets/BackgroundTiles/water-lilypad.png')
    --local tree_1_img = love.image.newImageData('/Assets/BackgroundTiles/tree-1.png')

    --local water_lilypad = love.graphics.newImage(water_lilypad_img)
    --local tree_1 = love.graphics.newImage(tree_1_img)

    --local imageref = {water_lilypad, tree_1}

    -- above replaced with imagearray stuff

    local sprites = {"water1.png","water-sand-edge1.png"}
    spritearray = love.graphics.newArrayImage(sprites)

    local imagedata = love.image.newImageData('map.png')
    local image = love.graphics.newImage(imagedata)
    local scale = 5
	return {
        tilegen = function(self, posx, posy)
        for i = 0,31,1
        do
            for j = 0,31,1
            do
                local r, g, b = imagedata:getPixel(i, j)
                for num = 0,2,1 -- change dependant on number of tiles
                do
                    if imager[num] == r and imageg[num] == g and imageb[num] == b then
                        --newtile = love.graphics.newImage(imageref[num])
                        love.graphics.push()
                        love.graphics.scale(scale, scale)
                        --love.graphics.draw(imageref[num], ((i*32)-posx), ((j*32)-posy)) below replaces this
                        love.graphics.drawLayer(spritearray, num, ((i*32)-posx), ((j*32)-posy))
                        love.graphics.pop()
                    end
                end
            end
        end
        end

	}
end
return TilePlacer