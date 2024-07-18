local player = {
    x = 100,
    y = 100,
    speed = 100,
    image = nil
}

function player.load()
    player.image = love.graphics.newImage("assests/images/player.png")
end

function player.update(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end
end

function player.draw()
    love.graphics.draw(player.image, player.x, player.y)
end
        

return player