---@class Card
---@field burn false | number
local Card = {}
Card.__index = Card
function Card.new(d)
    ---@class Card
    local obj = setmetatable({
        initOrder = d.initOrder,
        name = d.name,
        id = d.id,
        frontImg = GC.newImage('assets/' .. d.name .. '.png'),
        backImg = GC.newImage('assets/' .. d.name .. '-back.png'),
        lockfull = d.lockfull and GC.newImage('assets/' .. d.lockfull .. '.png'),
        lockover = d.lockover and GC.newImage('assets/' .. d.lockover .. '.png'),

        lock = false,
        active = false,
        front = true,
        upright = true,

        x = 0,
        y = 0,
        kx = 1,
        ky = 1,
        size = .62,
        r = 0,
        tx = 0,
        ty = 0,

        burn = false,
    }, Card)
    return obj
end

function Card:mouseOn(x, y)
    return
        math.abs(x - self.x) <= self.size * 260 and
        math.abs(y - self.y) <= self.size * 350
end

function Card:setActive(auto)
    local noSpin
    self.active = not self.active
    if GAME.playing then
        if GAME.mod_AS > 0 then
            if self.active then
                if not auto then
                    self.burn = GAME.mod_AS == 1 and 2 + GAME.floor / 2 or 1e99
                end
            else
                if self.burn and not auto then
                    TASK.removeTask_code(GAME.task_cancelAll)
                    local cards = TABLE.copy(Cards, 0)
                    TABLE.delete(cards, self)
                    for _ = 1, 4 do
                        local C = TABLE.popRandom(cards)
                        C:setActive(C.active)
                    end
                    SFX.play('wound')
                end
                self.burn = false
            end
        end
    else
        GAME['mod_' .. self.id] = self.active and 1 or 0
        if self.id == 'EX' then
            BGM.set('expert', 'volume', self.active and 1 or 0)
            local s, e = TABLE.copy(GAME.bg), self.active and { .2, 0, 0 } or { .1, 0, 0 }
            TWEEN.new(function(t)
                GAME.exTimer = self.active and t or (1 - t)
                for i = 1, 3 do
                    GAME.bg[i] = MATH.lerp(s[i], e[i], t)
                end
            end):setDuration(self.active and .26 or .1):run()
        elseif self.id == 'GV' then
            BGM.set('all', 'pitch', self.active and 2 ^ (1 / 12) or 1, .26)
        elseif self.id == 'IN' then
            BGM.set('all', 'highgain', self.active and .7 or 1)
            for _, C in next, Cards do C:flip() end
            noSpin = true
        elseif self.id == 'NH' then
            BGM.set('piano', 'volume', self.active and .2 or 1)
        elseif self.id == 'DH' then
            local W = SCN.scenes.main.widgetList.start
            W.text = self.active and 'COMMENCE' or 'START'
            W:reset()
        end
        GAME:freshComboText()
    end
    if not auto then
        if self.active then
            SFX.play('card_select')
            SFX.play('card_tone_' .. self.name)
            if not noSpin then self:spin() end
        else
            SFX.play('card_slide_' .. math.random(4))
        end
    end
    RefreshLayout()
end

function Card:flip()
    self.front = not self.front
    local s, e = self.kx, self.front and 1 or -1
    TWEEN.new(function(t)
        self.kx = MATH.lerp(s, e, t)
    end):setUnique('flip_' .. self.name):setEase('OutQuad'):setDuration(0.26):run()
end

function Card:shake()
    TWEEN.new(function(t)
        self.size = MATH.lerp(.56, .62, t)
    end):setUnique('shake_' .. self.name):setEase('OutBack'):setDuration(0.26):run()
end

function Card:spin()
    TWEEN.new(function(t)
        if GAME.mod_IN < 1 then
            self.ky = .9 + .1 * math.cos(t * 6.2831853)
            self.r = t * 6.2831853
            self.kx = math.cos((GAME.mod_AS + 1) * t * 6.2831853)
        else
            self.kx = math.cos(t * 6.2831853)
        end
        if not self.front then
            self.kx = -self.kx
        end
    end):setUnique('spin_' .. self.name)
        :setEase(GAME.mod_IN > 0 and 'OutInQuart' or 'OutQuart')
        :setDuration(0.42):run()
end

local activeFrame = GC.newImage('assets/outline.png')

function Card:update(dt)
    self.x = MATH.expApproach(self.x, self.tx, dt * 16)
    self.y = MATH.expApproach(self.y, self.ty, dt * 16)
    if self.burn then
        self.burn = self.burn - dt
        if self.burn <= 0 then
            self.burn = false
            SFX.play('wound_repel')
        end
    end
end

local gc = love.graphics
function Card:draw()
    local img, img2
    if self.lock and self.lockfull then
        img = self.lockfull
    else
        if GAME.mod_IN == 2 then
            img = self.backImg
        else
            img = self.kx * self.ky > 0 and self.frontImg or self.backImg
        end
        img2 = self.lock and self.lockover
    end
    gc.push('transform')
    gc.translate(self.x, self.y)
    gc.rotate(self.r)
    gc.scale(math.abs(self.size * self.kx), self.size * self.ky)
    if self == Cards[FloatOnCard] then
        local dx, dy = (MX - self.x) / (260 * self.size), (MY - self.y) / (350 * self.size)
        dx = MATH.sign(dx) * math.abs(dx) ^ .6
        dy = MATH.sign(dy) * math.abs(dy) ^ .6
        dx, dy = dx * math.abs(dy), dy * math.abs(dx)
        if dx > 0 and dy > 0 then
            dx, dy = -dx, -dy
        elseif dx > 0 then
            dy = -dy
        elseif dy > 0 then
            dx = -dx
        end
        gc.shear(dx * 26e-3, dy * 26e-3)
    end
    GC.setColor(1, 1, 1)
    GC.draw(img, -img:getWidth() / 2, -img:getHeight() / 2)
    if img2 then
        GC.draw(img2, -img2:getWidth() / 2, -img2:getHeight() / 2)
    end
    if self.active then
        if self.burn then
            GC.setColor(love.timer.getTime() * 6 % .6 + .4, 1, 1)
        end
        GC.draw(activeFrame, -activeFrame:getWidth() / 2, -activeFrame:getHeight() / 2)
    end
    gc.pop()
end

return Card
