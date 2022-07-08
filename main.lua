function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    ladybugImage = love.graphics.newImage('images/ladybug.png')
end


function love.draw()
    love.graphics.setBackgroundColor(96/255, 200/255, 252/255)

    local ladybugWidth = ladybugImage:getWidth()
    local ladybugHeight = ladybugImage:getHeight()
    love.graphics.draw(ladybugImage, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 2, 2, ladybugWidth / 2, ladybugHeight / 2)
end