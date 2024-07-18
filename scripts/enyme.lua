local function newEnemy(x, y)
    local enemy = {
        x = x,
        y = y,
        speed = 50,
        step = 50,
        direction = 1, -- 1 for down, -1 for up
        image = love.graphics.newImage("assests/images/enyme.png")

    }

    function enemy.update(dt)
        enemy.y = enemy.y + enemy.speed * dt * enemy.direction
        -- Change direction when reaching the step
        if enemy.y >= enemy.step + y then
            enemy.direction = -1
        elseif enemy.y <= y then
            enemy.direction = 1
        end
    end
    
    function enemy.draw()
        love.graphics.draw(enemy.image, enemy.x, enemy.y)
    end
            
    return enemy
end

return newEnemy
        