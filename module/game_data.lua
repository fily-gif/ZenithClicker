GigaSpeedReq = { [0] = 7, 8, 8, 9, 9, 10, 1e99, 1e99, 1e99, 1e99, 1e99 }

GravityTimer = {
    { 9.0, 8.0, 7.5, 7.0, 6.5, 6.0, 5.5, 5.0, 4.5, 4.0 },
    { 3.2, 3.0, 2.8, 2.6, 2.5, 2.4, 2.3, 2.2, 2.1, 2.0 },
}

ModData = {
    deck = {
        { id = 'EX', initOrder = 1, lockfull = false },
        { id = 'NH', initOrder = 2, lockfull = true },
        { id = 'MS', initOrder = 3, lockfull = true },
        { id = 'GV', initOrder = 4, lockfull = true },
        { id = 'VL', initOrder = 5, lockfull = true },
        { id = 'DH', initOrder = 6, lockfull = true },
        { id = 'IN', initOrder = 7, lockfull = true },
        { id = 'AS', initOrder = 8, lockfull = true },
        { id = 'DP', initOrder = 9, lockfull = false },
    },
    name = {
        EX = 'expert',
        NH = 'nohold',
        MS = 'messy',
        GV = 'gravity',
        VL = 'volatile',
        DH = 'doublehole',
        IN = 'invisible',
        AS = 'allspin',
        DP = 'duo',
    },
    fullName = {
        EX = "< EXPERT MODE >",
        NH = "< NO HOLD >",
        MS = "< MESSIER GARBAGE  >",
        GV = "< GRAVITY >",
        VL = "< VOLATILE GARBAGE >",
        DH = "< DOUBLE HOLE GARBAGE >",
        IN = "< INVISIBLE >",
        AS = "< ALL-SPIN >",
        DP = "< DUO >",
        lock = "< LOCKED >",
        lockDP = "< LOCKED? >",
    },
    desc = {
        EX = "A LESS LENIENT CHALLENGE, FOR THOSE WHO DARE",
        NH = "CANCELING IS DISABLED",
        MS = "TAROTS WILL BE SHUFFLED BY FLOOR",
        GV = "AUTO COMMITTING, TIMED BY FLOOR",
        VL = "LARGER GAPS BETWEEN TAROTS, BUT MUST CLICK TWICE",
        DH = "COMBOS WILL SPAWN HARDER",
        IN = "TAROTS FACE DOWN AND HINTS FLASH ONCE EVERY TWO SECONDS",
        AS = "KEYBOARD AVAILABLE, BUT DOUBLE CLICKING IS PENALIZED",
        DP = "FLOOD THE TOWER WITH SOMEONE DOESN'T EXIST",
        lock = "REACH HIGHER FLOOR TO UNLOCK",
        lockDP = "MASTER THIS MOD TO UNLOCK",
    },
    revName = {
        EX = "> THE TYRANT <",
        NH = "> ASCETICISM <",
        MS = "> LOADED DICE <",
        GV = "> FREEFALL <",
        VL = "> LAST STAND <",
        DH = "> DAMNATION <",
        IN = "> THE EXILE <",
        AS = "> THE WARLOCK <",
        DP = "> BLEEDING HEARTS <",
    },
    revDesc = {
        EX = "FEAR, OPPRESSION, AND LIMITLESS AMBITION.",
        NH = "A DETACHMENT FROM EVEN THAT WHICH IS MODERATE.",
        MS = "IN A RIGGED GAME, YOUR MIND IS THE ONLY FAIR ADVANTAGE.",
        GV = "THE GROUND YOU STOOD ON NEVER EXISTED IN THE FIRST PLACE.",
        VL = "STRENGTH ISN'T NECESSARY FOR THOSE WITH NOTHING TO LOSE.",
        DH = "NO MORE SECOND CHANCES.",
        IN = "NEVER UNDERESTIMATE BLIND FAITH.",
        AS = "INTO REALMS BEYOND HEAVEN AND EARTH.",
        DP = "EVEN AS WE BLEED, WE KEEP HOLDING ON...",
    },
    weight = {
        EX = 13, --  8 + 5
        NH = 12, --  8 + 4
        MS = 14, -- 10 + 4
        GV = 12, -- 10 + 2
        VL = 17, -- 15 + 2
        DH = 12, --  8 + 4
        IN = 7,  --  6 + 1
        AS = 13, -- 10 + 3
        DP = 4,  --  3 + 1
    },
    color = {
        EX = { COLOR.HEX "89590B" },
        NH = { COLOR.HEX "FF00D4" },
        MS = { COLOR.HEX "FFB400" },
        GV = { COLOR.HEX "FFFF00" },
        VL = { COLOR.HEX "FF1500" },
        DH = { COLOR.HEX "47ACFF" },
        IN = { COLOR.HEX "BD24FF" },
        AS = { COLOR.HEX "00FED4" },
        DP = { COLOR.HEX "FF8C9D" },
    },
    textColor = {
        EX = { COLOR.HEX "C29F68" },
        NH = { COLOR.HEX "FF8BEC" },
        MS = { COLOR.HEX "FFD572" },
        GV = { COLOR.HEX "F7FF8A" },
        VL = { COLOR.HEX "FF978D" },
        DH = { COLOR.HEX "A6D5FF" },
        IN = { COLOR.HEX "E8B3FF" },
        AS = { COLOR.HEX "93FFE0" },
        DP = { COLOR.HEX "FFC0C9" },
    },
    prio = { IN = 0, MS = 1, VL = 2, NH = 3, DH = 4, AS = 5, GV = 6, EX = 7, DP = 8, rIN = 0, rMS = 1, rVL = 2, rNH = 3, rDH = 4, rAS = 5, rGV = 6, rEX = 7, rDP = 8 },
    prio_icon = { EX = 0, DP = 1, DH = 2, VL = 3, GV = 4, NH = 5, MS = 6, IN = 7, AS = 8, rEX = 0, rDP = 1, rDH = 2, rVL = 3, rGV = 4, rNH = 5, rMS = 6, rIN = 7, rAS = 8 },
    adj = {
        IN = "INVISIBLE",
        MS = "MESSY",
        VL = "VOLATILE",
        NH = "HOLDLESS",
        DH = "DOUBLE HOLE",
        AS = "ALL-SPIN",
        GV = "GRAVITY",
        EX = "EXPERT",
        DP = "DUO",
        rIN = "BELIEVED",
        rMS = "DECEPTIVE",
        rVL = "DESPERATE",
        rNH = "ASCENDANT",
        rDH = "DAMNED",
        rAS = "OMNI-SPIN",
        rGV = "COLLAPSED",
        rEX = "TYRANNICAL",
        rDP = "PIERCING",
    },
    noun = {
        IN = "INVISIBLITY",
        MS = "MESSINESS",
        VL = "VOLATILITY",
        NH = "NO HOLD",
        DH = "DOUBLE HOLE",
        AS = "ALL-SPIN",
        GV = "GRAVITY",
        EX = "EXPERT",
        DP = "DUO",
        rIN = "BELIEF",
        rMS = "DECEPTION",
        rVL = "DESPERATION",
        rNH = "ASCENSION",
        rDH = "DAMNATION",
        rAS = "OMNI-SPIN",
        rGV = "COLLAPSE",
        rEX = "TYRANNY",
        rDP = "HEARTACHE",
    },
}

ComboData = {
    -------- EX NH MS GV VL DH IN AS DP --------
    { set = '   NH    GV               ', name = "a modern classic",          basic = true },
    { set = '   NH MS       DH         ', name = "deadlock",                  basic = true },
    { set = '      MS       DH    AS   ', name = "the escape artist",         basic = true },
    { set = '         GV       IN      ', name = "the grandmaster",           basic = true },
    { set = 'EX NH          DH         ', name = "emperor's decadence",       basic = true },
    { set = 'EX    MS    VL DH         ', name = "divine mastery",            basic = true },
    { set = '   NH                AS   ', name = "the starving artist",       basic = true },
    { set = 'EX          VL       AS   ', name = "the con artist",            basic = true },
    { set = 'EX                      DP', name = "trained profesionals",      basic = true },
    { set = 'EX    MS                  ', name = "block rationing",           basic = true },

    { set = '      MS          IN      ', name = "scrambled rainbow" },
    { set = 'EX NH                AS   ', name = "positioning master" },

    -- Contents below are ideas from tetr.io's community:
    -- https://docs.google.com/spreadsheets/d/1 syh3q2oiduCZb1cJ5QI95Y2XhhedAfhv4YnEH9z2tbc
    { set = '                  IN AS   ', name = "the abstract artist" },
    { set = '               DH    AS   ', name = "the deal with the devil" },
    { set = '               DH IN      ', name = "the ghost" },
    { set = '               DH IN AS   ', name = "the libertine" },
    { set = '            VL       AS   ', name = "water from stone" },
    { set = '            VL    IN      ', name = "ruthlessness" },
    { set = '            VL    IN AS   ', name = "eccentric recluse" },
    { set = '            VL DH         ', name = "lucifier" },
    { set = '            VL DH    AS   ', name = "forbidden sorcery" },
    { set = '            VL DH IN      ', name = "chasm" },
    { set = '         GV          AS   ', name = "the juggler" },
    { set = '         GV       IN      ', name = "the grandmaster" },
    { set = '         GV       IN AS   ', name = "the spinmaster" },
    { set = '         GV    DH         ', name = "the speed demon" },
    { set = '         GV    DH    AS   ', name = "the texting driver" },
    { set = '         GV    DH IN      ', name = "the drunk driver" },
    { set = '         GV VL            ', name = "comfort food" },
    { set = '         GV VL       AS   ', name = "the gladiator" },
    { set = '         GV VL    IN      ', name = "connection issues" },
    { set = '         GV VL    IN AS   ', name = "immense pressure" },
    { set = '         GV VL DH         ', name = "temptation" },
    { set = '         GV VL DH IN      ', name = "nightmare" },
    { set = '      MS             AS   ', name = "roulette wheel" },
    { set = '      MS          IN      ', name = "blind bet" },
    { set = '      MS       DH         ', name = "messy double hole" },
    { set = '      MS       DH    AS   ', name = "the escape artist" },
    { set = '      MS       DH IN      ', name = "the stealth ninja" },
    { set = '      MS       DH IN AS   ', name = "nascent" },
    { set = '      MS    VL            ', name = "swiss cheese" },
    { set = '      MS    VL       AS   ', name = "cream cheese" },
    { set = '      MS    VL    IN      ', name = "starstruck" },
    { set = '      MS    VL DH         ', name = "utter trash" },
    { set = '      MS    VL DH    AS   ', name = "blue cheese" },
    { set = '      MS    VL DH IN      ', name = "the night watchman" },
    { set = '      MS GV               ', name = "cheese race" },
    { set = '      MS GV          AS   ', name = "rough sketch" },
    { set = '      MS GV    DH         ', name = "double down" },
    { set = '      MS GV VL            ', name = "survival" },
    { set = '      MS GV VL    IN AS   ', name = "mortal chaos" },
    { set = '      MS GV VL DH         ', name = "quadruple down" },
    { set = '      MS GV VL DH    AS   ', name = "killer clown" },
    { set = '      MS GV VL DH IN      ', name = "slaughterhouse" },
    { set = '   NH                AS   ', name = "the starving artist" },
    { set = '   NH             IN      ', name = "helen keller" },
    { set = '   NH             IN AS   ', name = "the blind artist" },
    { set = '   NH          DH         ', name = "purgatory" },
    { set = '   NH          DH    AS   ', name = "shapeshifter" },
    { set = '   NH          DH IN      ', name = "blindside" },
    { set = '   NH       VL            ', name = "resistance" },
    { set = '   NH       VL    IN      ', name = "justice" },
    { set = '   NH       VL DH         ', name = "judgment" },
    { set = '   NH       VL DH    AS   ', name = "the street artist" },
    { set = '   NH    GV               ', name = "a modern classic" },
    { set = '   NH    GV          AS   ', name = "a modern twist" },
    { set = '   NH    GV       IN      ', name = "evanescence" },
    { set = '   NH    GV       IN AS   ', name = "divine failure" },
    { set = '   NH    GV    DH         ', name = "damnation" },
    { set = '   NH    GV    DH    AS   ', name = "backbar" },
    { set = '   NH    GV    DH IN AS   ', name = "cheat code" },
    { set = '   NH    GV VL            ', name = "trational" },
    { set = '   NH    GV VL    IN      ', name = "the black hole" },
    { set = '   NH    GV VL DH         ', name = "nephalem" },
    { set = '   NH    GV VL DH    AS   ', name = "demonic possesion" },
    { set = '   NH MS                  ', name = "all in" },
    { set = '   NH MS       DH         ', name = "deadlock" },
    { set = '   NH MS       DH    AS   ', name = "locksmith" },
    { set = '   NH MS       DH IN      ', name = "unfinished business" },
    { set = '   NH MS       DH IN AS   ', name = "disappearance" },
    { set = '   NH MS    VL    IN      ', name = "drowned" },
    { set = '   NH MS    VL DH         ', name = "deadbolt" },
    { set = '   NH MS    VL DH IN      ', name = "blind faith" },
    { set = '   NH MS GV               ', name = "atlas' burden" },
    { set = '   NH MS GV    DH         ', name = "futile struggle" },
    { set = '   NH MS GV    DH IN      ', name = "misdrop haven" },
    { set = '   NH MS GV VL            ', name = "quadruple threat" },
    { set = '   NH MS GV VL DH         ', name = "quintuple threat" },
    { set = 'EX                   AS   ', name = "dancing queen" },
    { set = 'EX                IN      ', name = "emperor's dilemma" },
    { set = 'EX                IN AS   ', name = "expertise" },
    { set = 'EX             DH         ', name = "the devil's temptation" },
    { set = 'EX             DH    AS   ', name = "loki" },
    { set = 'EX             DH IN AS   ', name = "reverse quadruple threat" },
    { set = 'EX          VL            ', name = "icarus" },
    { set = 'EX          VL       AS   ', name = "the con artist" },
    { set = 'EX          VL    IN      ', name = "bounty hunter" },
    { set = 'EX          VL    IN AS   ', name = "insanity" },
    { set = 'EX          VL DH         ', name = "the mad lord" },
    { set = 'EX          VL DH IN      ', name = "corruption" },
    { set = 'EX          VL DH IN AS   ', name = "reverse quintuple threat" },
    { set = 'EX       GV               ', name = "inviticus" },
    { set = 'EX       GV          AS   ', name = "master of the t" },
    { set = 'EX       GV       IN      ', name = "the super gm (grandmaster)" },
    { set = 'EX       GV       IN AS   ', name = "mastermind" },
    { set = 'EX       GV    DH         ', name = "the daredevil" },
    { set = 'EX       GV VL            ', name = "relaxation" },
    { set = 'EX       GV VL       AS   ', name = "enirsia " },
    { set = 'EX       GV VL    IN      ', name = "lateness" },
    { set = 'EX       GV VL    IN AS   ', name = "speed the collapse" },
    { set = 'EX    MS                  ', name = "rational reasoning" },
    { set = 'EX    MS             AS   ', name = "the rich gambler" },
    { set = 'EX    MS          IN AS   ', name = "the mathematician" },
    { set = 'EX    MS    VL            ', name = "the wolf of wall street" },
    { set = 'EX    MS    VL       AS   ', name = "the hacker" },
    { set = 'EX    MS    VL    IN AS   ', name = "reload" },
    { set = 'EX    MS    VL DH         ', name = "divine mastery" },
    { set = 'EX    MS    VL DH    AS   ', name = "false security" },
    { set = 'EX    MS GV               ', name = "mining operation" },
    { set = 'EX    MS GV    DH         ', name = "mining for netherite" },
    { set = 'EX    MS GV VL            ', name = "juggernaut" },
    { set = 'EX    MS GV VL    IN      ', name = "hunted" },
    { set = 'EX NH                     ', name = "a true leader" },
    { set = 'EX NH                AS   ', name = "indecision" },
    { set = 'EX NH             IN      ', name = "the friar" },
    { set = 'EX NH             IN AS   ', name = "black magic" },
    { set = 'EX NH          DH         ', name = "emperor's decadence" },
    { set = 'EX NH          DH IN AS   ', name = "futile spectacle" },
    { set = 'EX NH       VL       AS   ', name = "the scam leader" },
    { set = 'EX NH       VL    IN AS   ', name = "loading screen" },
    { set = 'EX NH    GV               ', name = "beyond death" },
    { set = 'EX NH    GV          AS   ', name = "beyond the afterdeath" },
    { set = 'EX NH    GV       IN      ', name = "still water" },
    { set = 'EX NH    GV       IN AS   ', name = "paragon" },
    { set = 'EX NH    GV    DH    AS   ', name = "the killscreen" },
    { set = 'EX NH    GV VL            ', name = "cutting edge" },
    { set = 'EX NH    GV VL    IN      ', name = "foresight" },
    { set = 'EX NH MS                  ', name = "online gambling" },
    { set = 'EX NH MS       DH         ', name = "impasse" },
    { set = 'EX NH MS    VL DH         ', name = "no holds barred" },
    { set = 'EX NH MS GV               ', name = "atlas' lament" },
    { set = 'EX NH MS GV VL            ', name = "oppression" },
}

RevComboData = {
    "Z", "S", "J", "L", "T", "O", "I",
    [["BLIGHT"]],
    [["DESOLATION"]],
    [["HAVOC"]],
    [["PANDEMONIUM"]],
    [["INFERNO"]],
    [["PURGATORY"]],
    [["PERDITION"]],
    [["CATACLYSM"]],
    [["ANNIHILATION"]],
    [["ARMAGEDDON"]],
    [["ABYSS"]],
    [["APOCALYPSE"]], -- not used
}

Floors = {
    [0] = { top = 0, name = "The Basement" },
    { top = 50,   event = {},                                                 name = "Hall of Beginnings" },
    { top = 150,  event = { 'dmgDelay', -2, 'dmgWrong', 1 },                  name = "The Hotel" },
    { top = 300,  event = { 'dmgDelay', -2, 'dmgCycle', -.5 },                name = "The Casino" },
    { top = 450,  event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                name = "The Arena" },
    { top = 650,  event = { 'dmgDelay', -1, 'dmgCycle', -.5, 'dmgWrong', 1 }, name = "The Museum" },
    { top = 850,  event = { 'dmgDelay', -1, 'dmgTime', 1 },                   name = "Abandoned Offices" },
    { top = 1100, event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                name = "The Laboratory" },
    { top = 1350, event = { 'dmgDelay', -1, 'dmgCycle', -.5 },                name = "The Core" },
    { top = 1650, event = { 'dmgDelay', -.5, 'dmgWrong', 1 },                 name = "Corruption" },
    { top = 1e99, event = { 'dmgDelay', -.5, 'dmgCycle', -.5, 'dmgTime', 1 }, name = "Platform of the Gods" },
    -- Initial: Delay=15. Cycle=5, Wrong=1
    -- Total: Delay-10, Cycle-3, Wrong+4
}

Fatigue = {
    normal = {
        { time = 300, event = { 'dmgTimeMul', -.1 }, text = "FATIGUE SETS IN…", desc = "TimerSpeed++" },
        { time = 330, event = { 'dmgCycle', -.5, 'dmgWrong', 1 }, text = "YOUR BODY GROWS WEAK…", desc = "DmgCycle--   Damage++" },
        { time = 360, event = { 'dmgTimeMul', -.1, 'dmgHeal', -1 }, text = "ALL SENSES BLUR TOGETHER…", desc = "TimerSpeed++   Heal--" },
        { time = 390, event = { 'dmgTimeMul', -.1, 'dmgWrong', 1 }, text = "YOUR CONSCIOUSNESS FADES…", desc = "TimerSpeed++   Damage++" },
        { time = 420, event = { 'dmgTimeMul', -.2, 'dmgCycle', -.5 }, text = "THIS IS THE END", desc = "TimerSpeed++   DmgCycle--" },
        { time = 1e99 }, -- Total: dmgTimeMul-50%, Cycle-1, Wrong+2
    },
    rEX = {
        { time = 240, event = { 'dmgTimeMul', -.2 }, text = "YOUR POWER SLIPS…", desc = "TimerSpeed++" },
        { time = 270, event = { 'dmgWrong', 2 }, text = "WHISPERS OF DISCONTENT SPREAD…", desc = "Damage++" },
        { time = 300, event = { 'dmgCycle', -1 }, text = "PROTESTERS LINE THE STREETS…", desc = "DmgCycle--" },
        { time = 330, event = { 'dmgTimeMul', -.2, 'dmgWrong', 2, }, text = "YOUR CLOSEST ALLIES DEFECT…", desc = "TimerSpeed++   Damage++" },
        { time = 360, event = { 'dmgTimeMul', -.2, 'dmgHeal', -1 }, text = "PARANOIA CLOUDS YOUR JUDGEMENT…", desc = "TimerSpeed++   Heal--" },
        { time = 390, event = { 'dmgCycle', -.5, 'dmgWrong', 1 }, text = "THE REVOLUTION HAS BEGUN…", desc = "DmgCycle--   Damage++" },
        { time = 420, event = { 'dmgTimeMul', -.3 }, text = "THE END OF AN ERA", desc = "TimerSpeed++++" },
        { time = 1e99 }, -- Total: dmgTimeMul-90%, Cycle-1, Wrong+5
    },
    rDP = {
        { time = 20,  event = {}, text = [[YOUR PASSION FADES..]] },                        -- MESS+
        { time = 40,  event = {}, text = [[THEIR REPLIES BECOME LESS ENGAGED..]] },         -- MESS++
        { time = 60,  event = {}, text = [[YOU FEELS NEGLECTED..]] },                       -- MESS+++
        { time = 80,  event = {}, text = [[THEY SUCCESSFULLY APOLOGIZES.?]] },              -- MESS-
        { time = 100, event = {}, text = [[THINGS ARE BACK TO HOW THEY USED TO BE.!]] },    -- MESS---
        { time = 120, event = {}, text = [[MINOR ISSUES BECOME LARGE CONFLICTS..]] },       -- MESS++
        { time = 140, event = {}, text = [[YOU BLAMES THEY FOR THEIR OWN PROBLEMS..]] },    -- MESS+++
        { time = 160, event = {}, text = [[THEY WOULD RATHER SPEND TIME ALONE..]] },        -- REVIVE++
        { time = 180, event = {}, text = [[YOU PROMISES TO CHANGE..]] },                    -- MESS--
        { time = 200, event = {}, text = [[PROMISES ARE BROKEN..]] },                       -- +4 PERMA
        { time = 220, event = {}, text = [[CONVERSATIONS DEVOLVE TO SHOUTING MATCHES..]] }, -- MESS+++
        { time = 240, event = {}, text = [[ALL TRUST HAS WITHERED AWAY..]] },               -- MESS++
        { time = 260, event = {}, text = [[THEY SETS AN ULTIMATUM..]] },                    -- MESS++
        { time = 280, event = {}, text = [[YOU CAN'T BE BOTHERED ANYMORE..]] },             -- MESS++
        { time = 300, event = {}, text = [[ONE LAST PAINFUL ARGUMENT..]] },                 -- DMG+
        { time = 320, event = {}, text = [[GOODBYE.]] },                                    -- REVIVE=INF
        { time = 360, event = {}, text = [["I MISS YOU"]] },                                -- MESS---
        { time = 380, event = {}, text = [[MAYBE IT CAN STILL WORK.?]] },                   -- MESS-
        { time = 400, event = {}, text = [[GOODBYE.]] },                                    -- +12 PERMA
        { time = 1e99 },
    },
}

local function rndMod(t)
    local d = ModData.deck[math.random(9)].id
    t.prompt = t.prompt:repD(d)
    t.text = t.text:repD(ModData.adj[d])
    t.short = t.short:repD(d)
end

---@class Prompt
---@field rank number
---@field prompt string
---@field target number
---@field short string
---@field text string
---@field cond? fun():boolean
---@field init? fun(t:Prompt)

---@type Prompt[]
RevivePrompts = {
    { rank = 1, prompt = 'activate',             target = 40,  short = "Activate 40",             text = "Activate 40 cards" },
    { rank = 1, prompt = 'activate',             target = 100, short = "Activate 100",            text = "Activate 100 cards" },
    { rank = 1, prompt = 'cancel',               target = 40,  short = "Cancel 40",               text = "Cancel 40 cards" },
    { rank = 1, prompt = 'cancel',               target = 80,  short = "Cancel 80",               text = "Cancel 80 cards" },
    { rank = 1, prompt = 'cancel',               target = 120, short = "Cancel 120",              text = "Cancel 120 cards" },
    { rank = 1, prompt = 'flip',                 target = 20,  short = "Flip 20",                 text = "Flip 20 cards" },
    { rank = 1, prompt = 'flip',                 target = 80,  short = "Flip 80",                 text = "Flip 80 cards" },
    { rank = 1, prompt = 'flip',                 target = 300, short = "Flip 300",                text = "Flip 300 cards" },
    { rank = 1, prompt = 'flip_single',          target = 10,  short = "Flip single 10",          text = "Flip single card\n10 times in a row" },
    { rank = 1, prompt = 'flip_single',          target = 20,  short = "Flip single 20",          text = "Flip single card\n20 times in a row" },
    { rank = 1, prompt = 'commit',               target = 6,   short = "Commit x 6",              text = "Commit 6 times" },
    { rank = 1, prompt = 'commit',               target = 15,  short = "Commit x 15",             text = "Commit 15 times" },
    { rank = 1, prompt = 'commit',               target = 30,  short = "Commit x 30",             text = "Commit 30 times" },
    { rank = 1, prompt = 'commit_$1',            target = 2,   short = "Commit $1 x 2",           text = "Commit 2 times\nwith $1",                        init = rndMod },
    { rank = 1, prompt = 'commit_$1',            target = 4,   short = "Commit $1 x 4",           text = "Commit 4 times\nwith $1",                        init = rndMod },
    { rank = 1, prompt = 'commit_$1_row',        target = 2,   short = "2 Chain with $1",         text = "Commit 2 times\nwith $1 in a row",               init = rndMod },
    { rank = 1, prompt = 'commit_$1_row',        target = 3,   short = "3 Chain with $1",         text = "Commit 3 times\nwith $1 in a row",               init = rndMod },
    { rank = 1, prompt = 'commit_no_$1_row',     target = 2,   short = "2 Chain without $1",      text = "Commit 2 times\nwithout $1 in a row",            init = rndMod },
    { rank = 1, prompt = 'commit_no_$1_row',     target = 3,   short = "3 Chain without $1",      text = "Commit 3 times\nwithout $1 in a row",            init = rndMod },
    { rank = 1, prompt = 'commit_0',             target = 4,   short = "Commit NOTHING x 4",      text = "Commit NOTHING\n4 times" },
    { rank = 1, prompt = 'commit_0',             target = 6,   short = "Commit NOTHING x 6",      text = "Commit NOTHING\n6 times" },
    { rank = 1, prompt = 'commit_0',             target = 8,   short = "Commit NOTHING x 8",      text = "Commit NOTHING\n8 times" },
    { rank = 1, prompt = 'commit_0_row',         target = 3,   short = "3 x Spam commit",         text = "Commit NOTHING\n3 times in a row" },
    { rank = 1, prompt = 'commit_no_conn',       target = 1,   short = "Commit no conn",          text = "Commit without consecutive cards" },
    { rank = 1, prompt = 'commit_conn_2',        target = 1,   short = "Commit 2 conn",           text = "Commit with 2 consecutive cards" },
    { rank = 1, prompt = 'commit_conn_3',        target = 1,   short = "Commit 3 conn",           text = "Commit with 3 consecutive cards" },
    { rank = 1, prompt = 'commit_conn_4',        target = 1,   short = "Commit 4 conn",           text = "Commit with 4 consecutive cards" },
    { rank = 1, prompt = 'commit_swamp_l',       target = 1,   short = "Commit SWAMP WATER LITE", text = "Commit SWAMP WATER LITE" },
    { rank = 1, prompt = 'commit_swamp',         target = 1,   short = "Commit SWAMP WATER",      text = "Commit SWAMP WATER" },
    { rank = 1, prompt = 'commit_reversed',      target = 1,   short = "Commit inversed",         text = "Commit all cards\nwhich are not requested" },
    { rank = 1, prompt = 'commit_1card',         target = 3,   short = "Commit 1 cards x 3",      text = "Commit 3 times with\n1 cards on different quest" },
    { rank = 1, prompt = 'commit_2card',         target = 4,   short = "Commit 2 cards x 4",      text = "Commit 4 times with\n2 cards on different quest" },
    { rank = 1, prompt = 'commit_3card',         target = 5,   short = "Commit 3 cards x 5",      text = "Commit 5 times with\n3 cards on different quest" },
    { rank = 1, prompt = 'commit_4card',         target = 4,   short = "Commit 4 cards x 4",      text = "Commit 4 times with\n4 cards on different quest" },
    { rank = 1, prompt = 'commit_5card',         target = 3,   short = "Commit 5 cards x 3",      text = "Commit 3 times with\n5 cards on different quest" },
    { rank = 1, prompt = 'pass',                 target = 10,  short = "Pass 10",                 text = "Pass 10 times" },
    { rank = 1, prompt = 'pass',                 target = 20,  short = "Pass 20",                 text = "Pass 20 times" },
    { rank = 1, prompt = 'pass_$1',              target = 2,   short = "Pass 2 with $1",          text = "Pass 2 times\nwith $1",                          init = rndMod },
    { rank = 1, prompt = 'pass_$1',              target = 3,   short = "Pass 3 with $1",          text = "Pass 3 times\nwith $1",                          init = rndMod },
    { rank = 1, prompt = 'pass_$1',              target = 4,   short = "Pass 4 with $1",          text = "Pass 4 times\nwith $1",                          init = rndMod },
    { rank = 1, prompt = 'pass_perfect',         target = 6,   short = "6 Chain im-perf",         text = "Pass 6 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_perfect',         target = 12,  short = "12 Chain im-perf",        text = "Pass 12 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_imperfect',       target = 6,   short = "6 Chain im-perf",         text = "Pass 6 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_imperfect',       target = 12,  short = "12 Chain im-perf",        text = "Pass 12 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_imperfect_row',   target = 3,   short = "3 Chain im-perf",         text = "Pass 3 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_imperfect_row',   target = 8,   short = "8 Chain im-perf",         text = "Pass 8 times\nimperfectly in a row" },
    { rank = 1, prompt = 'pass_perfect_row',     target = 4,   short = "B2B x 4",                 text = "Reach B2B x 4" },
    { rank = 1, prompt = 'pass_perfect_row',     target = 6,   short = "B2B x 6",                 text = "Reach B2B x 6" },
    { rank = 1, prompt = 'pass_perfect_row',     target = 8,   short = "B2B x 8",                 text = "Reach B2B x 8" },
    { rank = 1, prompt = 'pass_perfect_row',     target = 10,  short = "B2B x 10",                text = "Reach B2B x 10" },
    { rank = 1, prompt = 'pass_second',          target = 4,   short = "2nd quest x 4",           text = "Pass second quest 4 times" },
    { rank = 1, prompt = 'pass_second',          target = 8,   short = "2nd quest x 8",           text = "Pass second quest 8 times" },
    { rank = 1, prompt = 'pass_second',          target = 12,  short = "2nd quest x 12",          text = "Pass second quest 12 times" },
    { rank = 1, prompt = 'b2b_break_4',          target = 1,   short = "Break B2B x 4",           text = "Break B2B x 4" },
    { rank = 1, prompt = 'b2b_break_6',          target = 1,   short = "Break B2B x 6",           text = "Break B2B x 6" },
    { rank = 1, prompt = 'b2b_break_8',          target = 1,   short = "Break B2B x 8",           text = "Break B2B x 8" },
    { rank = 1, prompt = 'b2b_break_10',         target = 1,   short = "Break B2B x 10",          text = "Break B2B x 10" },
    { rank = 1, prompt = 'b2b_break_windup',     target = 1,   short = "Break B2B at a windup",   text = "Break B2B at a windup" },
    { rank = 1, prompt = 'b2b_break_windup3',    target = 1,   short = "Break B2B at a windup3+", text = "Break B2B at a lv.3+ windup" },
    { rank = 1, prompt = 'heal',                 target = 4,   short = "+4 HP",                   text = "Heal 4 hp" },
    { rank = 1, prompt = 'heal',                 target = 10,  short = "+10 HP",                  text = "Heal 10 hp" },
    { rank = 1, prompt = 'send',                 target = 6,   short = "Send 6",                  text = "Send 6 attacks" },
    { rank = 1, prompt = 'send',                 target = 14,  short = "Send 14",                 text = "Send 14 attacks" },
    { rank = 1, prompt = 'pass_windup',          target = 1,   short = "Windup",                  text = "Pass a windup" },
    { rank = 1, prompt = 'pass_windup3',         target = 1,   short = "Windup3+",                text = "Pass a lv.3+ windup" },
    { rank = 1, prompt = 'pass_windup_inb2b',    target = 1,   short = "Windup with B2B",         text = "Pass a windups\nduring one B2B charge" },
    { rank = 1, prompt = 'pass_windup',          target = 4,   short = "Windup x 4",              text = "Pass 4 windups" },
    { rank = 1, prompt = 'pass_windup_perfect',  target = 1,   short = "Windup perf",             text = "Pass a windup perfectly" },
    { rank = 1, prompt = 'pass_windup_inb2b',    target = 3,   short = "Windup x 3 with B2B",     text = "Pass 4 windups\nduring one B2B charge" },
    { rank = 1, prompt = 'pass_windup_perfect',  target = 4,   short = "Windup perf x 4",         text = "Pass 4 windups\nperfectly" },
    { rank = 1, prompt = 'pass_windup3_perfect', target = 1,   short = "Windup3+ perf",           text = "Pass a lv.3+ windup perfectly" },
    { rank = 1, prompt = 'pass_windup3_perfect', target = 4,   short = "Windup3+ perf x 4",       text = "Pass 4 lv.3+\nwindups perfectly" },
    { rank = 1, prompt = 'dmg_time',             target = 4,   short = "Take Dmg x 4",            text = "Take damage 4 times" },
    { rank = 1, prompt = 'dmg_time',             target = 8,   short = "Take Dmg x 8",            text = "Take damage 8 times" },
    { rank = 1, prompt = 'dmg_time',             target = 12,  short = "Take Dmg x 12",           text = "Take damage 12 times" },
    { rank = 1, prompt = 'dmg_amount',           target = 10,  short = "-10 HP",                  text = "Take 10 damage in total" },
    { rank = 1, prompt = 'dmg_amount',           target = 20,  short = "-20 HP",                  text = "Take 20 damage in total" },
    { rank = 1, prompt = 'timedmg_time',         target = 2,   short = "Take Time Dmg x 2",       text = "Take time damage 2 times" },
    { rank = 1, prompt = 'timedmg_time',         target = 4,   short = "Take Time Dmg x 4",       text = "Take time damage 4 times" },
    { rank = 1, prompt = 'timedmg_time',         target = 6,   short = "Take Time Dmg x 6",       text = "Take time damage 6 times" },
    { rank = 1, prompt = 'keep_health_full',     target = 4,   short = "Full HP 4 s",             text = "Keep HP full for 4 seconds" },
    { rank = 1, prompt = 'keep_health_safe',     target = 8,   short = "Safe HP 8 s",             text = "Keep HP safe for 8 seconds" },
    { rank = 1, prompt = 'keep_health_danger',   target = 3,   short = "Danger HP 3 s",           text = "Keep HP danger for 3 seconds" },
    { rank = 1, prompt = 'keep_no_mouse',        target = 4,   short = "No mouse 4 s",            text = "No mouse for 4 seconds" },
    { rank = 1, prompt = 'keep_no_commit',       target = 6,   short = "No commit 6 s",           text = "No commit for 6 seconds" },
    { rank = 1, prompt = 'keep_no_cancel',       target = 8,   short = "No cancel 8 s",           text = "No cancel for 8 seconds" },
    { rank = 1, prompt = 'keep_no_keyboard',     target = 10,  short = "No keyboard 10 s",        text = "No keyboard for 10 seconds" },
    { rank = 1, prompt = 'keep_no_imperfect',    target = 14,  short = "No imperfect 14 s",       text = "No imperfect for 14 seconds" },
    { rank = 1, prompt = 'keep_no_perfect',      target = 12,  short = "No perfect 12 s",         text = "No perfect for 12 seconds" },
    { rank = 1, prompt = 'keep_no_reset',        target = 16,  short = "No reset 16 s",           text = "No reset for 16 seconds" },
}
