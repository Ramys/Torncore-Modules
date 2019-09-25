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

REPLACE INTO `creature_template` VALUES (70101, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Talamortis', 'Guild House Seller', '', 0, 35, 35, 0, 35, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSeller', 12340),
(18649, 0, 0, 0, 0, 0, 18234, 0, 0, 0, 'Innkeeper Monica', NULL, NULL, 0, 1, 2, 0, 35, 65537, 0.8, 0.28571, 1, 0, 2, 2, 0, 26, 4.6, 2000, 1900, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 1, 1, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 70, 1, 0, 2, 'npc_innkeeper', 12340),
(33251, 0, 0, 0, 0, 0, 28516, 0, 0, 0, 'Death Knight Trainer', '', '', 9691, 80, 80, 2, 35, 51, 1, 1.14286, 1, 1, 422, 586, 0, 642, 7.5, 2000, 2000, 1, 32768, 2048, 0, 0, 0, 0, 6, 0, 345, 509, 103, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 0, 0, 1, 8388624, 0, '', 12340),
(601035, 0, 0, 0, 0, 0, 12162, 0, 0, 0, 'Zomble', '|cff00ccffThe Theminator|r', NULL, 0, 80, 80, 0, 35, 1, 1, 1.14286, 0.25, 1, 1000, 3000, 0, 0, 15, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 0, 0, 1, 0, 0, 'GMIsland_Theme_Generator', 0),
(70102, 0, 0, 0, 0, 0, 25901, 0, 0, 0, 'Speedfang', 'Guild House Assistant', '', 0, 35, 35, 0, 35, 1, 1, 1.14286, 1, 0, 49, 64, 0, 118, 1, 2000, 2000, 1, 33536, 2048, 0, 0, 0, 0, 0, 0, 33, 49, 11, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 1, 0, 0, 'GuildHouseSpawner', 12340);

