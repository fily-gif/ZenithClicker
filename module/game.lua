local max, min = math.max, math.min
local floor, abs = math.floor, math.abs
local rnd = math.random

local ins, rem = table.insert, table.remove

---@class Question
---@field combo string[]
---@field name love.Text

---@class ReviveTask:Prompt
---@field progress number
---@field textObj love.Text
---@field shortObj love.Text
---@field progObj love.Text

---@class Game
---@field comboStr string
---@field totalFlip number
---@field totalQuest number
---@field totalAttack number
---
---@field dmgHeal number
---@field dmgWrong number
---@field dmgWrongExtra number
---@field dmgTime number
---@field dmgDelay number
---@field dmgCycle number
---@field queueLen number
---
---@field gravDelay false | number
---@field gravTimer false | number
---
---@field playing boolean
---@field time number
---@field gigaTime false | number
---@field questTime number
---@field floorTime number
---@field rank number
---@field xp number
---@field rankupLast boolean
---@field xpLockLevel number
---@field xpLockTimer number
---@field floor number
---@field fatigueSet {time:number, event:table, text:string, desc:string}[]
---@field fatigue number
---@field height number
---@field heightBuffer number
---@field life number
---@field dmgTimer number
---@field chain number
---@field gigaspeed boolean
---@field gigaspeedEntered boolean
---
---@field onAlly boolean
---@field life2 number
---@field maxRank number
---@field DPlock boolean
local GAME = {
    forfeitTimer = 0,
    exTimer = 0,
    revTimer = 0,
    revDeckSkin = false,
    uiHide = 0,
    bgH = 0,
    bgLastH = 0,
    lifeShow = 0,
    lifeShow2 = 0,
    prevPB = -260,
    iconSB = GC.newSpriteBatch(TEXTURE.icon.ingame),
    iconRevSB = GC.newSpriteBatch(TEXTURE.icon.ingame_rev),
    resultSB = GC.newSpriteBatch(TEXTURE.icon.result),
    resultRevSB = GC.newSpriteBatch(TEXTURE.icon.result_rev),

    completion = { -- 0=locked, 1=unlocked, 2=mastered
        EX = 0,
        NH = 0,
        MS = 0,
        GV = 0,
        VL = 0,
        DH = 0,
        IN = 0,
        AS = 0,
        DP = 0,
    },

    mod = {
        EX = 0,
        NH = 0,
        MS = 0,
        GV = 0,
        VL = 0,
        DH = 0,
        IN = 0,
        AS = 0,
        DP = 0,
    },
    hardMode = false,
    numberRev = false,

    quests = {}, ---@type Question[]
    reviveTasks = {}, ---@type ReviveTask[]
    currentTask = false, ---@type false | ReviveTask
    lastFlip = false,
}

GAME.playing = false
GAME.fullHealth = 20
GAME.life = 0
GAME.life2 = 0
GAME.time = 0
GAME.floor = 1
GAME.rank = 1
GAME.xp = 0
GAME.height = 0

local M = GAME.mod
local MD = ModData

--- Unsorted, like {'rEX','NH',...}
function GAME.getHand(real)
    local list = {}
    if real then
        for i = 1, 9 do
            local D = ModData.deck[i]
            local level = M[D.id]
            if level == 1 then
                ins(list, D.id)
            elseif level == 2 then
                ins(list, 'r' .. D.id)
            end
        end
    else
        for _, C in ipairs(Cards) do
            if C.active then
                ins(list, C.id)
            end
        end
    end
    return list
end

---@param list string[] OVERWRITE!!!
---@param extend? boolean use extended combo lib from community
---@param ingame? boolean return a color-string table instead
function GAME.getComboName(list, extend, ingame)
    local len = #list
    if ingame then
        if len == 0 then return {} end

        local fstr = {}

        local comboText
        if not GAME.anyRev and not TABLE.find(list, 'DP') then
            comboText = len == 8 and [["SWAMP WATER"]] or len == 7 and [["SWAMP WATER LITE"]]
            if comboText then
                fstr = comboText:atomize()
                for i = #fstr, 1, -1 do
                    ins(fstr, i, i % #fstr <= 1 and COLOR.dL or COLOR.random(5))
                end
                return fstr
            end
        end

        local str = table.concat(TABLE.sort(list), ' ')
        if ComboData[str] and (ComboData[str].basic or extend) then
            return { COLOR.dL, ComboData[str].name }
        end

        table.sort(list, function(a, b) return MD.prio[a] < MD.prio[b] end)

        for i = 1, len - 1 do
            ins(fstr, MD.textColor[list[i]])
            ins(fstr, MD.adj[list[i]] .. " ")
        end
        ins(fstr, MD.textColor[list[len]])
        ins(fstr, MD.noun[list[len]])
        if M.NH == 2 then
            for i = 1, #fstr, 2 do
                fstr[i] = COLOR.L
            end
        elseif M.IN > 0 then
            local r = rnd(0, 3)
            for i = 1, #fstr, 2 do
                r =
                    r == 0 and rnd(2, 3) or
                    r == 1 and 3 or
                    r == 2 and 0 or rnd(0, 1)
                fstr[i] = { 1, 1, 1, .6 + .13 * r }
            end
        end

        return fstr
    else
        -- Simple
        if len == 0 then return "" end
        if len == 1 then return MD.noun[list[1]] end

        -- Super Set
        if not GAME.anyRev and len >= 7 then
            return
                len == 7 and [["SWAMP WATER LITE"]] or
                len == 8 and [["SWAMP WATER"]] or
                len == 9 and [["SWAMP WATER PRO"]] or
                [["SWAMP WATER X"]]
        elseif GAME.anyRev and STRING.count(table.concat(list), "r") >= 2 then
            local weight = #table.concat(list) - #list
            if weight >= 8 then return RevComboData[min(weight, #RevComboData)] end
        end

        -- Normal Combo
        local str = table.concat(TABLE.sort(list), ' ')
        if ComboData[str] and (ComboData[str].basic or extend) then return ComboData[str].name end

        table.sort(list, function(a, b) return MD.prio[a] < MD.prio[b] end)

        str = ""
        for i = 1, len - 1 do str = str .. MD.adj[list[i]] .. " " end
        return str .. MD.noun[list[len]]
    end
end

---@param event 'start' | 'finish' | 'revSwitched' | 'ingame' | 'init'
function GAME.updateBgm(event)
    if event == 'start' then
        BGM.set(BgmSets.assist, 'volume', 1)
        BGM.set('bass', 'volume', .26)
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7)
        end
    elseif event == 'finish' then
        BGM.set(BgmSets.assist, 'volume', 0)
        local l = TABLE.copy(BgmSets.assist)
        for _ = 1, MATH.clamp(GAME.floor - 6, 2, 4) do
            BGM.set(TABLE.popRandom(l), 'volume', 1)
        end
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7)
            if M.DP == 2 then BGM.set('violin', 'volume', 1) end
        end
    elseif event == 'revSwitched' then
        if GAME.anyRev then
            BGM.set('rev', 'volume', M.DP > 0 and .5 or .7, 4.2)
            BGM.set(BgmSets.assist, 'volume', 0, 4.2)
            if M.DP == 2 then BGM.set('violin', 'volume', 1) end
        else
            BGM.set('rev', 'volume', 0, 2.6)
            local l = TABLE.copy(BgmSets.assist)
            for _ = 1, 2 do
                BGM.set(TABLE.popRandom(l), 'volume', 1, 4.2)
            end
        end
    elseif event == 'ingame' then
        if GAME.floor < 10 then
            BGM.set('staccato', 'volume', MATH.clampInterpolate(1, 1, 6, .26, GAME.floor))
            BGM.set('bass', 'volume', MATH.clampInterpolate(1, .26, 9, 1, GAME.floor))
        else
            local f = GAME.fatigue
            BGM.set('staccato', 'volume', f == 1 and 0 or 1)
            BGM.set('bass', 'volume', min((f - 1) * .4, 1))
        end
    elseif event == 'init' then
        BGM.play(BgmSets.all)
        BGM.set('all', 'volume', 0, 0)
        BGM.set('piano', 'volume', 1)
        BGM.set('piano2', 'pitch', 2, 0)
        BGM.set(TABLE.getRandom(BgmSets.assist), 'volume', 1, 10)
    end
end

function GAME.anim_setMenuHide(t)
    GAME.uiHide = t
    MSG.setSafeY(75 * (1 - GAME.uiHide))
end

function GAME.anim_setMenuHide_rev(t)
    GAME.anim_setMenuHide(1 - t)
end

local floorHeights = {}
for i = 0, 9 do ins(floorHeights, Floors[i].top) end
function GAME.getBgFloor()
    return floor(1 + 9 * MATH.ilLerp(floorHeights, GAME.bgH))
end

function GAME.task_gigaspeed()
    TWEEN.new(function(t) GigaSpeed.textTimer = 1 - 2 * t end):setEase('Linear'):setDuration(2.6):run()
        :setOnFinish(function() GigaSpeed.textTimer = false end)
end

function GAME.task_fatigueWarn()
    for _ = 1, 3 do
        for _ = 1, M.DP == 2 and 1 or 3 do SFX.play('warning', 1, 0, M.GV) end
        TASK.yieldT(1)
    end
end

function GAME.cancelBurn()
    for i = 1, #Cards do Cards[i].burn = false end
end

function GAME.shuffleCards()
    TABLE.shuffle(Cards)
    GAME.refreshLayout()
end

-- for floor = 1, 10 do -- Simulation
--     local stat = { 0, 0, 0, 0, 0 }
--     local sum = 0
--     local buffer = 0
--     for _ = 1, 10000 do
--         local base = .872 + floor ^ .5 / 6
--         local var = floor * .26
--         if false then base, var = base + .626, var * .626 end

--         local r = MATH.clamp(base + var * abs(MATH.randNorm()), 1, 5)
--         buffer = buffer + r
--         if buffer > 8 then
--             r = r - (buffer - 8)
--             buffer = 8
--         end
--         buffer = max(buffer - max(floor / 3, 2), 0)

--         r = MATH.clamp(MATH.roundRnd(r), 1, 5)

--         stat[r] = stat[r] + 1
--         sum = sum + r
--     end
--     print(("Floor %2d   %4d %4d %4d %4d %4d  E(x)=%.2f"):format(
--         floor, stat[1], stat[2], stat[3], stat[4], stat[5],
--         sum / MATH.sum(stat)))
-- end

function GAME.genQuest()
    local combo = {}
    local base = .872 + GAME.floor ^ .5 / 6
    local var = GAME.floor * .26
    if M.DH > 0 then base, var = base + .626, var * .626 end

    local r = MATH.clamp(base + var * abs(MATH.randNorm()), 1, 5)
    if M.DP == 0 then
        GAME.atkBuffer = GAME.atkBuffer + r
        if GAME.atkBuffer > 8 then
            r = r - (GAME.atkBuffer - 8)
            GAME.atkBuffer = 8
        end
        GAME.atkBuffer = max(GAME.atkBuffer - max(GAME.floor / 3, 2), 0)
    end

    local pool = TABLE.copyAll(MD.weight)
    local lastQ = GAME.quests[#GAME.quests]
    if lastQ then pool[lastQ.combo[1]] = nil end
    for _ = 1, MATH.clamp(MATH.roundRnd(r), 1, 5) do
        local mod = MATH.randFreqAll(pool)
        pool[mod] = nil
        ins(combo, mod)
    end

    ins(GAME.quests, {
        combo = combo,
        name = GC.newText(FONT.get(70), GAME.getComboName(TABLE.copy(combo), M.DH == 2, true)),
    })
end

function GAME.questReady()
    GAME.questTime = 0
    GAME.fault = false
    GAME.faultWrong = false
    GAME.dmgWrongExtra = 0
    GAME.gravTimer = false
    for _, C in ipairs(Cards) do C.touchCount, C.isCorrect = 0, false end
    if M.DP > 0 then for _, v in next, GAME.quests[2].combo do Cards[v].isCorrect = 2 end end
    for _, v in next, GAME.quests[1].combo do Cards[v].isCorrect = 1 end
end

function GAME.startRevive()
    if GAME.reviveCount < 260 then
        local power = min(GAME.floor + GAME.reviveCount, 17)
        local maxOut = power == 17
        local powerList = TABLE.new(math.floor(power / 3), 3)
        if power % 3 == 1 then
            if power == maxOut then
                powerList[2] = powerList[2] + 1
            else
                local r = rnd(3)
                powerList[r] = powerList[r] + 1
            end
        elseif power % 3 == 2 then
            powerList[1] = powerList[1] + 1
            powerList[2] = powerList[2] + 1
            powerList[3] = powerList[3] + 1
            local r = rnd(3)
            powerList[r] = powerList[r] - 1
        end
        TABLE.delete(powerList, 0)

        TABLE.clear(GAME.reviveTasks)
        for _, pow in next, powerList do
            local options = {} ---@type Prompt[]
            for _, opt in next, RevivePrompts do
                if opt.rank[1] <= pow and pow <= opt.rank[2] and (not opt.cond or opt.cond()) then
                    local repeated
                    for _, t in next, GAME.reviveTasks do
                        if t.prompt == opt.prompt then
                            repeated = true
                            break
                        end
                    end
                    if not repeated then
                        ins(options, opt)
                    end
                end
            end
            if #options > 0 then
                local task = TABLE.copyAll(TABLE.getRandom(options))
                if task.init then task.init(task) end
                ---@cast task ReviveTask
                task.progress = 0
                task.textObj = GC.newText(FONT.get(30), task.text)
                task.shortObj = GC.newText(FONT.get(30), task.short)
                task.progObj = GC.newText(FONT.get(30), "0/" .. task.target)
                ins(GAME.reviveTasks, task)
            end
        end
        SFX.play('boardlock')
    else
        SFX.play('losestock')
    end
    GAME.currentTask = GAME.reviveTasks[1] or false
    GAME.DPlock = M.DP == 2
end

function GAME.incrementPrompt(prompt, value)
    local t = GAME.currentTask
    if t and prompt == t.prompt then
        local oldProg = t.progress
        t.progress = min(t.progress + (value or 1), t.target)
        if floor(oldProg) ~= floor(t.progress) and not TASK.getLock('noIncrementSFX') then
            SFX.play('boardlock_clink')
            TASK.lock('noIncrementSFX', 0.026)
        end
        if t.progress >= t.target then
            GAME.currentTask = TABLE.next(GAME.reviveTasks, GAME.currentTask)
            if GAME.currentTask then
                SFX.play('boardlock_clear')
            else
                GAME.currentTask = false
                GAME.reviveCount = GAME.reviveCount + 1
                GAME[GAME.getLifeKey(true)] = GAME.fullHealth
                SFX.play('boardlock_revive')
                GAME.DPlock = false
            end
        end
        t.progObj:set(math.floor(t.progress) .. "/" .. t.target)
    end
end

function GAME.nixPrompt(prompt)
    local t = GAME.currentTask
    if t and prompt == t.prompt then
        if t.progress >= 1 then
            SFX.play('boardlock_fail')
            TASK.lock('noIncrementSFX', 0.026)
        end
        t.progress = 0
        t.progObj:set(math.floor(t.progress) .. "/" .. t.target)
    end
end

function GAME.getLifeKey(another)
    if M.DP == 0 then return 'life' end
    return (GAME.onAlly ~= not another) and 'life' or 'life2'
end

function GAME.heal(hp)
    local k = GAME.getLifeKey()
    hp = max(min(hp, GAME.fullHealth - GAME[k]), 0)
    GAME[k] = GAME[k] + hp
    GAME.incrementPrompt('heal', hp)

    GAME.freshLifeState()
end

---@param dmg number
---@param reason 'wrong' | 'time'
---@param toAlly? boolean
function GAME.takeDamage(dmg, reason, toAlly)
    if GAME.currentTask then
        GAME.incrementPrompt('dmg_time')
        GAME.incrementPrompt('dmg_amount', dmg)
        if reason == 'time' then GAME.incrementPrompt('timedmg_time') end
    end

    local k = GAME.getLifeKey(toAlly)
    GAME[k] = max(GAME[k] - dmg, 0)
    SFX.play(
        toAlly and 'inject' or
        dmg <= 1.626 and 'damage_small' or
        dmg <= 4.2 and 'damage_medium' or
        'damage_large', .872
    )
    if GAME[k] <= 0 then
        if GAME[GAME.getLifeKey(not toAlly)] > 0 then
            if toAlly then
                SFX.play('elim')
            else
                GAME.swapControl()
            end
            GAME.startRevive()
            GAME.dmgWrongExtra = 0 -- Being tolerant!
        else
            GAME.finish(reason)
            return true
        end
    else
        GAME.freshLifeState()
    end
end

function GAME.addHeight(h)
    GAME.heightBuffer = GAME.heightBuffer + h * GAME.rank / 4
end

function GAME.addXP(xp)
    GAME.xp = GAME.xp + xp
    if GAME.xpLockLevel < 5 and GAME.rankupLast and GAME.xp >= 2 * GAME.rank then
        GAME.xpLockLevel = 5
    end
    local oldRank = GAME.rank
    local oldLockTimer = GAME.xpLockTimer
    while GAME.xp >= 4 * GAME.rank do
        GAME.xp = GAME.xp - 4 * GAME.rank
        GAME.rank = GAME.rank + 1
        GAME.rankupLast = true
        GAME.xpLockTimer = GAME.xpLockLevel
        GAME.xpLockLevel = max(GAME.xpLockLevel - 1, 1)

        -- Rank skip
        if GAME.xp >= 4 * GAME.rank then
            GAME.rank = GAME.rank + floor(GAME.xp / (4 * GAME.rank))
            -- One more
            if GAME.xp >= 4 * GAME.rank then
                GAME.rank = GAME.rank + 1
                GAME.xp = GAME.xp - 4 * GAME.rank
            end
            GAME.xpLockLevel = 5
        end
    end
    if GAME.rank > GAME.maxRank then
        GAME.rank = GAME.maxRank
        GAME.xp = 4 * GAME.rank
    end
    if GAME.rank ~= oldRank then
        SFX.play('speed_up_' .. MATH.clamp(floor((GAME.rank + .5) / 1.5), 1, 4),
            .4 + .1 * GAME.xpLockLevel * min(GAME.rank / 4, 1))
        if not GAME.gigaspeedEntered and GAME.rank >= GigaSpeedReq[GAME.floor] then
            GAME.setGigaspeedAnim(true)
            SFX.play('zenith_speedrun_start')
            GAME.refreshRPC()
        end
    else
        GAME.xpLockTimer = oldLockTimer
    end
end

function GAME.setGigaspeedAnim(on, finish)
    GAME.gigaspeed = on
    local s = GigaSpeed.alpha
    if on then
        GAME.gigaspeedEntered = true
        TWEEN.new(function(t) GigaSpeed.alpha = MATH.lerp(s, 1, t) end)
            :setUnique('giga'):run()
        TASK.removeTask_code(GAME.task_gigaspeed)
        TASK.new(GAME.task_gigaspeed)
    else
        TWEEN.new(function(t) GigaSpeed.alpha = MATH.lerp(s, 0, t) end):setDuration(finish and 6.26 or 3.55)
            :setUnique('giga'):run()
    end
end

function GAME.upFloor()
    GAME.floor = GAME.floor + 1
    GAME.floorTime = 0
    if M.MS == 2 or M.MS == 1 and GAME.floor % 3 == 2 then GAME.shuffleCards() end
    if M.GV > 0 then GAME.gravDelay = GravityTimer[M.GV][GAME.floor] end
    local F = Floors[GAME.floor]
    local e = F.event
    for i = 1, #e, 2 do
        GAME[e[i]] = GAME[e[i]] + e[i + 1]
    end
    if GAME.dmgTimer > GAME.dmgDelay then GAME.dmgTimer = GAME.dmgDelay end

    local duration = GAME.floor == 10 and 8.72 or 4.2
    TEXT:add {
        text = "Floor",
        x = 160, y = 290, k = 1.6, fontSize = 30,
        color = 'LY', duration = duration,
    }
    TEXT:add {
        text = tostring(GAME.floor),
        x = 240, y = 280, k = 2.6, fontSize = 30,
        color = 'LY', duration = duration, align = 'left',
    }
    TEXT:add {
        text = Floors[GAME.floor].name,
        x = 200, y = 350, k = 1.2, fontSize = 30,
        color = 'LY', duration = duration,
    }
    if GAME.floor > 1 then SFX.play('zenith_levelup_g', 1, 0, M.GV) end
    if GAME.gigaspeed then SFX.play('zenith_split_cleared', 1, 0, -1 + M.GV) end
    if GAME.floor == 10 then
        local roundTime = MATH.roundUnit(GAME.time, .001)
        if GAME.time < STAT.minTime then
            STAT.minTime = roundTime
            STAT.timeDate = os.date("%y.%m.%d %H:%M%p")
            SaveStat()
        end
        if GAME.gigaspeed then
            GAME.gigaTime = GAME.time
            GAME.setGigaspeedAnim(false, true)
            local t = BEST.speedrun[GAME.comboStr]
            SFX.play('applause', GAME.time < t and t < 1e99 and 1 or .42)
            if GAME.time < t then
                BEST.speedrun[GAME.comboStr] = roundTime
                SaveBest()
            end
        end
    end
    GAME.updateBgm('ingame')
    GAME.refreshRPC()
end

local revLetter = setmetatable({
    P = "Ь", R = "ᖉ", T = "ꓕ", Q = "О́", U = "Ո", A = "Ɐ", L = "Γ",
}, { __index = function(_, k) return k end })
function GAME.refreshRPC()
    local detailStr = M.EX > 0 and "EXPERT QUICK PICK" or "QUICK PICK"
    if M.DP > 0 then detailStr = detailStr:gsub("QUICK", "DUAL") end
    if GAME.anyRev then detailStr = detailStr:gsub(".", revLetter) end

    local stateStr
    if GAME.playing then
        stateStr = GAME.gigaspeed and "Speedrun: " or "In Game: "
        stateStr = stateStr .. "F" .. GAME.floor
        local hand = GAME.getHand(true)
        if #hand > 0 then stateStr = stateStr .. " - " .. GAME.getComboName(hand, M.DH == 2) end
    else
        stateStr = "Enjoying Music"
        if M.NH > 0 then stateStr = stateStr .. " (Inst.)" end
        if M.GV > 0 then stateStr = stateStr .. " (+" .. M.GV .. ")" end
        if M.IN > 0 then
            stateStr = stateStr:gsub("j", "r"):gsub("s", "z"):gsub("tch", "dge")
                :gsub("p", "b"):gsub("c", "g"):gsub("t", "d")
        end
    end

    DiscordState = {
        needUpdate = true,
        details = detailStr,
        state = stateStr,
    }
    TASK.lock('RPC_update', 1.6)
end

function GAME.refreshModIcon()
    GAME.iconSB:clear()
    GAME.iconRevSB:clear()
    local hand = GAME.getHand(true)
    table.sort(hand, function(a, b) return MD.prio_icon[a] < MD.prio_icon[b] end)
    local r = 35
    local x, y = -2, -2
    for i, m in next, hand do
        local q = TEXTURE.icon.quad
        if #m == 2 then
            GAME.iconSB:add(q.ingame[m], x * r, y * r, 0, .5, .5, 128 * .5, 128 * .5)
        else
            GAME.iconRevSB:add(q.ingame_rev[m:sub(2)], x * r, y * r, 0, .42, .42, 219 * .5, 219 * .5)
        end
        if i % 2 == 1 then y = y + 2 else x, y = x + 1, y - 3 + (i % 4) end
    end
end

function GAME.refreshResultModIcon()
    GAME.resultSB:clear()
    GAME.resultRevSB:clear()
    local hand = GAME.getHand(true)
    table.sort(hand, function(a, b) return MD.prio_icon[a] < MD.prio_icon[b] end)
    local r = 35
    local x, y = -2, -2
    for i, m in next, hand do
        local q = TEXTURE.icon.quad
        if #m == 2 then
            GAME.resultSB:add(q.result[m], x * r, y * r, 0, .3, .3, 183 * .5, 183 * .5)
        else
            GAME.resultRevSB:add(q.result_rev[m:sub(2)], x * r, y * r, 0, .33, .33, 183 * .5, 183 * .5)
        end
        if i % 2 == 1 then y = y + 2 else x, y = x + 1, y - 3 + (i % 4) end
    end
end

--------------------------------------------------------------

function GAME.refreshCurrentCombo()
    TEXTS.mod:set(GAME.getComboName(GAME.getHand(not GAME.playing), M.DH == 2))
end

function GAME.refreshLayout()
    local baseDist = (M.EX > 0 and 100 or 110) + M.VL * 20
    local baseL, baseR = 800 - 4 * baseDist - 70, 800 + 4 * baseDist + 70
    local dodge = M.VL == 0 and 260 or 220
    local baseY = 726 + 15 * M.GV
    if FloatOnCard then
        local selX = 800 + (FloatOnCard - 5) * baseDist
        for i = 1, #Cards do
            local C = Cards[i]
            if i < FloatOnCard then
                C.tx = MATH.interpolate(1, baseL, FloatOnCard - 1, selX - dodge, i)
                if C.tx ~= C.tx then C.tx = baseL end
            elseif i > FloatOnCard then
                C.tx = MATH.interpolate(#Cards, baseR, FloatOnCard + 1, selX + dodge, i)
                if C.tx ~= C.tx then C.tx = baseR end
            else
                C.tx = selX
            end
            C.ty = baseY - (C.active and 35 or 0) - (i == FloatOnCard and 55 or 0)
        end
    else
        for i, C in ipairs(Cards) do
            C.tx = 800 + (i - 5) * baseDist
            C.ty = baseY - (C.active and 35 or 0) - (i == FloatOnCard and 55 or 0)
        end
    end
end

function GAME.refreshCursor()
    local sum = 0
    for _, v in next, GAME.completion do
        sum = sum + v ^ 1.37851162325373
    end
    CursorProgress = sum / 23.4
end

function GAME.refreshLockState()
    Cards.EX.lock = STAT.maxFloor < 9
    Cards.NH.lock = STAT.maxFloor < 2
    Cards.MS.lock = STAT.maxFloor < 3
    Cards.GV.lock = STAT.maxFloor < 4
    Cards.VL.lock = STAT.maxFloor < 5
    Cards.DH.lock = STAT.maxFloor < 6
    Cards.IN.lock = STAT.maxFloor < 7
    Cards.AS.lock = STAT.maxFloor < 8
    Cards.DP.lock = GAME.completion.DP == 0 -- Possible, try to find the way to play it
end

function GAME.refreshPBText()
    local setStr = table.concat(TABLE.sort(GAME.getHand(true)))
    local height = BEST.highScore[setStr]
    local time = BEST.speedrun[setStr]
    TEXTS.sr:set(time < 1e99 and STRING.time(time) or "")
    if height == 0 then
        TEXTS.pb:set("No Score Yet")
    else
        local f = 0
        for i = 1, #Floors do
            if height < Floors[i].top then
                f = i
                break
            end
        end
        TEXTS.pb:set(("BEST: %.1fm   <F%d>"):format(height, f))
    end
end

function GAME.refreshRev()
    local numberRev = false
    for _, C in ipairs(Cards) do
        if M[C.id] == 2 then
            numberRev = true
            break
        end
    end
    if numberRev ~= GAME.anyRev then
        GAME.anyRev = numberRev
        if not GAME.anyRev then
            GAME.revDeckSkin = false
        end
        local s, e = GAME.revTimer, numberRev and 1 or 0
        TWEEN.new(function(t)
            t = MATH.lerp(s, e, t)
            GAME.revTimer = t
            TextColor[1] = MATH.lerp(.7, .62, t)
            TextColor[2] = MATH.lerp(.5, .1, t)
            TextColor[3] = MATH.lerp(.3, .1, t)
            ShadeColor[1] = MATH.lerp(.3, .1, t)
            ShadeColor[2] = MATH.lerp(.15, 0, t)
            ShadeColor[3] = MATH.lerp(.0, 0, t)
        end):setUnique('revSwitched'):setDuration(.26):run()
        GAME.updateBgm('revSwitched')
    end
end

function GAME.freshLifeState()
    local oldState = GAME.lifeState
    local hp = GAME[GAME.getLifeKey()]
    local newState
    if hp == GAME.fullHealth then
        newState = 'full'
    else
        local dangerDmg = max(GAME.dmgWrong + GAME.dmgWrongExtra, GAME.dmgTime)
        newState = hp <= dangerDmg and 'danger' or 'safe'
    end
    if oldState ~= newState then
        GAME.lifeState = newState
        if newState == 'danger' then
            SFX.play('hyperalert')
        end
    end
end

function GAME.swapControl()
    if GAME[GAME.getLifeKey(true)] > 0 then
        GAME.onAlly = not GAME.onAlly
        GAME.freshLifeState()
        return true
    end
end

function GAME.cancelAll(instant)
    if M.NH == 2 then
        if M.AS == 1 then
            GAME.cancelBurn()
            GAME.fault = true
        end
        return
    end
    TASK.removeTask_code(GAME.task_cancelAll)
    TASK.new(GAME.task_cancelAll, instant)
    if GAME.gravTimer then GAME.gravTimer = GAME.gravDelay end
end

function GAME.task_cancelAll(instant)
    local spinMode = not instant and M.AS > 0
    local list = TABLE.copy(Cards, 0)
    local needFlip = {}
    for i = 1, #Cards do
        needFlip[i] = spinMode or Cards[i].active
    end
    for i = 1, #list do
        if needFlip[i] then
            list[i]:setActive(true)
            if M.AS == 1 then
                list[i].burn = false
            end
            if not instant then
                TASK.yieldT(.026)
            end
        end
    end
end

function GAME.commit()
    if #GAME.quests == 0 then return end

    local hand = TABLE.sort(GAME.getHand(false))
    local q1 = GAME.quests[1].combo
    local q2 = M.DP > 0 and GAME.quests[2].combo

    if GAME.currentTask then
        GAME.incrementPrompt('commit')
        GAME.nixPrompt('keep_no_commit')
        for i = 1, 9 do
            local id = ModData.deck[i].id
            if TABLE.find(hand, id) then
                GAME.incrementPrompt('commit_' .. id)
                GAME.incrementPrompt('commit_' .. id .. '_row')
                GAME.nixPrompt('commit_no_' .. id .. '_row')
            else
                GAME.incrementPrompt('commit_no_' .. id .. '_row')
                GAME.nixPrompt('commit_' .. id .. '_row')
            end
        end
        if #hand == 0 then
            GAME.incrementPrompt('commit_0')
            GAME.incrementPrompt('commit_0_row')
        else
            GAME.nixPrompt('commit_0_row')
            if not GAME.faultWrong then
                GAME.incrementPrompt('commit_' .. #hand .. 'card')
            end
        end
        local maxConn = 0
        local conn = 0
        for _, C in ipairs(Cards) do
            if C.active then
                conn = conn + 1
                maxConn = max(maxConn, conn)
            else
                conn = 0
            end
        end
        if maxConn >= 2 then
            GAME.incrementPrompt('commit_conn_2')
            if maxConn >= 3 then
                GAME.incrementPrompt('commit_conn_3')
                if maxConn >= 4 then
                    GAME.incrementPrompt('commit_conn_4')
                end
            end
        else
            GAME.incrementPrompt('commit_no_conn')
        end
    end

    local correct
    if TABLE.equal(hand, TABLE.sort(q1)) then
        correct = 1
    elseif q2 and TABLE.equal(hand, TABLE.sort(q2)) then
        correct = 2
        GAME.incrementPrompt('pass_second')
    end

    if correct then
        if GAME.currentTask then
            GAME.incrementPrompt('pass')
            for i = 1, #hand do GAME.incrementPrompt('pass_' .. hand[i]) end

            if #hand >= 4 then
                GAME.incrementPrompt('pass_windup')
                if #hand >= 5 then
                    GAME.incrementPrompt('pass_windup3')
                end
            end
        end

        GAME.heal(GAME.dmgHeal)

        local dp = TABLE.find(hand, 'DP')
        local attack = 3
        local xp = 0
        if dp and M.EX <= 2 then attack = attack + 2 end
        if GAME.fault then
            -- Non-perfect
            if GAME.currentTask then
                GAME.incrementPrompt('pass_imperfect')
                GAME.incrementPrompt('pass_imperfect_row')
                GAME.nixPrompt('pass_perfect_row')
                GAME.nixPrompt('keep_no_imperfect')
                GAME.nixPrompt('pass_windup_inb2b')
            end
            xp = xp + 2
            if GAME.chain < 4 then
                SFX.play('clearline', .62)
            else
                if GAME.currentTask then
                    if GAME.chain >= 4 and GAME.chain <= 10 and GAME.chain % 2 == 0 then
                        GAME.incrementPrompt('b2b_break_' .. GAME.chain)
                    end
                    if #hand >= 4 then
                        GAME.incrementPrompt('b2b_break_windup')
                        if #hand >= 5 then
                            GAME.incrementPrompt('b2b_break_windup3')
                        end
                    end
                end
                SFX.play('clearline')
                SFX.play(
                    GAME.chain < 8 and 'b2bcharge_blast_1' or
                    GAME.chain < 12 and 'b2bcharge_blast_2' or
                    GAME.chain < 24 and 'b2bcharge_blast_3' or
                    'b2bcharge_blast_4'
                )
                if GAME.chain >= 8 then
                    SFX.play('thunder' .. rnd(6), MATH.clampInterpolate(8, .7, 16, 1, GAME.chain))
                end
                local k = GAME.onAlly and 'life2' or 'life'
                local oldLife = GAME[k]
                while GAME.chain > 0 and GAME[k] < GAME.fullHealth do
                    GAME.chain = max(GAME.chain - 2, 0)
                    GAME[k] = min(GAME[k] + 1, GAME.fullHealth)
                end
                if GAME[k] > oldLife then GAME.incrementPrompt('heal', GAME[k] - oldLife) end
                if GAME.chain > 0 then
                    attack = attack + GAME.chain
                end
            end
            GAME.chain = 0
        else
            -- Perfect
            if GAME.currentTask then
                GAME.incrementPrompt('pass_perfect')
                GAME.incrementPrompt('pass_perfect_row')
                GAME.nixPrompt('pass_imperfect_row')
                GAME.nixPrompt('keep_no_perfect')
                if #hand >= 4 then
                    GAME.incrementPrompt('pass_windup_perfect')
                    if #hand >= 5 then
                        GAME.incrementPrompt('pass_windup3_perfect')
                    end
                    if GAME.chain >= 4 then
                        GAME.incrementPrompt('pass_windup_inb2b')
                    else
                        GAME.nixPrompt('pass_windup_inb2b')
                    end
                end
            end

            SFX.play(MATH.roll(.626) and 'clearspin' or 'clearquad', .5)
            if correct == 1 then
                attack = attack + 1
                xp = xp + 3
                GAME.chain = GAME.chain + 1
                if GAME.chain < 4 then
                elseif GAME.chain < 8 then
                    if GAME.chain == 4 then SFX.play('b2bcharge_start', .8) end
                    SFX.play('b2bcharge_1', .8)
                elseif GAME.chain < 12 then
                    SFX.play('b2bcharge_2', .8)
                elseif GAME.chain < 24 then
                    SFX.play('b2bcharge_3', .8)
                else
                    SFX.play('b2bcharge_4', .8)
                end
            end
        end
        if GAME.chain >= 4 then
            TEXTS.chain:set(tostring(GAME.chain))
        end

        SFX.play(dp and 'zenith_start_duo' or 'zenith_start', .626, 0, 12 + M.GV)

        if M.DP == 2 then
            if GAME.takeDamage(attack / 4, 'wrong', GAME[GAME.getLifeKey(true)] > 0) then return end
        end

        if M.DP > 0 and GAME[GAME.getLifeKey(true)] == 0 then
            xp = xp / 2
            attack = attack / 2
            attack = floor(attack) + (MATH.roll(attack % 1) and 1 or 0)
        end

        GAME.incrementPrompt('send', attack)
        GAME.totalAttack = GAME.totalAttack + attack
        if not GAME.DPlock then
            GAME.addHeight(attack)
            GAME.addXP(attack + xp)
        end

        if M.MS == 2 then
            local r1 = rnd(2, #Cards - 1)
            local r2, r3
            repeat r2 = rnd(r1 - 2, r1 + 2) until r2 ~= r1 and MATH.between(r2, 1, #Cards)
            repeat r3 = rnd(r1 - 2, r1 + 2) until r3 ~= r1 and r3 ~= r2 and MATH.between(r3, 1, #Cards)
            if GAME.floor <= 8 then
                Cards[r1], Cards[r2] = Cards[r2], Cards[r1]
            else
                Cards[r1], Cards[r2], Cards[r3] = Cards[r2], Cards[r3], Cards[r1]
            end
            GAME.refreshLayout()
        end

        GAME.cancelAll(true)
        GAME.cancelBurn()
        GAME.dmgTimer = min(GAME.dmgTimer + max(2.6, GAME.dmgDelay / 2), GAME.dmgDelay)

        GAME.genQuest()
        rem(GAME.quests, correct)
        local combo = GAME.quests[correct] and GAME.quests[correct].combo or NONE
        if #combo >= 4 then
            SFX.play('garbagewindup_' .. (#combo == 4 and 1 or 3) + (TABLE.find(combo, 'DH') and 1 or 0), 1, 0, M.GV)
        end
        GAME.questReady()
        GAME.totalQuest = GAME.totalQuest + 1

        if M.DP > 0 and correct == 2 then
            if GAME.swapControl() then
                SFX.play('party_ready', 1, 0, M.GV)
            end
        end

        return true
    else
        if GAME.currentTask then
            if #hand >= 7 and not TABLE.find(hand, 'DP') then
                GAME.incrementPrompt(#hand == 8 and 'commit_swamp' or 'commit_swamp_l')
            end
            if
                #hand + #q1 == 9 and
                #hand == #TABLE.subtract(TABLE.copy(hand), q1) or
                q2 and #hand + #q2 == 9 and
                #hand == #TABLE.subtract(TABLE.copy(hand), q2)
            then
                GAME.incrementPrompt('commit_reversed')
            end
        end

        GAME.fault = true
        GAME.faultWrong = true

        if GAME.takeDamage(max(GAME.dmgWrong + GAME.dmgWrongExtra, 1), 'wrong') then return end
        GAME.dmgWrongExtra = GAME.dmgWrongExtra + .5

        if M.GV > 0 then GAME.gravTimer = GAME.gravDelay end
        if M.EX > 0 then
            GAME.cancelAll(true)
        elseif M.AS == 1 then
            GAME.cancelBurn()
        end
    end
end

local function task_startSpin()
    for _, C in ipairs(Cards) do if C.active then C:setActive(true) end end
    for _, C in ipairs(Cards) do
        if C.lock then
            C.lock = false
            C:flick()
        else
            C:spin()
        end
        TASK.yieldT(.01)
    end
    if M.MS > 0 then GAME.shuffleCards() end
end
function GAME.start()
    if TASK.getLock('cannotStart') then
        SFX.play('clutch')
        return
    end
    SCN.scenes.tower.widgetList.hint:setVisible(false)

    SFX.play('menuconfirm', .8)
    SFX.play(Cards.DP.active and 'zenith_start_duo' or 'zenith_start', 1, 0, M.GV)

    GAME.comboStr = table.concat(TABLE.sort(GAME.getHand(true)))
    GAME.prevPB = BEST.highScore[GAME.comboStr]
    if GAME.prevPB == 0 then GAME.prevPB = -260 end
    GAME.playing = true
    GAME.dmgHeal = 2
    GAME.dmgWrong = 1
    GAME.dmgTime = 2
    GAME.dmgTimeMul = 1
    GAME.dmgDelay = 15
    GAME.dmgCycle = 5
    GAME.queueLen = M.NH == 2 and (M.DP == 0 and 1 or 2) or 3

    GAME.time = 0
    GAME.gigaTime = false
    GAME.questTime = 0
    GAME.floorTime = 0
    GAME.rank = 1
    GAME.xp = 0
    GAME.rankupLast = false
    GAME.xpLockLevel = 5
    GAME.xpLockTimer = 0
    GAME.floor = 0
    GAME.fatigueSet = Fatigue[M.EX == 2 and 'rEX' or M.DP == 2 and 'rDP' or 'normal']
    GAME.fatigue = 1
    GAME.height = 0
    GAME.heightBuffer = 0
    GAME.life = 20
    GAME.fullHealth = 20
    GAME.dmgTimer = GAME.dmgDelay
    GAME.chain = 0
    GAME.atkBuffer = 0
    GAME.gigaspeed = false
    GAME.gigaspeedEntered = false

    -- rDP
    GAME.onAlly = false
    GAME.life2 = 20
    GAME.maxRank = 26000
    GAME.reviveCount = 0
    GAME.currentTask = false
    GAME.DPlock = false
    GAME.lastFlip = false
    if M.DP == 2 then
        GAME.maxRank = 8 + 4 * M.EX
        GAME.dmgHeal = 3
    end

    if M.DP > 0 then
        GAME.life = 10
        GAME.life2 = 10
        GAME.fullHealth = 10
    end

    -- Statistics
    GAME.totalFlip = 0
    GAME.totalQuest = 0
    GAME.totalAttack = 0

    GAME.refreshModIcon()

    GAME.upFloor()

    TABLE.clear(GAME.quests)
    for _ = 1, GAME.queueLen do GAME.genQuest() end
    GAME.questReady()

    TASK.removeTask_code(task_startSpin)
    TASK.new(task_startSpin)

    TWEEN.new(GAME.anim_setMenuHide):setDuration(.26):setUnique('uiHide'):run()
    GAME.updateBgm('start')
end

---@param reason 'forfeit' | 'wrong' | 'time'
function GAME.finish(reason)
    SCN.scenes.tower.widgetList.hint:setVisible(true)
    MSG.clear()

    SFX.play(
        reason == 'forfeit' and 'detonated' or
        reason == 'wrong' and 'topout' or
        reason == 'time' and 'losestock' or
        'shatter', .8
    )

    table.sort(Cards, function(a, b) return a.initOrder < b.initOrder end)
    for _, C in ipairs(Cards) do
        if (M[C.id] > 0) ~= C.active then
            C:setActive(true)
        end
        C.touchCount = 0
        C.isCorrect = false
        C.burn = false
        C.charge = 0
    end

    GAME.playing = false
    GAME.life, GAME.life2 = 0, 0
    GAME.currentTask = false

    local unlockDuo
    if GAME.totalQuest > 2.6 then
        if GAME.floor >= 10 then
            if TABLE.count(GAME.completion, 0) == 9 then
                MSG.clear()
                MSG('dark', "REVERSED MOD unlocked!\nActivate with right click", 6.26)
                SFX.play('notify')
            end
            local duoWasCompleted = GAME.completion.DP
            for k, v in next, M do GAME.completion[k] = max(GAME.completion[k], v) end
            unlockDuo = duoWasCompleted == 0 and GAME.completion.DP > 0
        end

        -- Statistics
        STAT.maxFloor = max(STAT.maxFloor, GAME.floor)
        if GAME.height > STAT.maxHeight then
            STAT.maxHeight = MATH.roundUnit(GAME.height, .01)
            STAT.heightDate = os.date("%y.%m.%d %H:%M%p")
        end
        STAT.totalGame = STAT.totalGame + 1
        STAT.totalTime = MATH.roundUnit(STAT.totalTime + GAME.time, .001)
        STAT.totalFlip = STAT.totalFlip + GAME.totalFlip
        STAT.totalQuest = STAT.totalQuest + GAME.totalQuest
        STAT.totalAttack = STAT.totalAttack + GAME.totalAttack
        STAT.totalHeight = MATH.roundUnit(STAT.totalHeight + GAME.height, .01)
        STAT.totalFloor = STAT.totalFloor + (GAME.floor - 1)
        if GAME.gigaspeedEntered then STAT.totalGiga = STAT.totalGiga + 1 end
        if GAME.floor >= 10 then
            STAT.totalF10 = STAT.totalF10 + 1
        end
        SaveStat()

        -- Best
        local oldPB = BEST.highScore[GAME.comboStr]
        if GAME.height > oldPB then
            BEST.highScore[GAME.comboStr] = MATH.roundUnit(GAME.height, .01)
            local modCount = #GAME.getHand(true)
            if modCount > 0 and oldPB < Floors[9].top and GAME.floor >= 10 then
                local t = modCount == 1 and "MOD MASTERED" or "COMBO MASTERED"
                if GAME.anyRev then t = t:gsub(" ", "+ ", 1) end
                TEXT:add {
                    text = t,
                    x = 800, y = 226, k = 2.6, fontSize = 60,
                    style = 'beat', inPoint = .26, outPoint = .62,
                    color = 'lC', duration = 6.2,
                }
                SFX.play('worldrecord', 1, 0, (modCount == 1 and -1 or 0) + M.GV)
            elseif GAME.floor >= 2 then
                TEXT:add {
                    text = "PERSONAL BEST",
                    x = 800, y = 226, k = 3, fontSize = 60,
                    style = 'beat', inPoint = .26, outPoint = .62,
                    color = 'lY', duration = 6.2,
                }
                SFX.play('personalbest', 1, 0, -.1 + M.GV)
            end
            SFX.play('applause', GAME.floor / 10)
            SaveBest()
        end

        TEXTS.endHeight:set(("%.1fm"):format(GAME.height))
        if GAME.gigaTime then
            local l = STRING.atomize("F10: " .. Floors[10].name .. "   in " .. STRING.time_simp(GAME.gigaTime))
            for i = #l, 1, -1 do ins(l, i, { COLOR.HSV(MATH.lerp(.026, .626, i / #l), .42, 1) }) end
            ins(l, 1, COLOR.LL)
            ins(l, 2, STRING.time_simp(GAME.time) .. "     ")
            TEXTS.endTime:set(l)
        else
            TEXTS.endTime:set(STRING.time_simp(GAME.time) .. "     F" .. GAME.floor .. ": " .. Floors[GAME.floor].name)
        end
        GAME.refreshResultModIcon()
    else
        TEXTS.endHeight:set("")
        TEXTS.endTime:set("")
        GAME.resultSB:clear()
        GAME.resultRevSB:clear()
    end

    GAME.setGigaspeedAnim(false)
    TASK.removeTask_code(task_startSpin)
    GAME.refreshLockState()
    GAME.refreshCurrentCombo()
    GAME.refreshPBText()

    if unlockDuo then
        Cards.DP.lock = true
        TASK.new(function()
            TASK.yieldT(0.42)
            Cards.DP.lock = false
            Cards.DP:spin()
            Cards.DP:bounce(1200, .62)
            SFX.play('supporter')
        end)
    end

    TWEEN.new(GAME.anim_setMenuHide_rev):setDuration(.26):setUnique('uiHide'):run()
    GAME.refreshRPC()
    GAME.updateBgm('finish')
    if reason ~= 'forfeit' then
        TASK.lock('cannotStart', 1)
        TASK.lock('cannotFlip', .626)
    end
end

function GAME.update(dt)
    if GAME.playing then
        -- if love.keyboard.isDown('x') then
        --     GAME.addHeight(dt * 260)
        -- elseif love.keyboard.isDown('c') then
        --     GAME.addXP(dt * 42)
        -- end

        GAME.time = GAME.time + dt
        if GAME.gigaspeed then
            TEXTS.gigatime:set(("%02d:%02d.%03d"):format(
                floor(GAME.time / 60),
                floor(GAME.time % 60),
                GAME.time % 1 * 1000)
            )
        end

        local t = GAME.currentTask
        if t and t.prompt:sub(1, 5) == 'keep_' then
            if t.prompt:sub(6, 12) == 'health_' then
                if t.prompt:sub(13) == GAME.lifeState then
                    GAME.incrementPrompt(t.prompt, dt)
                else
                    GAME.nixPrompt(t.prompt)
                end
            else
                GAME.incrementPrompt(t.prompt, dt)
            end
        end

        GAME.questTime = GAME.questTime + dt
        GAME.floorTime = GAME.floorTime + dt
        if M.GV > 0 and not GAME.gravTimer and GAME.questTime >= 2.6 and GAME.questTime - dt < 2.6 then
            GAME.gravTimer = GAME.gravDelay
        end
        if M.EX == 2 and GAME.floorTime > 30 then
            GAME.dmgWrong = GAME.dmgWrong + 0.05 * dt
        end
        local stage = GAME.fatigueSet[GAME.fatigue]
        if GAME.time >= stage.time then
            local e = stage.event
            for i = 1, #e, 2 do
                GAME[e[i]] = GAME[e[i]] + e[i + 1]
            end
            if GAME.floor == 10 then GAME.updateBgm('ingame') end
            GAME.fatigue = GAME.fatigue + 1
            local duration = 5
            if M.DP == 2 or GAME.fatigue == #GAME.fatigueSet then
                duration = duration * 2
            end
            TEXT:add {
                text = stage.text,
                x = 800, y = 265, fontSize = 30, k = 1.5,
                style = 'score', duration = duration,
                inPoint = .1, outPoint = .26,
                color = stage.color or 'lM',
            }
            TEXT:add {
                text = stage.desc,
                x = 800, y = 300, fontSize = 30,
                style = 'score', duration = duration,
                inPoint = .26, outPoint = .1,
                color = stage.color or 'lM',
            }
            TASK.new(GAME.task_fatigueWarn)
        end

        if not GAME.DPlock then
            local releaseHeight = GAME.heightBuffer
            GAME.heightBuffer = max(MATH.expApproach(GAME.heightBuffer, 0, dt * 6.3216), GAME.heightBuffer - 600 * dt)
            releaseHeight = releaseHeight - GAME.heightBuffer

            GAME.height = GAME.height + releaseHeight
            if M.EX < 2 then
                GAME.height = GAME.height + GAME.rank / 4 * dt * MATH.icLerp(1, 6, Floors[GAME.floor].top - GAME.height)
            else
                GAME.height = max(
                    GAME.height - dt * (GAME.floor * (GAME.floor + 1) + 10) / 20,
                    Floors[GAME.floor - 1].top
                )
            end

            if GAME.height >= Floors[GAME.floor].top then
                GAME.upFloor()
            end

            if GAME.xpLockTimer > 0 then
                GAME.xpLockTimer = GAME.xpLockTimer - dt
            else
                GAME.xp = GAME.xp - dt * (M.EX > 0 and 5 or 3) * GAME.rank * (GAME.rank + 1) / 60
                if GAME.xp <= 0 then
                    GAME.xp = 0
                    if GAME.rank > 1 then
                        GAME.rank = GAME.rank - 1
                        GAME.xp = 4 * GAME.rank
                        GAME.rankupLast = false
                        if GAME.gigaspeed and GAME.rank < GigaSpeedReq[0] then
                            GAME.setGigaspeedAnim(false)
                            SFX.play('zenith_speedrun_end')
                            SFX.play('zenith_speedrun_end')
                        end
                        SFX.play('speed_down', .4 + GAME.xpLockLevel / 10)
                    end
                end
            end
        end

        GAME.dmgTimer = GAME.dmgTimer - dt / GAME.dmgTimeMul
        if GAME.dmgTimer <= 0 then
            GAME.dmgTimer = GAME.dmgCycle
            GAME.takeDamage(GAME.dmgTime, 'time')
        end

        if GAME.gravTimer then
            GAME.gravTimer = GAME.gravTimer - dt
            if GAME.gravTimer <= 0 then
                GAME.faultWrong = false
                GAME.commit()
            end
        end
    end
end

return GAME
