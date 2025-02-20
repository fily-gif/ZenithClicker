local scene = {}

function scene.load()
    love.keyboard.setKeyRepeat(false)
end

local function MouseOnCard(x, y)
    if FloatOnCard and Cards[FloatOnCard]:mouseOn(x, y) then
        return FloatOnCard
    end
    local cid, dist = 0, 1e99
    for j = 1, #Cards do
        if Cards[j]:mouseOn(x, y) then
            local dist2 = MATH.distance(x, y, Cards[j].x, Cards[j].y)
            if dist2 < dist then
                dist = dist2
                cid = j
            end
        end
    end
    if cid > 0 then
        return cid
    end
end

local function mouseMove(x, y)
    MX, MY = x, y
    local new = MouseOnCard(x, y)
    if FloatOnCard ~= new then
        FloatOnCard = new
        if new then
            SFX.play('card_slide_' .. math.random(4), .5)
        end
        GAME.refreshLayout()
    end
end

local function mousePress(x, y, k)
    mouseMove(x, y)
    local C = Cards[FloatOnCard]
    if C then
        if GAME.playing or not C.lock then
            C:setActive(false, k)
        else
            C:flick()
            SFX.play('no')
        end
    end
end

local function keyPress(key)
    if key == 'escape' then
        if not GAME.playing then
            if TASK.lock('sure_quit', 2.6) then
                SFX.play('menuclick')
                MSG.clear()
                MSG('dark', "PRESS AGAIN TO QUIT", 2.6)
            else
                BGM.set('all', 'volume', 0, 1.6)
                SFX.play('menuback')
                SCN.back()
            end
        end
    elseif key == 'z' then
        local W = scene.widgetList.reset
        W._pressTime = W._pressTimeMax * 2
        W._hoverTime = W._hoverTimeMax
        SFX.play('menuclick')
        GAME.cancelAll()
    elseif key == 'space' then
        local W = scene.widgetList.start
        W._pressTime = W._pressTimeMax * 2
        W._hoverTime = W._hoverTimeMax
        if GAME.playing then
            GAME.commit()
        else
            GAME.start()
        end
    elseif key == '\\' then
        if not GAME.playing then
            local unlocked
            for i = 1, #Cards - 1 do
                if Cards[i].lock then
                    Cards[i].lock = false
                    unlocked = true
                    Cards[i]:flick()
                end
            end
            if unlocked then
                SFX.play('supporter')
            end
        end
    elseif GAME.mod_AS > 0 or (not GAME.playing and (key == 'k' or key == 'i')) then
        local C = Cards[#key == 1 and ("asdfghjkl"):find(key, nil, true) or ("qwertyuio"):find(key, nil, true)]
        if C then
            if GAME.playing or not C.lock then
                C:setActive()
            else
                C:flick()
                SFX.play('boardlock_clink')
            end
        end
    end
end

function scene.mouseMove(x, y, dx, dy)
    mouseMove(x, y)
end

local cancelNextClick
function scene.mouseDown(x, y, k)
    if GAME.mod_EX == 0 then
        mousePress(x, y, k)
        if GAME.mod_EX > 0 then
            cancelNextClick = true
        end
    end
end

function scene.mouseClick(x, y, k)
    if cancelNextClick then
        cancelNextClick = false
        return
    end
    if GAME.mod_EX > 0 then
        mousePress(x, y, k)
    end
end

scene.touchDown = mouseMove
scene.touchMove = mouseMove
scene.touchClick = scene.mouseClick

local cancelNextPress
function scene.keyDown(key)
    if GAME.mod_EX == 0 then
        keyPress(key)
        if GAME.mod_EX > 0 then
            cancelNextPress = true
        end
    end
    return true
end

function scene.keyUp(key)
    if cancelNextPress then
        cancelNextPress = false
        return
    end
    if GAME.mod_EX > 0 then
        keyPress(key)
    end
end

function scene.update(dt)
    GAME.update(dt)
    GAME.lifeShow = MATH.expApproach(GAME.lifeShow, GAME.life, dt * 10)
    for i = 1, #Cards do
        Cards[i]:update(dt)
    end
    if love.keyboard.isDown('escape') and GAME.playing then
        GAME.forfeitTimer = GAME.forfeitTimer + dt * MATH.clampInterpolate(4, 6, 10, 2, GAME.questCount)
        if TASK.lock('forfeit_sfx', .0872) then
            SFX.play('detonate1', MATH.clampInterpolate(0, .4, 2, .6, GAME.forfeitTimer))
        end
        if GAME.forfeitTimer > 2.6 then
            SFX.play('detonate2')
            GAME.finish('forfeit')
        end
    else
        if GAME.forfeitTimer > 0 then
            GAME.forfeitTimer = GAME.forfeitTimer - (GAME.playing and 2.6 or 6.2) * dt
        end
    end
end

TextColor = { .7, .5, .3 }
ShadeColor = { .3, .15, 0 }
local shortcut = ('QWERTYUIO'):atomize()
local rankColor = {
    [0] = { 0, 0, 0, 0 },
    { 1,  .1, 0 },
    { 1,  .7, 0 },
    { .5, 1,  0 },
    { 0,  .7, 1 },
    { 1,  .1, 1 },
    { 1,  .8, .5 },
    { .6, 1,  .8 },
    { .4, .9, 1 },
    { 1,  .8, 1 },
}
local gc = love.graphics
local origAuth = gc.newText(FONT.get(30), "All Arts & Sounds from TETR.IO by osk")
local titleText = gc.newText(FONT.get(50), "EXPERT QUICK PICK")
PBText = gc.newText(FONT.get(50))
local sloganText = gc.newText(FONT.get(30), "CROWD THE TOWER!")
local sloganText_EX = gc.newText(FONT.get(30), "THRONG THE TOWER!")
local sloganText_rev = GC.newText(FONT.get(30), "OVERFLOW THE TOWER!")
local Cards = Cards
local TextColor = TextColor
local ShadeColor = ShadeColor
function scene.draw()
    gc.replaceTransform(SCR.origin)
    GC.setColor(1, 1, 1, GAME.bgAlpha * .42)
    GC.mDraw(IMG.floorBG[GAME.bgFloor], SCR.w / 2, SCR.h / 2, nil, math.max(SCR.w / 1920, SCR.h / 1080))
end

function scene.overDraw()
    gc.replaceTransform(SCR.xOy)

    if GAME.playing then
        -- Target combo
        gc.setColor(COLOR.L)
        FONT.set(75)
        GC.mStr(GAME.quests[1].name, 800, 120)
        if GAME.quests[2] then
            gc.setColor(COLOR.DL)
            FONT.set(50)
            GC.mStr(GAME.quests[2].name, 800, 65)
            if GAME.quests[3] then
                gc.setColor(COLOR.LD)
                FONT.set(50)
                GC.mStr(GAME.quests[3].name, 800, 5)
            end
        end

        -- Damage Timer
        gc.setColor(GAME.dmgTimer > GAME.dmgCycle and COLOR.DL or COLOR.lR)
        gc.rectangle('fill', 390, 390, -360 * (GAME.dmgTimer / GAME.dmgDelay), 40)
        gc.setLineWidth(3)
        gc.setColor(COLOR.LD)
        gc.rectangle('line', 390, 390, -360 * (GAME.dmgCycle / GAME.dmgDelay), 40)
        gc.rectangle('line', 390, 390, -360, 40)

        -- Health Bar
        gc.setColor(GAME.life > GAME.dmgWrong and COLOR.L or COLOR.R)
        GC.mRect('fill', 800, 440, 1540 * GAME.lifeShow / 20, 10)

        -- Gravity Timer
        if GAME.mod_GV > 0 then
            gc.setColor(COLOR.DL)
            if GAME.firstClickTimer then
                gc.arc('fill', 'pie', 1300, 270, 40, -1.5708,
                    -1.5708 + 6.2832 * GAME.firstClickTimer / GAME.firstClickDelay)
            else
                gc.circle('fill', 1300, 270, 40)
            end
            gc.setColor(COLOR.LD)
            gc.circle('line', 1300, 270, 40)
        end
    end

    -- Debug
    -- FONT.set(40) gc.setColor(1, 1, 1)
    -- for i = 1, #Cards do
    --     GC.print(Cards[i].touchCount, Cards[i].x, Cards[i].y-260)
    -- end

    -- Thruster
    gc.setColor(rankColor[GAME.rank - 1] or COLOR.L)
    GC.mRect('fill', 800, 975, 420, 26)
    gc.setColor(rankColor[GAME.rank] or COLOR.L)
    GC.mRect('fill', 800, 975, 420 * GAME.xp / (4 * GAME.rank), 26)
    GC.setLineWidth(2)
    gc.setColor(1, 1, 1, .42)
    GC.mRect('line', 800, 975, 420, 26)

    -- Altitude
    FONT.set(40)
    GC.strokePrint('full', 3, COLOR.D, COLOR.L, ("%.1fm"):format(GAME.altitude), 800, 942, nil, 'center')
    GC.strokePrint('full', 3, COLOR.D, COLOR.L, STRING.time_simp(GAME.time), 375, 942)

    -- Current combo
    if GAME.mod_IN < 2 or not GAME.playing then
        gc.setColor(TextColor)
        if GAME.mod_IN == 2 then
            GC.setAlpha(.42)
        end
        local k = math.min(.9, 760 / GAME.modText:getWidth())
        GC.mDraw(GAME.modText, 800, 396, nil, k, k * 1.1)
    end

    -- Cards
    gc.setColor(1, 1, 1)
    if FloatOnCard then
        for i = #Cards, 1, -1 do
            if i ~= FloatOnCard then Cards[i]:draw() end
        end
        Cards[FloatOnCard]:draw()
    else
        for i = #Cards, 1, -1 do Cards[i]:draw() end
    end

    -- Allspin keyboard hint
    if GAME.mod_AS > 0 then
        FONT.set(60)
        for i = 1, #Cards do
            GC.strokePrint('full', 4, ShadeColor, COLOR.lR, shortcut[i], Cards[i].x + 80, Cards[i].y + 120)
        end
    end

    -- Texts
    if GAME.textHide < 1 then
        local d = GAME.textHide * 70
        gc.replaceTransform(SCR.xOy_u)
        gc.setColor(ShadeColor)
        GC.rectangle('fill', -1200, -d, 2400, 70)
        gc.setColor(TextColor)
        gc.replaceTransform(SCR.xOy_ul)
        gc.draw(titleText,
            GAME.exTimer * 205 - 195, titleText:getHeight() / 2 - d, nil,
            1, 1.1 * (1 - 2 * GAME.revTimer), 0, titleText:getHeight() / 2)
        gc.replaceTransform(SCR.xOy_ur)
        gc.draw(PBText, -10, -d, nil, 1, 1.1, PBText:getWidth(), 0)
        -- gc.printf(
        --     ("Personal Best: %.1fm"):format(GAME.mod_EX > 0 and DATA.maxAltitude_ex or DATA.maxAltitude),
        --     0, 0, 1590, 'right', nil, 1, 1.1)

        gc.replaceTransform(SCR.xOy_dl)
        gc.translate(0, d)
        if GAME.revTimer > 0 then
            gc.draw(sloganText, 6, 2 + (GAME.exTimer + GAME.revTimer) * 42, nil, 1, 1.26, 0, origAuth:getHeight())
            gc.draw(sloganText_EX, 6, 2 + (1 - GAME.exTimer + GAME.revTimer) * 42, nil, 1, 1.26, 0, origAuth:getHeight())
            gc.draw(sloganText_rev, 6, 2 + (1 - GAME.revTimer) * 42, nil, 1, 1.26, 0, origAuth:getHeight())
        else
            gc.draw(sloganText, 6, 2 + GAME.exTimer * 42, nil, 1, 1.26, 0, origAuth:getHeight())
            gc.draw(sloganText_EX, 6, 2 + (1 - GAME.exTimer) * 42, nil, 1, 1.26, 0, origAuth:getHeight())
        end
        gc.replaceTransform(SCR.xOy_dr)
        gc.setColor(.26, .26, .26)
        gc.draw(origAuth, -5, 0, nil, 1, 1, origAuth:getDimensions())
    end

    -- Card info
    if not GAME.playing and FloatOnCard then
        local C = Cards[FloatOnCard]
        if C.lock then C = DeckData[C.id=='2P' and -1 or 0] end
        gc.replaceTransform(SCR.xOy_d)
        gc.setColor(ShadeColor)
        GC.setAlpha(.872)
        gc.rectangle('fill', -935 / 2, -140, 935, 110, 10)
        if GAME.anyRev and C.id and GAME['mod_' .. C.id] == 2 then
            FONT.set(60)
            GC.strokePrint('full', 3, ShadeColor, TextColor, C.revName, 195, -145, 2600, 'center', nil, 0.85, 1)
            FONT.set(30)
            GC.strokePrint('full', 2, ShadeColor, TextColor, C.revDesc, 195, -75, 2600, 'center', nil, 0.85, 1)
        else
            FONT.set(60)
            GC.strokePrint('full', 3, ShadeColor, TextColor, C.fullName, 195, -145, 2600, 'center', nil, 0.85, 1)
            FONT.set(30)
            GC.strokePrint('full', 2, ShadeColor, TextColor, C.desc, 195, -75, 2600, 'center', nil, 0.85, 1)
        end
    end

    -- Forfeit panel
    if GAME.forfeitTimer > 0 then
        gc.replaceTransform(SCR.origin)
        gc.setColor(.872, .26, .26, GAME.forfeitTimer * .6)
        gc.rectangle('fill', 0, SCR.h, SCR.w, -SCR.h * GAME.forfeitTimer / 2.6 * .5)
        gc.setColor(.626, 0, 0, GAME.forfeitTimer * .6)
        gc.rectangle('fill', 0, SCR.h * (1 - GAME.forfeitTimer / 2.6 * .5), SCR.w, -5)
    end
end

scene.widgetList = {
    WIDGET.new {
        name = 'start', type = 'button',
        pos = { .5, .5 }, y = -170, w = 800, h = 200,
        color = { .35, .12, .05 },
        textColor = TextColor,
        sound_hover = 'menuhover',
        fontSize = 80, text = "START",
        onClick = function()
            if GAME.playing then
                GAME.commit()
            else
                GAME.start()
            end
        end,
    },
    WIDGET.new {
        name = 'reset', type = 'button',
        pos = { .5, .5 }, x = 500, y = -120, w = 160, h = 100,
        color = 'DR',
        sound_hover = 'menutap',
        sound_release = 'menuclick',
        fontSize = 40, text = "RESET", textColor = 'dR',
        onClick = function() GAME.cancelAll() end,
    },
    WIDGET.new {
        name = 'hint', type = 'hint',
        pos = { .5, .5 }, x = 500, y = -230, w = 80, cornerR = 40,
        color = TextColor,
        fontSize = 80, text = "?",
        sound_hover = 'menutap',
        labelPos = 'leftTop',
        floatText = STRING.trimIndent [[
            Welcome to Zenith Clicker! Select required tarots to send players to scale the tower.
            The higher the tower, the more tricky players will come!
            There's no leaderboard, but how high can you reach?
            Space: Start/Commit   Z: Reset selection   ESC: Forfeit/Quit
        ]],
    }
}

return scene
