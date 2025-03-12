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
        VL = "LARGER GAPS BETWEEN TAROTS, MUST CLICK TWICE",
        DH = "HARDER COMBOS WILL APPEAR",
        IN = "TAROTS FACE DOWN AND FLASH ONCE EVERY TWO SECONDS", -- ? -fily
        AS = "KEYBOARD IS AVAILABLE, BUT DOUBLE CLICKING IS PENALIZED",
        DP = "FLOOD THE TOWER WITH SOMEONE WHO DOESN'T EXIST",
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
    -- https://docs.google.com/spreadsheets/d/1syh3q2oiduCZb1cJ5QI95Y2XhhedAfhv4YnEH9z2tbc
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
        { time = 300,  event = { 'dmgTimeMul', -.1 },                  text = "FATIGUE SETS IN_",          desc = "TimerSpeed++" },
        { time = 330,  event = { 'dmgCycle', -.5, 'dmgWrong', 1 },     text = "YOUR BODY GROWS WEAKER_",     desc = "DmgCycle--   Damage++" },
        { time = 360,  event = { 'dmgTimeMul', -.1, 'dmgHeal', -1 },   text = "ALL SENSES BLUR TOGETHER_", desc = "TimerSpeed++   Heal--" },
        { time = 390,  event = { 'dmgTimeMul', -.1, 'dmgWrong', 1 },   text = "YOUR CONSCIOUSNESS FADES_", desc = "TimerSpeed++   Damage++" },
        { time = 420,  event = { 'dmgTimeMul', -.2, 'dmgCycle', -.5 }, text = "THIS IS THE END.",           desc = "TimerSpeed++   DmgCycle--" }, -- tell me if the dot breaks something lol -fily
        { time = 1e99, text = "" }, -- Total: dmgTimeMul-50%, Cycle-1, Wrong+2
    },
    rEX = {
        { time = 240,  event = { 'dmgTimeMul', -.2 },                 text = "YOUR POWER SLIPS_",               desc = "TimerSpeed++" },
        { time = 270,  event = { 'dmgWrong', 2 },                     text = "WHISPERS OF DISCONTENT SPREAD_",  desc = "Damage++" },
        { time = 300,  event = { 'dmgCycle', -1 },                    text = "PROTESTERS LINE THE STREETS_",    desc = "DmgCycle--" },
        { time = 330,  event = { 'dmgTimeMul', -.2, 'dmgWrong', 2, }, text = "YOUR CLOSEST ALLIES DEFECT_",     desc = "TimerSpeed++   Damage++" },
        { time = 360,  event = { 'dmgTimeMul', -.2, 'dmgHeal', -1 },  text = "PARANOIA CLOUDS YOUR JUDGEMENT_", desc = "TimerSpeed++   Heal--" },
        { time = 390,  event = { 'dmgCycle', -.5, 'dmgWrong', 1 },    text = "THE REVOLUTION HAS BEGUN_",       desc = "DmgCycle--   Damage++" },
        { time = 420,  event = { 'dmgTimeMul', -.3 },                 text = "THE END OF AN ERA.",               desc = "TimerSpeed++++" },
        { time = 1e99, text = "" }, -- Total: dmgTimeMul-90%, Cycle-1, Wrong+5
    },
    rDP = {
        { time = 20,   event = { 'dmgHeal', -1 }, --[[ 2 ]]    text = "YOUR PASSION FADES_",                        desc = "Heal-" },
        { time = 40,   event = { 'dmgHeal', -.5 }, --[[ 1.5 ]] text = "THEIR REPLIES BECOME LESS ENGAGED_",         desc = "Heal--" },
        { time = 60,   event = { 'dmgHeal', -.5 }, --[[ 1 ]]   text = "YOU FEEL NEGLECTED_",                       desc = "Heal---" },
        { time = 80,   event = { 'dmgHeal', 1 }, --[[ 2 ]]     text = "THEY SUCCESSFULLY APOLOGIZE_?",             desc = "Heal+",         color = 'lO' },
        { time = 100,  event = { 'dmgHeal', 1 }, --[[ 3 ]]     text = "THINGS ARE BACK TO HOW THEY USED TO BE_!",   desc = "Heal+++",       color = 'lO' },
        { time = 120,  event = { 'dmgHeal', -1 }, --[[ 2 ]]    text = "MINOR ISSUES BECOME LARGE CONFLICTS_",       desc = "Heal--" },
        { time = 140,  event = { 'dmgHeal', -1 }, --[[ 1 ]]    text = "YOU BLAME THEY FOR THEIR OWN PROBLEMS_",    desc = "Heal---" },
        { time = 160,  event = { 'reviveCount', 3 },           text = "THEY WOULD RATHER SPEND TIME ALONE_",        desc = "Revive++" },
        { time = 180,  event = { 'dmgHeal', 1.5 }, --[[ 2.5 ]] text = "YOU PROMISES TO CHANGE_",                    desc = "Heal++",        color = 'lO' },
        { time = 200,  event = { 'dmgTimeMul', -.2 },          text = "PROMISES ARE BROKEN_",                       desc = "TimerSpeed++" },
        { time = 220,  event = { 'dmgHeal', -.5 }, --[[ 2 ]]   text = "CONVERSATIONS DEVOLVE INTO SHOUTING MATCHES_", desc = "Heal---" },
        { time = 240,  event = { 'dmgHeal', -.5 }, --[[ 1.5 ]] text = "ALL TRUST HAS WITHERED AWAY_",               desc = "Heal--" },
        { time = 260,  event = { 'dmgHeal', -.5 }, --[[ 1 ]]   text = "THEY SET AN ULTIMATUM_",                    desc = "Heal--" },
        { time = 280,  event = { 'dmgHeal', -.5 }, --[[ .5 ]]  text = "YOU CAN'T BE BOTHERED ANYMORE_",             desc = "Heal--" },
        { time = 300,  event = { 'dmgWrong', 2 },              text = "ONE LAST PAINFUL ARGUMENT_",                 desc = "Dmg+" },
        { time = 320,  event = { 'reviveCount', 260 },         text = "GOODBYE.",                                   desc = "NO REVIVE" },
        { time = 360,  event = { 'dmgHeal', 1 }, --[[ 1.5 ]]   text = "\"I MISS YOU\"",                             desc = "Heal+++",       color = 'lO' },
        { time = 380,  event = { 'dmgHeal', 1 }, --[[ 2.5 ]]   text = "MAYBE IT CAN STILL WORK_?",                  desc = "Heal+",         color = 'lO' },
        { time = 400,  event = { 'dmgTimeMul', -.6 },          text = "GOODBYE.",                                   desc = "TimerSpeed++++" },
        { time = 1e99, text = "" },
    },
}
-- My formatter doesn't work if there's "…" inside
for _, f in next, Fatigue do for _, v in next, f do v.text = v.text:gsub("_", "…") end end

local function rndMod(t)
    local d = ModData.deck[math.random(9)].id
    t.prompt = t.prompt:repD(d)
    t.text = t.text:repD(ModData.adj[d])
    t.short = t.short:repD(d)
end
local function f5() return GAME.floor <= 5 end
local function F6() return GAME.floor >= 6 end
local function F9() return GAME.floor >= 9 end

---@class Prompt
---@field rank number[]
---@field prompt string
---@field target number
---@field short string
---@field text string
---@field cond? fun():boolean
---@field init? fun(t:Prompt)

---@type Prompt[]
RevivePrompts = {
    { rank = { 1, 2 }, prompt = 'activate',             target = 30,  short = "Activate 30",             text = "Activate 30 cards" },
    { rank = { 3, 4 }, prompt = 'activate',             target = 80,  short = "Activate 80",             text = "Activate 80 cards" },
    { rank = { 2, 2 }, prompt = 'cancel',               target = 40,  short = "Cancel 40",               text = "Cancel 40 cards" },
    { rank = { 3, 4 }, prompt = 'cancel',               target = 100, short = "Cancel 100",              text = "Cancel 100 cards" },
    { rank = { 1, 2 }, prompt = 'flip',                 target = 50,  short = "Flip 50",                 text = "Flip 50 cards" },
    { rank = { 3, 4 }, prompt = 'flip',                 target = 120, short = "Flip 120",                text = "Flip 120 cards" },
    { rank = { 5, 6 }, prompt = 'flip',                 target = 300, short = "Flip 300",                text = "Flip 300 cards" },
    { rank = { 1, 2 }, prompt = 'flip_single',          target = 10,  short = "Flip single 10",          text = "Flip a single card\n10 times in a row" },
    { rank = { 2, 4 }, prompt = 'flip_single',          target = 20,  short = "Flip single 20",          text = "Flip a single card\n20 times in a row" },
    { rank = { 1, 2 }, prompt = 'commit',               target = 6,   short = "Commit 6x",              text = "Commit 6 times" },
    { rank = { 2, 3 }, prompt = 'commit',               target = 15,  short = "Commit 15x",             text = "Commit 15 times" },
    { rank = { 3, 5 }, prompt = 'commit',               target = 30,  short = "Commit 30x",             text = "Commit 30 times" },
    { rank = { 1, 2 }, prompt = 'commit_$1',            target = 2,   short = "Commit $1 2x",           text = "Commit 2 times\nwith $1",                     init = rndMod },
    { rank = { 3, 4 }, prompt = 'commit_$1',            target = 4,   short = "Commit $1 4x",           text = "Commit 4 times\nwith $1",                     init = rndMod },
    { rank = { 2, 4 }, prompt = 'commit_$1_row',        target = 2,   short = "2 Chain with $1",         text = "Commit 2 times\nwith $1 in a row",            init = rndMod },
    { rank = { 3, 6 }, prompt = 'commit_$1_row',        target = 3,   short = "3 Chain with $1",         text = "Commit 3 times\nwith $1 in a row",            init = rndMod },
    { rank = { 1, 3 }, prompt = 'commit_no_$1_row',     target = 2,   short = "2 chain without $1",      text = "Commit 2 times\nwithout $1 in a row",         init = rndMod },
    { rank = { 3, 5 }, prompt = 'commit_no_$1_row',     target = 3,   short = "3 chain without $1",      text = "Commit 3 times\nwithout $1 in a row",         init = rndMod },
    { rank = { 1, 2 }, prompt = 'commit_0',             target = 2,   short = "Commit NOTHING 2x",      text = "Commit NOTHING\n2 times" },
    { rank = { 2, 4 }, prompt = 'commit_0',             target = 5,   short = "Commit NOTHING 5x",      text = "Commit NOTHING\n5 times" },
    { rank = { 4, 6 }, prompt = 'commit_0',             target = 8,   short = "Commit NOTHING 8x",      text = "Commit NOTHING\n8 times" },
    { rank = { 1, 3 }, prompt = 'commit_0_row',         target = 3,   short = "3x Spam commit",         text = "Commit NOTHING\n3 times in a row" },
    { rank = { 3, 5 }, prompt = 'commit_no_conn',       target = 1,   short = "Commit no consec",          text = "Commit without consecutive cards",            cond = F6 },
    { rank = { 1, 4 }, prompt = 'commit_conn_2',        target = 1,   short = "Commit 2 consec",           text = "Commit with 2 consecutive cards",             cond = f5 },
    { rank = { 2, 4 }, prompt = 'commit_conn_3',        target = 1,   short = "Commit 3 consec",           text = "Commit with 3 consecutive cards",             cond = f5 },
    { rank = { 3, 5 }, prompt = 'commit_conn_4',        target = 1,   short = "Commit 4 consec",           text = "Commit with 4 consecutive cards" },
    { rank = { 3, 5 }, prompt = 'commit_swamp_l',       target = 1,   short = "SWAMP WATER LITE",        text = "Commit SWAMP WATER LITE" },
    { rank = { 4, 6 }, prompt = 'commit_swamp',         target = 1,   short = "SWAMP WATER",             text = "Commit SWAMP WATER" },
    { rank = { 3, 6 }, prompt = 'commit_reversed',      target = 1,   short = "Commit inversed",         text = "Commit all cards\nwhich are not requested" },
    { rank = { 1, 4 }, prompt = 'commit_1card',         target = 3,   short = "Commit 1 cards 3x",      text = "Commit 3 times with\n1 card on first commit" },
    { rank = { 2, 5 }, prompt = 'commit_2card',         target = 4,   short = "Commit 2 cards 4x",      text = "Commit 4 times with\n2 cards on first commit" },
    { rank = { 3, 6 }, prompt = 'commit_3card',         target = 5,   short = "Commit 3 cards 5x",      text = "Commit 5 times with\n3 cards on first commit" },
    { rank = { 4, 6 }, prompt = 'commit_4card',         target = 4,   short = "Commit 4 cards 4x",      text = "Commit 4 times with\n4 cards on first commit" },
    { rank = { 5, 6 }, prompt = 'commit_5card',         target = 3,   short = "Commit 5 cards 3x",      text = "Commit 3 times with\n5 cards on first commit" },
    { rank = { 1, 4 }, prompt = 'pass',                 target = 10,  short = "Pass 10",                 text = "Pass 10 times" },
    { rank = { 5, 6 }, prompt = 'pass',                 target = 20,  short = "Pass 20",                 text = "Pass 20 times" },
    { rank = { 2, 5 }, prompt = 'pass_$1',              target = 2,   short = "Pass 2 with $1",          text = "Pass 2 times\nwith $1",                       init = rndMod },
    { rank = { 3, 5 }, prompt = 'pass_$1',              target = 3,   short = "Pass 3 with $1",          text = "Pass 3 times\nwith $1",                       init = rndMod },
    { rank = { 4, 6 }, prompt = 'pass_$1',              target = 4,   short = "Pass 4 with $1",          text = "Pass 4 times\nwith $1",                       init = rndMod },
    { rank = { 2, 4 }, prompt = 'pass_perfect',         target = 6,   short = "6x perf",                  text = "Pass 6 times perfectly" },
    { rank = { 5, 6 }, prompt = 'pass_perfect',         target = 12,  short = "12x perf",                 text = "Pass 12 times perfectly" },
    { rank = { 2, 4 }, prompt = 'pass_imperfect',       target = 6,   short = "6x im-perf",               text = "Pass 6 times imperfectly" },
    { rank = { 5, 6 }, prompt = 'pass_imperfect',       target = 12,  short = "12x im-perf",              text = "Pass 12 times imperfectly" },
    { rank = { 4, 5 }, prompt = 'pass_imperfect_row',   target = 3,   short = "3x chain im-perf",         text = "Pass 3 times\nimperfectly in a row" },
    { rank = { 5, 6 }, prompt = 'pass_imperfect_row',   target = 8,   short = "8x chain im-perf",         text = "Pass 8 times\nimperfectly in a row" },
    { rank = { 2, 4 }, prompt = 'pass_perfect_row',     target = 4,   short = "B2B x 4",                 text = "Reach B2B x 4" },
    { rank = { 3, 5 }, prompt = 'pass_perfect_row',     target = 6,   short = "B2B x 6",                 text = "Reach B2B x 6" },
    { rank = { 4, 5 }, prompt = 'pass_perfect_row',     target = 8,   short = "B2B x 8",                 text = "Reach B2B x 8" },
    { rank = { 4, 6 }, prompt = 'pass_perfect_row',     target = 10,  short = "B2B x 10",                text = "Reach B2B x 10" },
    { rank = { 2, 3 }, prompt = 'pass_second',          target = 4,   short = "2nd quest 4x",           text = "Pass second quest 4 times" },
    { rank = { 3, 4 }, prompt = 'pass_second',          target = 8,   short = "2nd quest 8x",           text = "Pass second quest 8 times" },
    { rank = { 4, 5 }, prompt = 'pass_second',          target = 12,  short = "2nd quest 12x",          text = "Pass second quest 12 times" },
    { rank = { 2, 4 }, prompt = 'b2b_break_4',          target = 1,   short = "Break B2B 4x",           text = "Break B2B x 4" },
    { rank = { 3, 4 }, prompt = 'b2b_break_6',          target = 1,   short = "Break B2B 6x",           text = "Break B2B x 6" },
    { rank = { 4, 5 }, prompt = 'b2b_break_8',          target = 1,   short = "Break B2B 8x",           text = "Break B2B x 8" },
    { rank = { 4, 6 }, prompt = 'b2b_break_10',         target = 1,   short = "Break B2B 10x",          text = "Break B2B x 10" },
    { rank = { 4, 6 }, prompt = 'b2b_break_windup',     target = 1,   short = "Break B2B at a windup",   text = "Break B2B at a windup",                       cond = F9 },
    { rank = { 5, 6 }, prompt = 'b2b_break_windup3',    target = 1,   short = "Break B2B at a windup3+", text = "Break B2B at a lv.3+ windup",                 cond = F9 },
    { rank = { 1, 3 }, prompt = 'heal',                 target = 8,   short = "Heal 8 HP",               text = "Heal 8 HP" },
    { rank = { 2, 4 }, prompt = 'heal',                 target = 20,  short = "Heal 20 HP",              text = "Heal 20 HP" },
    { rank = { 1, 2 }, prompt = 'send',                 target = 6,   short = "Send 6",                  text = "Send 6 attacks" },
    { rank = { 3, 4 }, prompt = 'send',                 target = 20,  short = "Send 20",                 text = "Send 20 attacks" },
    { rank = { 5, 6 }, prompt = 'send',                 target = 40,  short = "Send 40",                 text = "Send 40 attacks" },
    { rank = { 3, 4 }, prompt = 'pass_windup',          target = 1,   short = "Windup",                  text = "Pass a windup",                               cond = F9 },
    { rank = { 3, 5 }, prompt = 'pass_windup3',         target = 1,   short = "Windup3+",                text = "Pass a lv.3+ windup",                         cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup_inb2b',    target = 1,   short = "Windup with B2B",         text = "Pass a windup\nduring one B2B charge",       cond = F9 },
    { rank = { 4, 5 }, prompt = 'pass_windup',          target = 4,   short = "Windup x 4",              text = "Pass 4 windups",                              cond = F9 },
    { rank = { 4, 4 }, prompt = 'pass_windup_perfect',  target = 1,   short = "Windup perf",             text = "Pass a windup perfectly",                     cond = F9 },
    { rank = { 6, 6 }, prompt = 'pass_windup_inb2b',    target = 3,   short = "Windup x 3 with B2B",     text = "Pass 4 windups\nduring a B2B charge",       cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup_perfect',  target = 4,   short = "Windup perf x 4",         text = "Pass 4 windups\nperfectly",                   cond = F9 },
    { rank = { 5, 5 }, prompt = 'pass_windup3_perfect', target = 1,   short = "Windup3+ perf",           text = "Pass a lv.3+ windup perfectly",               cond = F9 },
    { rank = { 6, 6 }, prompt = 'pass_windup3_perfect', target = 4,   short = "Windup3+ perf x 4",       text = "Pass 4 lv.3+\nwindups perfectly",             cond = F9 },
    { rank = { 2, 2 }, prompt = 'dmg_time',             target = 4,   short = "Take Dmg 4x",            text = "Take damage 4 times" },
    { rank = { 3, 3 }, prompt = 'dmg_time',             target = 8,   short = "Take Dmg 8x",            text = "Take damage 8 times" },
    { rank = { 2, 4 }, prompt = 'dmg_amount',           target = 10,  short = "Lose 10 HP",              text = "Take 10 damage total" },
    { rank = { 4, 6 }, prompt = 'dmg_amount',           target = 20,  short = "Lose 20 HP",              text = "Take 20 damage total" },
    { rank = { 3, 4 }, prompt = 'timedmg_time',         target = 2,   short = "Take Time Dmg 2x",       text = "Take time damage 2 times",                    cond = F6 },
    { rank = { 5, 6 }, prompt = 'timedmg_time',         target = 4,   short = "Take Time Dmg 4x",       text = "Take time damage 4 times",                    cond = F6 },
    { rank = { 4, 6 }, prompt = 'keep_health_safe',     target = 8,   short = "Safe HP 8s",             text = "Keep HP safe for 8 seconds",                  cond = F6 },
    { rank = { 4, 5 }, prompt = 'keep_health_danger',   target = 3,   short = "Danger HP 3s",           text = "Keep HP in danger for 3 seconds",                cond = F6 },
    { rank = { 2, 5 }, prompt = 'keep_no_mouse',        target = 4,   short = "No mouse 4s",            text = "Don't use your mouse for 4 seconds",                      cond = f5 },
    { rank = { 2, 4 }, prompt = 'keep_no_commit',       target = 6,   short = "No commit 6s",           text = "Don't commit for 6 seconds",                     cond = f5 },
    { rank = { 3, 6 }, prompt = 'keep_no_cancel',       target = 8,   short = "No cancel 8s",           text = "Don't cancel for 8 seconds" },
    { rank = { 2, 5 }, prompt = 'keep_no_keyboard',     target = 10,  short = "No keyboard 10s",        text = "Don't use your keyboard for 10 seconds",               cond = F6 },
    { rank = { 3, 5 }, prompt = 'keep_no_perfect',      target = 12,  short = "No perfect 12s",         text = "Don't perfect for 12 seconds" },
    { rank = { 4, 6 }, prompt = 'keep_no_imperfect',    target = 14,  short = "No imperfect 14s",       text = "Don't imperfect for 14 seconds",              cond = F6 },
    { rank = { 3, 5 }, prompt = 'keep_no_reset',        target = 16,  short = "No reset 16s",           text = "Don't reset for 16 seconds" },
}
