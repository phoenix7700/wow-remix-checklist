-- Remix Weapon Tracker is marked with CC0 1.0 Universal. To view a copy of this license, visit http://creativecommons.org/publicdomain/zero/1.0

---@class ns
local addon = select(2,...)

addon.enum = addon.enum or {}

-- copilot dreamed up this list, so it's probably subtly wrong
---@enum equip
local equip = {
   ONE_H_AXE = 1,
   TWO_H_AXE = 2,
   ONE_H_SWORD = 3,
   TWO_H_SWORD = 4,
   ONE_H_MACE = 5,
   TWO_H_MACE = 6,
   STAFF = 7,
   DAGGER = 8,
   FIST = 9,
   POLEARM = 10,
   BOW = 11,
   GUN = 12,
   CROSSBOW = 13,
   WAND = 14,
   SHIELD = 15,
   OFF_HAND = 16,
}
addon.enum.equip = equip

---@type table<equip,string>
local equipName = {
   [equip.ONE_H_AXE] = "One-Handed Axe",
   [equip.TWO_H_AXE] = "Two-Handed Axe",
   [equip.ONE_H_SWORD] = "One-Handed Sword",
   [equip.TWO_H_SWORD] = "Two-Handed Sword",
   [equip.ONE_H_MACE] = "One-Handed Mace",
   [equip.TWO_H_MACE] = "Two-Handed Mace",
   [equip.STAFF] = "Staff",
   [equip.DAGGER] = "Dagger",
   [equip.FIST] = "Fist Weapon",
   [equip.POLEARM] = "Polearm",
   [equip.BOW] = "Bow",
   [equip.GUN] = "Gun",
   [equip.CROSSBOW] = "Crossbow",
   [equip.WAND] = "Wand",
   [equip.SHIELD] = "Shield",
   [equip.OFF_HAND] = "Off-Hand"
}
addon.enum.equipName = equipName

---@alias class
---| '"DEATH_KNIGHT"'
---| '"DEMON_HUNTER"'
---| '"DRUID"'
---| '"EVOKER"'
---| '"HUNTER"'
---| '"MAGE"'
---| '"MONK"'
---| '"PALADIN"'
---| '"PRIEST"'
---| '"ROGUE"'
---| '"SHAMAN"'
---| '"WARLOCK"'
---| '"WARRIOR"'

-- copilot dreamed up this list, so it's probably extremely wrong
---@type table<class,table<equip,true>>
local class_to_equip = {
   DEATH_KNIGHT = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   DEMON_HUNTER = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   DRUID = {
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   EVOKER = {
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.WAND] = true,
   },
   HUNTER = {
      [equip.BOW] = true,
      [equip.GUN] = true,
      [equip.CROSSBOW] = true,
   },
   MAGE = {
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.WAND] = true,
   },
   MONK = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   PALADIN = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   PRIEST = {
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.WAND] = true,
   },
   ROGUE = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
   },
   SHAMAN = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
   WARLOCK = {
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.WAND] = true,
   },
   WARRIOR = {
      [equip.ONE_H_AXE] = true,
      [equip.TWO_H_AXE] = true,
      [equip.ONE_H_SWORD] = true,
      [equip.TWO_H_SWORD] = true,
      [equip.ONE_H_MACE] = true,
      [equip.TWO_H_MACE] = true,
      [equip.STAFF] = true,
      [equip.DAGGER] = true,
      [equip.FIST] = true,
      [equip.POLEARM] = true,
   },
}
addon.enum.class_to_equip = class_to_equip

---@enum loc
local loc = {
   SOO_LFR = "Siege of Ongrimmar (LFR)",
   SOO_N = "Siege of Ongrimmar (Normal)",
   SOO_H = "Siege of Ongrimmar (Heroic)",
   SOO_M = "Siege of Ongrimmar (Mythic)",
   TOT_LFR = "Throne of Thunder (LFR)",
   TOT_N = "Throne of Thunder (Normal)",
   TOT_H = "Throne of Thunder (Heroic)",
   FEAR_LFR = "MSV/HOF/TOES (LFR)",
   FEAR_N = "MSV/HOF/TOES (Normal)",
   FEAR_H = "MSV/HOF/TOES (Heroic)",
   ISLE = "Isle of Thunder/Giants/Timelessness",
   DREAD = "Dread Wastes",
   VALE = "Vale of Eternal Blossoms",
   SUMMIT = "Kun-Lai Summit",
   STEPPES = "Townlong Steppes",
   JADE = "Jade Forest",
   WILDS = "Krasarang Wilds",
   FOUR = "Valley of Four Winds",
   SCENE = "Scenarios",
   DUNG = "Dungeons",
   UNKNOWN = "Unknown",
}
addon.enum.loc = loc

---@alias itemID number

-- data was gathered from wowhead by hand, so it's probably subtly wrong
---@type table<equip,table<itemID, string>>
addon.weapons = {
   [equip.ONE_H_AXE] = {
      -- haromm
      [215472] = loc.SOO_LFR,
      -- kura-kura
      [215499] = loc.TOT_N,
      -- malkorok
      [215476] = loc.SOO_LFR,
      -- pandaren
      [216021] = loc.SUMMIT,
      [216022] = loc.SUMMIT,
      [216024] = loc.JADE,
      [216025] = loc.FOUR,
      -- yaungol
      [215496] = loc.DREAD,
      [215494] = loc.VALE,
      [215495] = loc.STEPPES,
      -- shellsplitter
      [216015] = loc.TOT_N
   },
   [equip.TWO_H_AXE] = {
      -- shin-ka
      [215506] = loc.FEAR_N,
      -- uroe
      [215517] = loc.TOT_LFR,
      -- xal'atoh
      [215501] = loc.SOO_LFR,
      -- wallwather
      [215515] = loc.ISLE,
      [215513] = loc.DREAD,
      [215512] = loc.STEPPES,
      [215514] = loc.VALE,
   },
   [equip.BOW] = {
      -- dagryn
      [215522] = loc.SOO_H,
      -- fang kung
      [215530] = loc.FEAR_H,
      -- hisek
      [215527] = loc.SOO_LFR,
      -- jinyu
      [215539] = loc.VALE,
      [215540] = loc.STEPPES,
      [215541] = loc.DREAD,
      -- dawnwatcher
      [215537] = loc.SCENE,
      -- miracoran
      [215547] = loc.TOT_LFR,
      [215550] = loc.ISLE,
      -- tortoiseshell
      [215542] = loc.TOT_LFR,
   },
   [equip.CROSSBOW] = {
      -- death lotus
      [215554] = loc.SOO_LFR,
      -- durumu
      [215562] = loc.TOT_LFR,
      -- forgotten glory
      [215556] = loc.FEAR_N,
      [215557] = loc.FEAR_H,
      -- seawatch
      [216614] = loc.SUMMIT
   },
   [equip.DAGGER] = {
      -- mantid
      [215612] = loc.DUNG,
      [215614] = loc.SCENE,
      [215615] = loc.SCENE,
      -- firescribe
      [215604] = loc.DUNG,
      [215607] = loc.SCENE,
      -- imperial
      [215621] = loc.STEPPES,
      [215622] = loc.DREAD,
      [215620] = loc.VALE,
      [215623] = loc.ISLE,
      -- iron qon
      [216413] = loc.TOT_N,
      -- lightdrinker
      [215609] = loc.DUNG,
      [215610] = loc.SCENE,
      [215611] = loc.SCENE,
      -- megaera
      [215625] = loc.TOT_LFR,
      [215626] = loc.TOT_LFR,
      [215627] = loc.TOT_LFR,
      -- norushen
      [215572] = loc.SOO_LFR,
      -- pandaren
      [215616] = loc.STEPPES,
      [215617] = loc.DREAD,
      [215618] = loc.VALE,
      [215619] = loc.ISLE,
      -- regail
      [215588] = loc.FEAR_LFR,
      -- rik'kal
      [215580] = loc.SOO_LFR,
      -- sanguine ritual
      [216405] = loc.TOT_N,
      -- seven stars
      [215584] = loc.FEAR_LFR,
      -- soulsever
      [215589] = loc.FEAR_H,
   },
   [equip.FIST] = {
      -- amun-thoth
      [215653] = loc.TOT_LFR,
      -- pandaren
      [215649] = loc.DREAD,
      [215650] = loc.STEPPES,
      [215651] = loc.VALE,
      -- pincers
      [215644] = loc.ISLE, -- ? wowhead claims this is also found in kun-lai summit but that breaks the pattern...
      -- softfoot
      [215629] = loc.SOO_N,
      -- tia-tia
      [216402] = loc.TOT_H,
   },
   [equip.GUN] = {
      -- klaxxi
      [215706] = loc.SCENE,
      -- kor'kron
      [215691] = loc.SOO_H,
      -- quilen
      [215710] = loc.TOT_LFR,
      -- taoren
      [215695] = loc.FEAR_H,
   },
   [equip.ONE_H_MACE] = {
      -- acid-spine
      [216425] = loc.TOT_LFR,
      -- dark animus
      [215766] = loc.TOT_LFR,
      [215767] = loc.TOT_N, -- anyone get the feeling these were thrown in loot tables completely arbitrarily?
      [215768] = loc.TOT_LFR,
      -- grummle mace
      [215738] = loc.JADE, -- and also townlong steppes?? what the hell
      -- carapace crusher
      [215757] = loc.SCENE,
      -- wasteland basher - btw wowhead has completely different names in these sections, for some reason
      [215745] = loc.SUMMIT, -- and also isles? but summit seems be the more common drop source
      -- galvanized stormcrusher
      [215730] = loc.FEAR_LFR, -- finally back to sane drop locations
      -- hozen
      [215762] = loc.DREAD,
      [215763] = loc.STEPPES,
      [215764] = loc.VALE,
      -- jerthud, Hand of the Savior
      [215770] = loc.TOT_N,
      -- kardris' scepter
      [215718] = loc.SOO_N,
      -- pandaren (but just the one! apparently pandaren don't much like maces)
      [216423] = loc.JADE,
      -- saurok (who like maces much more)
      [215758] = loc.STEPPES,
      [215759] = loc.DREAD,
      [215760] = loc.VALE,
      [215761] = loc.ISLE,
      -- Sphere of Immerseus (omg this one is gorgeous)
      [215712] = loc.SOO_N,
   },
   [equip.TWO_H_MACE] = {
      -- Hammer of the Dawn
      [216437] = loc.TOT_LFR,
      -- Shado-Pan Maul - BTW wowhead lists only Scholomance & Niuzao/Jade Temples but i suspect that's due to low droprate
      -- & ppl farming on classes that can't loot 2h maces,
      -- I doubt that this one doesn't drop in e.g. Stormstout Brewery
      [215783] = loc.DUNG,
   },
   [equip.OFF_HAND] = {
      -- Hope's Effigy
      [215680] = loc.WILDS, -- and also vale, but wilds seems to be the more common drop location
      -- eye of the hydra
      [215688] = loc.TOT_N,
      -- mantid tuning fork (not for salads)
      [215682] = loc.DUNG,
      [215684] = loc.DUNG,
      -- hozen (these are cute)
      [215657] = loc.STEPPES,
      [215658] = loc.VALE,
      -- Grummle Lantern
      [215678] = loc.SUMMIT, -- also isle, but summit is definitely more common (and thematic!)
      -- lucky cricket cage
      [215663] = loc.SOO_LFR,
      -- pandaren books
      [216438] = loc.JADE,
      [216439] = loc.WILDS,
      [216440] = loc.SUMMIT,
      -- pandaren fan (these have a nice eye motif)
      [216442] = loc.JADE,
      [216443] = loc.FOUR, -- wowhead missed this one in their big list, it's a nice red
      [216444] = loc.WILDS,
      [216445] = loc.SUMMIT,
      -- sha-touched globule
      [215670] = loc.SOO_LFR,
   },
   [equip.POLEARM] = {
      -- Bo-Ris, Spear deze nuts
      [215791] = loc.FEAR_N,
      -- Ghostheart (ohhh the "random" names are references to the model that that these are recolors of)
      [215808] = loc.SCENE,
      [215809] = loc.SCENE,
      -- Qiang's Unbreakable Polearm
      [215798] = loc.FEAR_N,
      -- Shan-Dun, Breaker of Courage
      [215814] = loc.TOT_LFR,
   },
   [equip.SHIELD] = {
      -- gays of the ancient
      [216566] = loc.FEAR_LFR,
      -- eyes of the doomed
      [216600] = loc.ISLE,
      [216601] = loc.ISLE,
      -- Shield of the Fallen General (rip nazgrim :( )
      [216558] = loc.SOO_LFR,
      -- Ironwood Shields
      [216533] = loc.VALE,
      [216534] = loc.STEPPES,
      [216535] = loc.ISLE,
      [216536] = loc.DREAD,
      -- Mogu Lord shields
      [216537] = loc.STEPPES,
      [216538] = loc.DREAD,
      [216539] = loc.VALE,
      [216540] = loc.ISLE,
      -- pandaren shields (uggo)
      [216541] = loc.WILDS,
      [216542] = loc.JADE,
      -- Protection of the Emperor
      [216530] = loc.ISLE,
      -- Protectorate
      [216581] = loc.DUNG,
      [216582] = loc.DUNG, -- another missed one, with red embroidery
      [216583] = loc.SCENE,
      [216584] = loc.SCENE, -- and this too (orange embroidery) - is this N vs H dungeon/scenario?
      -- Bulwark of Twinned Despair (so delicious)
      [216596] = loc.TOT_LFR,
   },
   [equip.STAFF] = {
      -- amberweaver
      [215871] = loc.JADE, -- also from rares in Townlong Steppes(!)
      [215872] = loc.WILDS, -- also from rares in Vale of Eternal Blossoms
      -- Brazier of the Eternal Empire (entirely new model!)
      [215839] = loc.FEAR_LFR,
      [215840] = loc.FEAR_N,
      [215841] = loc.FEAR_H,
      [215842] = loc.FEAR_LFR, -- arbitraryyyyyyyy
      -- caduceus of pure moods
      [216459] = loc.SOO_N,
      -- staff of corrupted waters (wowhead did a typo on this one)
      [215818] = loc.SOO_N,
      -- Drakebinder's Spire
      [215835] = loc.SOO_LFR,
      -- Fearspeaker's Warstaff (new model)
      [215847] = loc.FEAR_LFR,
      [215848] = loc.FEAR_N,
      [215849] = loc.FEAR_H,
      [215850] = loc.FEAR_LFR,
      -- Staff of Iron Will
      [215874] = loc.DUNG,
      -- Jalak's Spirit Staff
      [215898] = loc.TOT_N,
      -- jinyu
      [215894] = loc.STEPPES,
      [215895] = loc.DREAD,
      [215896] = loc.VALE,
      [215897] = loc.ISLE,
      -- omg there's so many staffs :<
      -- Rod of the Megantholithic Apparatus (oh myyy)
      [215830] = loc.SOO_LFR,
      -- Staff of the Monkey King (isn't that just the Brewmaster artifact? minus the keg i guess)
      [216450] = loc.UNKNOWN,
      [216451] = loc.UNKNOWN, -- so unknown WH doesn't even include it in their list (it's blue with orange gems)
      [216452] = loc.UNKNOWN,
      [216453] = loc.UNKNOWN, -- this one too is unlisted (it's purple with green gems)
      -- Pandaren Staffs
      [216454] = loc.UNKNOWN,
      [216455] = loc.UNKNOWN,
      [216456] = loc.UNKNOWN,
      [216457] = loc.UNKNOWN,
      -- Pride's Gays (i will never get tired of the gaze <-> gays joke)
      [215831] = loc.SOO_LFR,
      -- Soulwood Spire
      [215887] = loc.TOT_N,
      -- Spire of Supremacy
      [215826] = loc.SOO_LFR,
      -- Springrain Spire
      [215878] = loc.DUNG,
      -- Suen-Wo, Spire of the Rising Sun
      [216468] = loc.TOT_H,
      -- Tian Monastery Staff
      [216473] = loc.SUMMIT,
      -- Fogspeaker Conduit (torch)
      [215865] = loc.WILDS, -- and Vale rares
      -- Waterspeaker's Staff (new model)
      [215843] = loc.FEAR_LFR,
      [215844] = loc.FEAR_N,
      [215845] = loc.FEAR_H,
      [215846] = loc.FEAR_LFR, -- unlisted by WH, aqua gem & olive flare bits
   },
   [equip.ONE_H_SWORD] = {
      -- Arcweaver Spellblade (omg it's yellow 😍)
      [215920] = loc.SOO_LFR,
      -- Do-tharak, the Foebreaker
      [215908] = loc.ISLE,
      -- Qon's Iron decree
      [215964] = loc.TOT_LFR,
      -- Klaxxi
      [215903] = loc.UNKNOWN,
      -- Loshan, Fear Incarnate
      [215933] = loc.FEAR_H,
      -- Shao-Tien Saber
      [215922] = loc.SOO_N,
      -- Temple Trainee (love these)
      [216474] = loc.WILDS, -- unlisted, red hilt with gold guard
      [216475] = loc.JADE,
      [216476] = loc.FOUR,
      [216477] = loc.SUMMIT, -- unlisted, grey hilt with reddish guard
      -- Tian Monastery
      [215957] = loc.STEPPES,
      [215958] = loc.DREAD,
      [215959] = loc.VALE,
      [215960] = loc.ISLE,
      -- Xifeng, Longblade of the Guardian
      [215912] = loc.SOO_LFR,
   },
   [equip.TWO_H_SWORD] = {
      -- Greatsword of Fallen Pride (is when lgbtq+ people start discoursing about kink @ pride)
      [215971] = loc.SOO_LFR,
      -- Greatsword of the Iron Legion
      [215970] = loc.ISLE, -- ooh, chinese ashbringer
      -- Jinyu Greatswords
      [215987] = loc.STEPPES,
      [215988] = loc.DREAD,
      [215989] = loc.VALE,
      -- Mogu'dar, Blade of the Thousand Slaves
      [215986] = loc.SCENE,
      [215983] = loc.DUNG,
      -- Pandaren Greatswords
      [216478] = loc.FOUR, -- unlisted, red hilt
      [216479] = loc.JADE, -- unlisted, dark blue hilt
      [216480] = loc.FOUR,
      [216481] = loc.SUMMIT,
      -- Starslicer
      [215976] = loc.FEAR_N,
   },
   [equip.WAND] = {
      -- Felsoul
      [216001] = loc.JADE, -- and Steppes rares
      -- Mistspinner's Channel
      [215994] = loc.UNKNOWN,
      -- Necromantic wands
      [216006] = loc.DUNG,
      [216007] = loc.SCENE,
   }
}


