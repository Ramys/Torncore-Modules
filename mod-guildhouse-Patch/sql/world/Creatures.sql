SET @Skills :=90001;
SET @Trainer :=90001;
SET @NAME := "Eepy";
SET @SUBNAME := "Master Trainer";
SET @COMMENT := 'Master Trainer';
SET @MODEL := 30790;

-- Clean Trainer before inserting new NPC,spells & skills.
DELETE FROM creature_template WHERE entry = @Trainer;
DELETE FROM npc_trainer WHERE id = @Trainer;

-- Create Trainer NPC
INSERT INTO creature_template (entry,modelid1,name,subname,minlevel,maxlevel,faction,npcflag,scale,unit_class,trainer_type,type,inhabittype) VALUES
(@Trainer,@MODEL,@NAME,@SUBNAME,80,80,35,51,1,2,2,7,3);


INSERT INTO `npc_trainer` (`id`,`spellid`,`moneycost`,`reqskillline`,`reqskillrank`,`reqlevel`) VALUES 
(@Skills,33388,40000,0,0,20), -- Apprentice Riding
(@Skills,33391,500000,33388,0,40), -- Journeyman Riding
(@Skills,34090,2500000,33391,0,60), -- Expert Riding
(@Skills,34091,50000000,34090,0,70), -- Artisan Riding
(@Skills,54197,10000000,34090,0,77), -- Cold Weather Flying
(@Skills,196,10000,0,0,1), -- One-Handed Axes
(@Skills,197,10000,0,0,1), -- Two-Handed Axes
(@Skills,198,10000,0,0,1), -- One-Handed Maces
(@Skills,199,10000,0,0,1), -- Two-Handed Maces
(@Skills,200,10000,0,0,1), -- Polearms
(@Skills,201,10000,0,0,1), -- One-Handed Swords
(@Skills,202,10000,0,0,1), -- Two-Handed Swords
(@Skills,227,10000,0,0,1), -- Staves
(@Skills,264,10000,0,0,1), -- Bows
(@Skills,266,10000,0,0,1), -- Guns
(@Skills,1180,10000,0,0,1), -- Daggers
(@Skills,2567,10000,0,0,1), -- Throwns
(@Skills,5011,10000,0,0,1), -- Crossbows
(@Skills,15590,10000,0,0,1), -- Fists
(@Skills,8737,10000,0,0,40), -- Mail Armor
(@Skills,750,10000,0,0,40); -- Plate Armor

-- ######################################################--
-- BEASTMASTER - 601026
-- ######################################################--
SET
@Entry      := 601026,
@Model      := 26314, -- Northrend Worgen White
@Name       := "Brody",
@Title      := "BeastMaster",
@Icon       := "Speak",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 4194433,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "BeastMaster";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 2196, 1906, 0, 18019); -- Haunch of Meat, Torch

-- NPC TEXT
DELETE FROM `npc_text` WHERE `ID`=@Entry;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES (@Entry, 'Greetings, $N. If you are looking for a trustful companion on your travels you have come to the right place. I can offer you a variety of tamed pets for you to choose from. If necessary I can also teach you the ways of the hunter so that you can take good care of your pet.');

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES 
-- MEAT
(@Entry,35953), -- (75) -- Mead Blasted Caribou 
(@Entry,33454), -- (65) -- Salted Venison 
(@Entry,27854), -- (55) -- Smoked Talbuk Venison
(@Entry,8952),  -- (45) -- Roasted Quail 
(@Entry,4599),  -- (35) -- Cured Ham Steak  
(@Entry,3771),  -- (25) -- Wild Hog Shank 
(@Entry,3770),  -- (15) -- Mutton Chop
(@Entry,2287),  -- (5)  -- Haunch of Meat
(@Entry,117),   -- (1)  -- Tough Jerky
-- FUNGUS
(@Entry,35947), -- (75) -- Sparkling Frostcap
(@Entry,33452), -- (65) -- Honey-Spiced Lichen 
(@Entry,27859), -- (55) -- Zangar Caps
(@Entry,8948),  -- (45) -- Dried King Bolete
(@Entry,4608),  -- (35) -- Raw Black Truffle 
(@Entry,4607),  -- (25) -- Delicious Cave Mold
(@Entry,4606),  -- (15) -- Spongy Morel
(@Entry,4605),  -- (5)  -- Red-Speckled Mushroom 
(@Entry,4604),  -- (1)  -- Forest Mushroom Cap
-- BREAD
(@Entry,35950), -- (75) -- Sweet Potato Bread
(@Entry,33449), -- (65) -- Crusty Flatbread
(@Entry,27855), -- (55) -- Mag'har Grainbread
(@Entry,8950),  -- (45) -- Homemade Cherry Pie
(@Entry,4601),  -- (35) -- Soft Banana Bread
(@Entry,4544),  -- (25) -- Mulgore Spice Bread
(@Entry,4542),  -- (15) -- Moist Cornbread
(@Entry,4541),  -- (5)  -- Freshly Baked Bread
(@Entry,4540),  -- (1)  -- Tough Hunk of Bread
-- FRUIT
(@Entry,35948), -- (75) -- Savory Snowplum
(@Entry,35949), -- (65) -- Tundra Berries
(@Entry,27856), -- (55) -- Sklethyl Berries
(@Entry,8953),  -- (45) -- Deep Fried Plantains
(@Entry,4602),  -- (35) -- Moon Harvest Pumpkin
(@Entry,4539),  -- (25) -- Goldenbark Apple
(@Entry,4538),  -- (15) -- Snapvine Watermelon
(@Entry,4537),  -- (5)  -- Tel'Abim Banana
(@Entry,4536),  -- (1)  -- Shiny Red Apple
-- FISH
(@Entry,35951), -- (75) -- Poached Emperor Salmon
(@Entry,33451), -- (65) -- Filet of Icefin
(@Entry,27858), -- (55) -- Sunspring Carp
(@Entry,8957),  -- (45) -- Spinefin Halibut
(@Entry,21552), -- (35) -- Striped Yellowtail
(@Entry,4594),  -- (25) -- Rockscale Cod
(@Entry,4593),  -- (15) -- Bristle Whisker Catfish
(@Entry,4592),  -- (5)  -- Longjaw Mud Snapper
(@Entry,787),   -- (1)  -- Slitherskin Mackeral
-- CHEESE
(@Entry,35952), -- (75) -- Briny Hardcheese
(@Entry,33443), -- (65) -- Sour Goat Cheese
(@Entry,27857), -- (55) -- Gradar Sharp
(@Entry,8932),  -- (45) -- Alterac Swiss
(@Entry,3927),  -- (35) -- Fine Aged Chedder
(@Entry,1707),  -- (25) -- Stormwind Brie
(@Entry,422),   -- (15) -- Dwarven Mild
(@Entry,414),   -- (5)  -- Dalaran Sharp
(@Entry,2070),  -- (1)  -- Darnassian Bleu
-- BUFF
(@Entry,33875), -- Kibler's Bits
-- RARE
(@Entry,21024); -- Chimaerok Tenderloin

REPLACE INTO `creature_template` VALUES (70101, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Talamortis', 'Guild House Seller', '', 0, 35, 35, 0, 35, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSeller', 12340),
(18649, 0, 0, 0, 0, 0, 18234, 0, 0, 0, 'Innkeeper Monica', NULL, NULL, 0, 1, 2, 0, 35, 65537, 0.8, 0.28571, 1, 0, 2, 2, 0, 26, 4.6, 2000, 1900, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 1, 1, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 70, 1, 0, 2, 'npc_innkeeper', 12340),
(33251, 0, 0, 0, 0, 0, 28516, 0, 0, 0, 'Death Knight Trainer', '', '', 9691, 80, 80, 2, 35, 51, 1, 1.14286, 1, 1, 422, 586, 0, 642, 7.5, 2000, 2000, 1, 32768, 2048, 0, 0, 0, 0, 6, 0, 345, 509, 103, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 0, 0, 1, 8388624, 0, '', 12340),
(601035, 0, 0, 0, 0, 0, 12162, 0, 0, 0, 'Zomble', '|cff00ccffThe Theminator|r', NULL, 0, 80, 80, 0, 35, 1, 1, 1.14286, 0.25, 1, 1000, 3000, 0, 0, 15, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 0, 0, 1, 0, 0, 'GMIsland_Theme_Generator', 0),
(70102, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Speedfang', 'Guild House Assistant', '', 0, 35, 35, 0, 35, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSpawner', 12340);

