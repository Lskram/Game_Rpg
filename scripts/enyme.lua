local function newEnemy(x, y)
    local enemy = {
        x = x,
        y = y,
        speed = 50,
        image = love.graphics.newImage("assests/images/enyme.png")

    }

    function enemy.update(dt)
        enemy.y = enemy.y + enemy.speed * dt
    end
    
    function enemy.draw()
        love.graphics.draw(enemy.image, enemy.x, enemy.y)
    end
            
    return enemy
end

return newEnemy
        