CREATE DATABASE IF NOT EXISTS sportradar;
USE sportradar;

CREATE TABLE `game` (
  `game_id` int NOT NULL,
  `away_team_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_team_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game` (`game_id`, `away_team_name`, `home_team_name`, `start_time`, `end_time`) VALUES
(2022020320, 'Colorado Avalanche', 'Nashville Predators', '2023-04-15 03:00:00', '2023-04-15 05:31:46');

ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`);
COMMIT;

CREATE TABLE `player_game` (
  `game_id` int NOT NULL,
  `player_id` int NOT NULL,
  `player_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `team_id` int NOT NULL,
  `team_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `player_age` int NOT NULL,
  `player_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `player_position` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `assists` int DEFAULT '0',
  `goals` int DEFAULT '0',
  `hits` int DEFAULT '0',
  `points` int DEFAULT '0',
  `penalty_minutes` int DEFAULT '0',
  `opponnet_team` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_game` (`game_id`, `player_id`, `player_name`, `team_id`, `team_name`, `player_age`, `player_number`, `player_position`, `assists`, `goals`, `hits`, `points`, `penalty_minutes`, `opponnet_team`) VALUES
(2022020320, 8471677, 'Jack Johnson', 21, 'Colorado Avalanche', 36, '3', 'D', 0, 0, 4, 0, 0, 'Nashville Predators'),
(2022020320, 8471699, 'Andrew Cogliano', 21, 'Colorado Avalanche', 35, '11', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8471794, 'Darren Helm', 21, 'Colorado Avalanche', 36, '43', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8473446, 'Erik Johnson', 21, 'Colorado Avalanche', 35, '6', 'D', 0, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8474151, 'Ryan McDonagh', 18, 'Nashville Predators', 33, '27', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8474189, 'Lars Eller', 21, 'Colorado Avalanche', 33, '20', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8474600, 'Roman Josi', 18, 'Nashville Predators', 32, '59', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8475168, 'Matt Duchene', 18, 'Nashville Predators', 32, '95', 'C', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8475197, 'Tyson Barrie', 18, 'Nashville Predators', 31, '22', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8475793, 'Ryan Johansen', 18, 'Nashville Predators', 30, '92', 'C', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8476312, 'Josh Manson', 21, 'Colorado Avalanche', 31, '42', 'D', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8476442, 'Matt Nieto', 21, 'Colorado Avalanche', 30, '83', 'LW', 0, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8476779, 'Brad Hunt', 21, 'Colorado Avalanche', 34, '17', 'D', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8476851, 'Alex Galchenyuk', 21, 'Colorado Avalanche', 29, '47', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8476873, 'Mark Jankowski', 18, 'Nashville Predators', 28, '17', 'C', 0, 0, 1, 0, 0, 'Colorado Avalanche'),
(2022020320, 8476925, 'Colton Sissons', 18, 'Nashville Predators', 29, '10', 'C', 1, 0, 3, 0, 0, 'Colorado Avalanche'),
(2022020320, 8477073, 'Kurtis MacDermid', 21, 'Colorado Avalanche', 29, '56', 'D', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8477446, 'Michael McCarron', 18, 'Nashville Predators', 28, '47', 'RW', 0, 0, 2, 0, 0, 'Colorado Avalanche'),
(2022020320, 8477456, 'J.T. Compher', 21, 'Colorado Avalanche', 28, '37', 'LW', 0, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8477476, 'Artturi Lehkonen', 21, 'Colorado Avalanche', 27, '62', 'LW', 0, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8477482, 'Zach Sanford', 18, 'Nashville Predators', 28, '12', 'LW', 0, 0, 4, 0, 0, 'Colorado Avalanche'),
(2022020320, 8477492, 'Nathan MacKinnon', 21, 'Colorado Avalanche', 27, '29', 'C', 1, 3, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8477501, 'Valeri Nichushkin', 21, 'Colorado Avalanche', 28, '13', 'RW', 0, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8478038, 'Devon Toews', 21, 'Colorado Avalanche', 29, '7', 'D', 1, 1, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8478420, 'Mikko Rantanen', 21, 'Colorado Avalanche', 26, '96', 'RW', 2, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8478438, 'Tommy Novak', 18, 'Nashville Predators', 25, '82', 'C', 1, 0, 1, 0, 0, 'Colorado Avalanche'),
(2022020320, 8478468, 'Jeremy Lauzon', 18, 'Nashville Predators', 25, '3', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8478508, 'Yakov Trenin', 18, 'Nashville Predators', 26, '13', 'C', 1, 0, 1, 0, 0, 'Colorado Avalanche'),
(2022020320, 8478542, 'Evan Rodrigues', 21, 'Colorado Avalanche', 29, '9', 'C', 1, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8478843, 'Denis Malgin', 21, 'Colorado Avalanche', 26, '81', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8478851, 'Alexandre Carrier', 18, 'Nashville Predators', 26, '45', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8479335, 'Rasmus Asplund', 18, 'Nashville Predators', 25, '71', 'C', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8479371, 'Dante Fabbro', 18, 'Nashville Predators', 24, '57', 'D', 0, 0, 2, 0, 0, 'Colorado Avalanche'),
(2022020320, 8479398, 'Samuel Girard', 21, 'Colorado Avalanche', 24, '49', 'D', 1, 0, 1, 0, 0, 'Nashville Predators'),
(2022020320, 8479984, 'Cal Foote', 18, 'Nashville Predators', 24, '52', 'D', 1, 0, 2, 0, 0, 'Colorado Avalanche'),
(2022020320, 8479996, 'Cody Glass', 18, 'Nashville Predators', 24, '8', 'C', 0, 0, 2, 0, 0, 'Colorado Avalanche'),
(2022020320, 8480069, 'Cale Makar', 21, 'Colorado Avalanche', 24, '8', 'D', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8480382, 'Alexandar Georgiev', 21, 'Colorado Avalanche', 27, '40', 'G', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8480748, 'Kiefer Sherwood', 18, 'Nashville Predators', 28, '44', 'LW', 0, 2, 2, 0, 0, 'Colorado Avalanche'),
(2022020320, 8480947, 'Kevin Lankinen', 18, 'Nashville Predators', 27, '32', 'G', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8481056, 'Spencer Stastney', 18, 'Nashville Predators', 23, '81', 'D', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8481186, 'Logan O\'Connor', 21, 'Colorado Avalanche', 26, '25', 'RW', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8481524, 'Bowen Byram', 21, 'Colorado Avalanche', 21, '4', 'D', 0, 0, 2, 0, 0, 'Nashville Predators'),
(2022020320, 8481577, 'Philip Tomasino', 18, 'Nashville Predators', 21, '26', 'C', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8481618, 'Alex Newhook', 21, 'Colorado Avalanche', 22, '18', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8481704, 'Juuso Parssinen', 18, 'Nashville Predators', 22, '75', 'C', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8482062, 'Cole Smith', 18, 'Nashville Predators', 27, '36', 'LW', 0, 0, 0, 0, 0, 'Colorado Avalanche'),
(2022020320, 8482146, 'Luke Evangelista', 18, 'Nashville Predators', 21, '77', 'RW', 0, 1, 1, 0, 0, 'Colorado Avalanche'),
(2022020320, 8483570, 'Ben Meyers', 21, 'Colorado Avalanche', 24, '59', 'C', 0, 0, 0, 0, 0, 'Nashville Predators'),
(2022020320, 8484256, 'Jake Livingstone', 18, 'Nashville Predators', 24, '23', 'D', 0, 0, 1, 0, 0, 'Colorado Avalanche');

ALTER TABLE `player_game`
  ADD PRIMARY KEY (`game_id`,`player_id`);
COMMIT;
