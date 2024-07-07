CREATE TABLE `PLAYERS` (
  `Player_id` integer PRIMARY KEY,
  `No_of_diamonds` integer,
  `Level` integer,
  `User_name` varchar(255),
  `Status` varchar(255),
  `Gender` varchar(255),
  `Region` varchar(255),
  `Guild_id` integer
);

CREATE TABLE `STATS` (
  `Player_id` integer,
  `Season` integer,
  `CS_kd` integer,
  `BR_kd` integer,
  `CS_rank` varchar(255),
  `BR_rank` varchar(255),
  `MostUsedWeapon_id` integer,
  `Headshot_rate` integer,
  `No_of_Matches` integer,
  `No_of_Wins` integer,
  PRIMARY KEY (`Player_id`, `Season`)
);

CREATE TABLE `CHARACTERS` (
  `Name` varchar(255) PRIMARY KEY,
  `Gender` varchar(255),
  `Skill` varchar(255),
  `type` varchar(255),
  `Char_ID` integer
);

CREATE TABLE `WEAPONS` (
  `Weapon_id` integer PRIMARY KEY,
  `Name` varchar(255),
  `Rate_of_fire` integer,
  `Armour_penetration` integer,
  `shooting_range` integer,
  `Damage` integer
);

CREATE TABLE `WSKININFO` (
  `Name` varchar(255) PRIMARY KEY,
  `shooting_range` integer,
  `Damage` integer,
  `Rate_of_fire` integer,
  `Armour_penetration` integer
);

CREATE TABLE `WEAPONSKINS` (
  `Name` varchar(255),
  `Weapon_id` integer,
  PRIMARY KEY (`Name`, `Weapon_id`)
);

CREATE TABLE `REWARDS` (
  `Name` varchar(255),
  `Weapon_id` integer,
  `Mission_id` integer,
  PRIMARY KEY (`Name`, `Weapon_id`, `Mission_id`)
);

CREATE TABLE `WINS` (
  `No_of_Matches` integer,
  `No_of_Wins` integer,
  `Win_percent` integer,
  PRIMARY KEY (`No_of_Matches`, `No_of_Wins`)
);

CREATE TABLE `MISSIONS` (
  `Mission_id` integer PRIMARY KEY,
  `Statement` varchar(255),
  `Reward` varchar(255)
);

CREATE TABLE `INCLUDES` (
  `Match_id` integer,
  `Mission_id` integer,
  PRIMARY KEY (`Match_id`, `Mission_id`)
);

CREATE TABLE `MATCHES` (
  `Match_id` integer PRIMARY KEY,
  `Map` varchar(255),
  `Mode` varchar(255)
);

CREATE TABLE `PARTICIPATES_IN` (
  `Player_id` integer,
  `Match_id` integer,
  PRIMARY KEY (`Player_id`, `Match_id`)
);

CREATE TABLE `COMPLETES` (
  `Play_ID` integer,
  `Mis_ID` integer,
  `Mat_ID` integer,
  PRIMARY KEY (`Play_ID`, `Mis_ID`, `Mat_ID`)
);

CREATE TABLE `INVENTORY` (
  `Item_id` integer,
  `Player_id` integer,
  `Equipped` varchar(255),
  PRIMARY KEY (`Item_id`, `Player_id`)
);

CREATE TABLE `INVENTORY_ITEMS` (
  `Item_id` integer PRIMARY KEY,
  `Type` varchar(255)
);

CREATE TABLE `WINNERS` (
  `Winner_id` integer,
  `Match_id` integer,
  PRIMARY KEY (`Winner_id`, `Match_id`)
);

CREATE TABLE `FRIENDS` (
  `Player_id` integer,
  `Friend_id` integer,
  PRIMARY KEY (`Player_id`, `Friend_id`)
);

CREATE TABLE `BUYS_IN` (
  `Player_id` integer,
  `Item_id` integer,
  PRIMARY KEY (`Player_id`, `Item_id`)
);

CREATE TABLE `STORE` (
  `Item_id` integer PRIMARY KEY,
  `Type` varchar(255),
  `Cost` integer
);

CREATE TABLE `GUILD` (
  `Guild_id` integer PRIMARY KEY,
  `Name` varchar(255),
  `Leader_id` integer,
  `Level` integer
);

CREATE TABLE `MEMBERS_OF` (
  `Guild_id` integer,
  `Player_id` integer,
  PRIMARY KEY (`Guild_id`, `Player_id`)
);

CREATE TABLE `EQUIPS` (
  `Play_ID` integer,
  `W_ID` integer,
  `SkinName` varchar(255),
  PRIMARY KEY (`Play_ID`, `W_ID`, `SkinName`)
);

CREATE TABLE `ACHIEVEMENTS` (
  `Player_id` integer,
  `achievements` integer,
  PRIMARY KEY (`Player_id`, `achievements`)
);



-- Populate PLAYERS table
INSERT INTO PLAYERS (Player_id, No_of_diamonds, Level, User_name, Status, Gender, Region, Guild_id)
VALUES
  (1, 100, 10, 'KK', 'Active', 'Male', 'India', NULL),
  (2, 50, 5, 'jexx', 'Inactive', 'Male', 'USA', NULL),
  (3, 75, 8, 'VamC', 'Active', 'Male', 'China', NULL),
  (4, 120, 12, 'Sai', 'Active', 'Male', 'India', NULL),
  (5, 30, 3, 'Chvk', 'Inactive', 'Male', 'USA', NULL),
  (6, 25, 5, 'zorox', 'active', 'Male', 'FRANCE', NULL),
  (7, 33, 7, 'selena', 'Inactive', 'Female', 'RUSSIA', NULL);


-- Populate STATS table (assumed some random values)
INSERT INTO STATS (Player_id, Season, CS_kd, BR_kd, CS_rank, BR_rank, MostUsedWeapon_id, Headshot_rate, No_of_Matches, No_of_Wins)
VALUES
  (1, 1, 2, 3, 'Hero', 'Silver', 201, 60, 100, 30),
  (2, 1, 1, 1, 'Silver', 'Bronze', 202, 45, 80, 20),
  (3, 1, 1, 2, 'Platinum', 'Gold', 203, 55, 90, 25),
  (4, 1, 3, 4, 'Diamond', 'Platinum', 204, 70, 120, 40),
  (5, 1, 0, 1, 'Bronze', 'Wood', 205, 40, 70, 15),
  (6, 1, 0, 2, 'Silver', 'Gold', 201, 30, 50, 40),
  (7, 1, 3, 2, 'Platinum', 'Gold', 202, 77, 30, 22);

-- Populate GUILD table
INSERT INTO GUILD (Guild_id, Name, Leader_id, Level)
VALUES
  (101, 'Team Hydra', 1, 5),
  (102, 'Avengers', 2, 3),
  (103, 'Destroyers', 3, 7),
  (104, 'Creators', 5, 6),
  (105, 'Noobs', 4, 7);

-- Update PLAYERS table to refer to Guilds
UPDATE PLAYERS SET Guild_id = 101 WHERE Player_id = 1;
UPDATE PLAYERS SET Guild_id = 102 WHERE Player_id = 2;
UPDATE PLAYERS SET Guild_id = 103 WHERE Player_id = 3;
UPDATE PLAYERS SET Guild_id = 101 WHERE Player_id = 4;
UPDATE PLAYERS SET Guild_id = 102 WHERE Player_id = 5;
UPDATE PLAYERS SET Guild_id = 103 WHERE Player_id = 6;
UPDATE PLAYERS SET Guild_id = 103 WHERE Player_id = 7;

-- Populate WEAPONS table
-- Populate WEAPONS table with modified IDs
INSERT INTO WEAPONS (Weapon_id, Name, Rate_of_fire, Armour_penetration, shooting_range, Damage)
VALUES
  (201, 'AK - 47', 500, 10, 50, 40),
  (202, 'M4A1', 600, 15, 60, 35),
  (203, 'MP40', 450, 8, 40, 45),
  (204, 'AWM', 700, 20, 70, 50),
  (205, 'Desert Eagle', 400, 5, 30, 30);

-- Update STATS table to set modified MostUsedWeapon_id
UPDATE STATS SET MostUsedWeapon_id = 201 WHERE Player_id = 1;
UPDATE STATS SET MostUsedWeapon_id = 202 WHERE Player_id = 2;
UPDATE STATS SET MostUsedWeapon_id = 203 WHERE Player_id = 3;
UPDATE STATS SET MostUsedWeapon_id = 204 WHERE Player_id = 4;
UPDATE STATS SET MostUsedWeapon_id = 205 WHERE Player_id = 5;
UPDATE STATS SET MostUsedWeapon_id = 201 WHERE Player_id = 6;
UPDATE STATS SET MostUsedWeapon_id = 202 WHERE Player_id = 7;

-- Populate CHARACTERS table
INSERT INTO CHARACTERS (Name, Gender, Skill, type, Char_ID)
VALUES
  ('Dj Alok', 'Male', 'Heals 3HP/sec for 10 sec.', 'Active', 601),
  ('Dimitri', 'Male', 'a 3.5m radius  zone is created. For 6 sec help up automatically triggered', 'Active', 602),
  ('Kelly', 'Female', 'sprinting speed increase by 6%.', 'Passive', 603),
  ('Andrew', 'Male', 'Armor durabulity loss decreases by 25%.', 'Passive', 604),
  ('A124', 'Female', 'Disables enemies skill activation for 20sec.', 'Active', 605);

-- Populate WSKININFO table
INSERT INTO WSKININFO (Name, shooting_range, Damage, Rate_of_fire, Armour_penetration)
VALUES
  ('Dragon AK', 20, 10, 300, 5),
  ('Scorching Sands', 15, 8, 250, 3),
  ('Cobra MP40', 25, 12, 350, 7),
  ('Duke Swallow Tail', 18, 9, 280, 4),
  ('Fishy Delight', 22, 11, 320, 6);

-- Populate WINS table
INSERT INTO WINS (No_of_Matches, No_of_Wins, Win_percent)
VALUES
  (100, 30, 30),
  (80, 20, 25),
  (90, 25, 28),
  (120, 40, 33),
  (50, 40, 80),
  (30, 22, 73),
  (70, 15, 21);


-- Populate WEAPONSKINS table
INSERT INTO WEAPONSKINS (Name, Weapon_id)
VALUES
  ('Dragon AK', 201),
  ('Scorching Sands', 202),
  ('Cobra MP40', 203),
  ('Duke Swallow Tail', 204),
  ('Fishy Delight', 205);

-- Populate REWARDS table
INSERT INTO REWARDS (Name, Weapon_id, Mission_id)
VALUES
  ('Dragon AK', 201, 401),
  ('Scorching Sands', 202, 402),
  ('Cobra MP40', 203, 403),
  ('Duke Swallow Tail', 204, 404),
  ('Fishy Delight', 205, 405);

-- Populate MISSIONS table
INSERT INTO MISSIONS (Mission_id, Statement, Reward)
VALUES
  (401, 'Play the game for 300 minutes', 'Dragon AK'),
  (402, 'In CS Mode, Deal 5000 damage.', 'Scorching Sands'),
  (403, 'In BR Mode, Eliminate 22 players.', 'Cobra MP40'),
  (404, '30 Headshot kills.', 'Duke Swallow Tail'),
  (405, 'Capture the defense airdrop 5 times.', 'Fishy Delight');

-- Populate INCLUDES table
INSERT INTO INCLUDES (Match_id, Mission_id)
VALUES
  (501, 401),
  (502, 402),
  (503, 403),
  (504, 404),
  (505, 405);

-- Populate MATCHES table
INSERT INTO MATCHES (Match_id, Map, Mode)
VALUES
  (501, 'Alpine', 'BR'),
  (502, 'Purgatory', 'CS'),
  (503, 'Kalahari', 'BR'),
  (504, 'Bermuda', 'BR'),
  (505, 'Erangel', 'CS');
  
-- Populate PARTICIPATES_IN table
INSERT INTO PARTICIPATES_IN (Player_id, Match_id)
VALUES
  (1, 501),
  (2, 502),
  (3, 503),
  (4, 504),
  (5, 505);

-- Populate COMPLETES table
INSERT INTO COMPLETES (Play_ID, Mis_ID, Mat_ID)
VALUES
  (1, 401, 501),
  (2, 402, 502),
  (3, 403, 503),
  (4, 404, 504),
  (5, 405, 505);

-- Populate INVENTORY table
INSERT INTO INVENTORY (Item_id, Player_id, Equipped)
VALUES
  (601, 1, 'Yes'),
  (602, 2, 'No'),
  (603, 3, 'Yes'),
  (204, 4, 'No'),
  (205, 5, 'Yes');

-- Populate INVENTORY_ITEMS table
INSERT INTO INVENTORY_ITEMS (Item_id, Type)
VALUES
  (601, 'Character'),
  (602, 'Character'),
  (603, 'Character'),
  (204, 'Weapon Skin'),
  (205, 'Weapon Skin');

-- Populate WINNERS table
INSERT INTO WINNERS (Winner_id, Match_id)
VALUES
  (1, 501),
  (2, 502),
  (3, 503),
  (4, 504),
  (5, 505);

-- Populate FRIENDS table
INSERT INTO FRIENDS (Player_id, Friend_id)
VALUES
  (1, 2),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 5);

-- Populate BUYS_IN table
INSERT INTO BUYS_IN (Player_id, Item_id)
VALUES
  (1, 601),
  (2, 602),
  (3, 603),
  (4, 604),
  (5, 605);

-- Populate STORE table
INSERT INTO STORE (Item_id, Type, Cost)
VALUES
  (601, 'Character', 10),
  (602, 'Character', 15),
  (603, 'Character', 20),
  (604, 'Character', 12),
  (605, 'Character', 18),
  (205, 'Weapon Skin', 19);


-- Populate ACHIEVEMENTS table
INSERT INTO ACHIEVEMENTS (Player_id, achievements)
VALUES
  (1, 50),
  (2, 30),
  (3, 40),
  (4, 60),
  (5, 25);

-- Populate MEMBERS_OF table
INSERT INTO MEMBERS_OF (Guild_id, Player_id)
VALUES
  (101, 1),
  (102, 2),
  (103, 3),
  (101, 4),
  (102, 5);

-- Populate EQUIPS table
INSERT INTO EQUIPS (Play_ID, W_ID, SkinName)
VALUES
  (1, 201, 'Dragon AK'),
  (2, 202, 'Scorching Sands'),
  (3, 203, 'Cobra MP40'),
  (4, 204, 'Duke Swallow Tail'),
  (5, 205, 'Fishy Delight');
  


ALTER TABLE WINS ADD INDEX idx_No_of_Matches_Wins (No_of_Matches),ADD INDEX idx_No_of_Wins_Wins (No_of_Wins);

ALTER TABLE `ACHIEVEMENTS` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `COMPLETES` ADD FOREIGN KEY (`Play_ID`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `STATS` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `PARTICIPATES_IN` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `INVENTORY` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `WINNERS` ADD FOREIGN KEY (`Winner_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `FRIENDS` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `FRIENDS` ADD FOREIGN KEY (`Friend_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `MEMBERS_OF` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `BUYS_IN` ADD FOREIGN KEY (`Player_id`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `EQUIPS` ADD FOREIGN KEY (`Play_ID`) REFERENCES `PLAYERS` (`Player_id`);

ALTER TABLE `BUYS_IN` ADD FOREIGN KEY (`Item_id`) REFERENCES `STORE` (`Item_id`);

ALTER TABLE `CHARACTERS` ADD FOREIGN KEY (`Char_ID`) REFERENCES `STORE` (`Item_id`);

ALTER TABLE `MEMBERS_OF` ADD FOREIGN KEY (`Guild_id`) REFERENCES `GUILD` (`Guild_id`);

ALTER TABLE `PLAYERS` ADD FOREIGN KEY (`Guild_id`) REFERENCES `GUILD` (`Guild_id`);

ALTER TABLE `EQUIPS` ADD FOREIGN KEY (`W_ID`) REFERENCES `WEAPONS` (`Weapon_id`);

ALTER TABLE `STATS` ADD FOREIGN KEY (`MostUsedWeapon_id`) REFERENCES `WEAPONS` (`Weapon_id`);

ALTER TABLE `REWARDS` ADD FOREIGN KEY (`Weapon_id`) REFERENCES `WEAPONS` (`Weapon_id`);

ALTER TABLE `WEAPONSKINS` ADD FOREIGN KEY (`Weapon_id`) REFERENCES `WEAPONS` (`Weapon_id`);

ALTER TABLE `WEAPONSKINS` ADD FOREIGN KEY (`Name`) REFERENCES `WSKININFO` (`Name`);

ALTER TABLE `REWARDS` ADD FOREIGN KEY (`Name`) REFERENCES `WEAPONSKINS` (`Name`);

ALTER TABLE `EQUIPS` ADD FOREIGN KEY (`SkinName`) REFERENCES `WEAPONSKINS` (`Name`);

ALTER TABLE `STATS` ADD FOREIGN KEY (`No_of_Matches`) REFERENCES `WINS` (`No_of_Matches`);

ALTER TABLE STATS ADD CONSTRAINT STATS_ibfk_4 FOREIGN KEY (No_of_Matches, No_of_Wins) REFERENCES WINS(No_of_Matches, No_of_Wins);

ALTER TABLE `REWARDS` ADD FOREIGN KEY (`Mission_id`) REFERENCES `MISSIONS` (`Mission_id`);

ALTER TABLE `INCLUDES` ADD FOREIGN KEY (`Mission_id`) REFERENCES `MISSIONS` (`Mission_id`);

ALTER TABLE `COMPLETES` ADD FOREIGN KEY (`Mis_ID`) REFERENCES `MISSIONS` (`Mission_id`);

ALTER TABLE `INCLUDES` ADD FOREIGN KEY (`Match_id`) REFERENCES `MATCHES` (`Match_id`);

ALTER TABLE `WINNERS` ADD FOREIGN KEY (`Match_id`) REFERENCES `MATCHES` (`Match_id`);

ALTER TABLE `PARTICIPATES_IN` ADD FOREIGN KEY (`Match_id`) REFERENCES `MATCHES` (`Match_id`);

ALTER TABLE `COMPLETES` ADD FOREIGN KEY (`Mat_ID`) REFERENCES `MATCHES` (`Match_id`);

ALTER TABLE `INVENTORY` ADD FOREIGN KEY (`Item_id`) REFERENCES `INVENTORY_ITEMS` (`Item_id`);
