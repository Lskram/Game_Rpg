**📜 การสร้างแผนที่เกมและการแยกไฟล์ตัวละครเพื่อบังคับในเกมโดยใช้ Love2D และ Tiled 🌟**

---

## 🗺️ การสร้างแผนที่เกมด้วย Tiled และ Love2D

### 1. การสร้างแผนที่ด้วย Tiled

Tiled เป็นเครื่องมือที่ยอดเยี่ยมสำหรับการสร้างแผนที่เกมแบบ 2 มิติ โดยคุณสามารถสร้างและจัดการแผนที่ได้ง่ายๆ ผ่าน GUI

#### 🛠️ ขั้นตอนการสร้างแผนที่

1. **ติดตั้ง Tiled**: ดาวน์โหลดและติดตั้ง Tiled จาก [เว็บไซต์ทางการของ Tiled](https://www.mapeditor.org/).
2. **สร้างโปรเจคใหม่**: เปิด Tiled แล้วสร้างโปรเจคใหม่โดยเลือก "New Map".
3. **ตั้งค่าขนาดของแผนที่**: กำหนดขนาดของแผนที่ เช่น ความกว้างและความสูงของไทล์ (tile width และ tile height).
4. **นำเข้า Tileset**: เพิ่มไฟล์ภาพที่ใช้เป็น Tileset โดยเลือก "New Tileset" และนำเข้าไฟล์ภาพของคุณ.
5. **สร้างเลเยอร์ของแผนที่**: สร้างเลเยอร์ต่างๆ เช่น เลเยอร์พื้นหลัง (background), เลเยอร์วัตถุ (object), และเลเยอร์รายละเอียด (detail).
6. **วาดแผนที่**: ใช้เครื่องมือใน Tiled วาดแผนที่ตามต้องการ.
7. **บันทึกแผนที่**: บันทึกไฟล์แผนที่เป็นไฟล์ `.tmx`.

#### 🌟 ตัวอย่างโค้ดแผนที่

```lua
-- โหลดไลบรารีสำหรับการใช้ Tiled กับ Love2D
local sti = require "sti"

function love.load()
    -- โหลดแผนที่จากไฟล์ .tmx
    map = sti("assets/maps/map.tmx")
end

function love.update(dt)
    -- อัพเดตแผนที่
    map:update(dt)
end

function love.draw()
    -- วาดแผนที่
    map:draw()
end
```

### 2. การแยกไฟล์ตัวละครเพื่อบังคับในเกม

การแยกไฟล์ตัวละครออกมาเป็นไฟล์แยกจะช่วยให้การจัดการและการอัพเดตตัวละครทำได้ง่ายขึ้น

#### 🛠️ ขั้นตอนการสร้างไฟล์ตัวละคร

1. **สร้างไฟล์ตัวละคร**: สร้างไฟล์ Lua ใหม่สำหรับตัวละคร เช่น `player.lua`.
2. **กำหนดคุณสมบัติของตัวละคร**: กำหนดคุณสมบัติต่างๆ เช่น ตำแหน่ง ความเร็ว และภาพ sprite ของตัวละคร.
3. **สร้างฟังก์ชันสำหรับการบังคับตัวละคร**: สร้างฟังก์ชันสำหรับการอัพเดตตำแหน่งของตัวละคร และการวาดภาพตัวละคร.

#### 🌟 ตัวอย่างโค้ดตัวละคร

```lua
-- ไฟล์ player.lua

Player = {}
Player.__index = Player

function Player:new(x, y, speed, image)
    local player = {
        x = x,
        y = y,
        speed = speed,
        image = love.graphics.newImage(image)
    }
    setmetatable(player, Player)
    return player
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end
    
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end
```

#### 🌟 การเรียกใช้ไฟล์ตัวละครในเกม

```lua
-- ไฟล์ main.lua

local Player = require "player"

function love.load()
    player = Player:new(100, 100, 200, "assets/sprites/player.png")
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end
```

---

### 📚 แหล่งข้อมูลเพิ่มเติม

- [Love2D Documentation](https://love2d.org/wiki/Main_Page)
- [Tiled Map Editor](https://www.mapeditor.org/)
- [Simple Tiled Implementation (STI)](https://github.com/karai17/Simple-Tiled-Implementation)
