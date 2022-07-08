function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    ladybugImage = love.graphics.newImage('images/ladybug.png')
    ladybugX = love.graphics.getWidth() / 2
    ladybugY = love.graphics.getHeight() / 2
end


function love.draw()
    love.graphics.setBackgroundColor(118/255, 227/255, 158/255)

    local ladybugWidth = ladybugImage:getWidth()
    local ladybugHeight = ladybugImage:getHeight()
    love.graphics.draw(ladybugImage, ladybugX, ladybugY, 0, 2, 2, ladybugWidth / 2, ladybugHeight / 2)
end


function love.onmousepressed()

end