function love.load()
    -- Set scaling filter for nice, crisp art
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Set default font size
    love.graphics.setNewFont(32)

    -- Create ladybug table
    ladybug = {}
    ladybug.x = love.graphics.getWidth() / 2
    ladybug.y = love.graphics.getHeight() / 2
    ladybug.image = love.graphics.newImage('images/ladybug.png')
    ladybug.width = ladybug.image:getWidth()
    ladybug.height = ladybug.image:getHeight()
    ladybug.moveSpeed = 300
    ladybug.clickCount = 0
    ladybug.clicksToMove = 5

    -- You can pass functions to tables
    function ladybug:checkWin()
        return ladybug.clickCount >= ladybug.clicksToMove
    end
end


function love.update(dt)
    if ladybug:checkWin() then
        -- dt refers to Delta Time, which is the last frame update in seconds.
        ladybug.y = ladybug.y - ladybug.moveSpeed * dt
    end
end


function love.draw()
    -- Each RGB value takes integers from 0-255, but in the function, each value ranges from 0-1. The solution is to divide each value by 255 
    love.graphics.setBackgroundColor(118/255, 227/255, 158/255)

    -- image, x, y, rotation, scaleX, scaleY, originX, originY
    love.graphics.draw(ladybug.image, ladybug.x, ladybug.y, 0, 1, 1, ladybug.width / 2, ladybug.height / 2)

    -- Black Color for text
    love.graphics.setColor(0, 0, 0)

    -- Winning condition
    if ladybug:checkWin() then
        love.graphics.print('You win!')
    else
        love.graphics.print(ladybug.clickCount .. ' of '.. ladybug.clicksToMove .. ' clicks')
    end

    -- Reset Color
    love.graphics.setColor(1, 1, 1)
end


function love.mousepressed(x, y, button)
    -- Left mouse button
    if button == 1 then
        local distance = distanceBetween(x, y, ladybug.x, ladybug.y)

        -- Ladybug's height is slightly longer
        if distance < ladybug.height / 2 and not ladybug:checkWin() then
            ladybug.clickCount = ladybug.clickCount + 1
        end
    end
end


function distanceBetween(x1, y1, x2, y2)
    -- Using the distance formula
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end