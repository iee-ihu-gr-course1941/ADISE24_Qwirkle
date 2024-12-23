-- --------------------------------------------------------
-- Διακομιστής:                  localhost
-- Έκδοση διακομιστή:            10.4.32-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for πίνακας qwirkle.board
CREATE TABLE IF NOT EXISTS `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('W','W') NOT NULL,
  `piece_color` enum('R','O','Y','G','B','P') DEFAULT NULL,
  `piece` enum('C','14','D','S','8','CL') DEFAULT NULL,
  PRIMARY KEY (`y`,`x`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qwirkle.board: ~64 rows (approximately)
INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `piece`) VALUES
	(1, 1, 'W', NULL, NULL),
	(2, 1, 'W', NULL, NULL),
	(3, 1, 'W', NULL, NULL),
	(4, 1, 'W', NULL, NULL),
	(5, 1, 'W', NULL, NULL),
	(6, 1, 'W', NULL, NULL),
	(7, 1, 'W', NULL, NULL),
	(8, 1, 'W', NULL, NULL),
	(1, 2, 'W', NULL, NULL),
	(2, 2, 'W', NULL, NULL),
	(3, 2, 'W', NULL, NULL),
	(4, 2, 'W', NULL, NULL),
	(5, 2, 'W', NULL, NULL),
	(6, 2, 'W', NULL, NULL),
	(7, 2, 'W', NULL, NULL),
	(8, 2, 'W', NULL, NULL),
	(1, 3, 'W', NULL, NULL),
	(2, 3, 'W', NULL, NULL),
	(3, 3, 'W', NULL, NULL),
	(4, 3, 'W', NULL, NULL),
	(5, 3, 'W', NULL, NULL),
	(6, 3, 'W', NULL, NULL),
	(7, 3, 'W', NULL, NULL),
	(8, 3, 'W', NULL, NULL),
	(1, 4, 'W', NULL, NULL),
	(2, 4, 'W', NULL, NULL),
	(3, 4, 'W', NULL, NULL),
	(4, 4, 'W', NULL, NULL),
	(5, 4, 'W', NULL, NULL),
	(6, 4, 'W', NULL, NULL),
	(7, 4, 'W', NULL, NULL),
	(8, 4, 'W', NULL, NULL),
	(1, 5, 'W', NULL, NULL),
	(2, 5, 'W', NULL, NULL),
	(3, 5, 'W', NULL, NULL),
	(4, 5, 'W', NULL, NULL),
	(5, 5, 'W', NULL, NULL),
	(6, 5, 'W', NULL, NULL),
	(7, 5, 'W', NULL, NULL),
	(8, 5, 'W', NULL, NULL),
	(1, 6, 'W', NULL, NULL),
	(2, 6, 'W', NULL, NULL),
	(3, 6, 'W', NULL, NULL),
	(4, 6, 'W', NULL, NULL),
	(5, 6, 'W', NULL, NULL),
	(6, 6, 'W', NULL, NULL),
	(7, 6, 'W', NULL, NULL),
	(8, 6, 'W', NULL, NULL),
	(1, 7, 'W', NULL, NULL),
	(2, 7, 'W', NULL, NULL),
	(3, 7, 'W', NULL, NULL),
	(4, 7, 'W', NULL, NULL),
	(5, 7, 'W', NULL, NULL),
	(6, 7, 'W', NULL, NULL),
	(7, 7, 'W', NULL, NULL),
	(8, 7, 'W', NULL, NULL),
	(1, 8, 'W', NULL, NULL),
	(2, 8, 'W', NULL, NULL),
	(3, 8, 'W', NULL, NULL),
	(4, 8, 'W', NULL, NULL),
	(5, 8, 'W', NULL, NULL),
	(6, 8, 'W', NULL, NULL),
	(7, 8, 'W', NULL, NULL),
	(8, 8, 'W', NULL, NULL);

-- Dumping structure for πίνακας qwirkle.board_empty
CREATE TABLE IF NOT EXISTS `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('W','W') NOT NULL,
  `piece_color` enum('R','O','Y','G','B','P') DEFAULT NULL,
  `piece` enum('C','4','D','S','8','CL') DEFAULT NULL,
  PRIMARY KEY (`y`,`x`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table qwirkle.board_empty: ~64 rows (approximately)
INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `piece`) VALUES
	(1, 1, 'W', NULL, NULL),
	(2, 1, 'W', NULL, NULL),
	(3, 1, 'W', NULL, NULL),
	(4, 1, 'W', NULL, NULL),
	(5, 1, 'W', NULL, NULL),
	(6, 1, 'W', NULL, NULL),
	(7, 1, 'W', NULL, NULL),
	(8, 1, 'W', NULL, NULL),
	(1, 2, 'W', NULL, NULL),
	(2, 2, 'W', NULL, NULL),
	(3, 2, 'W', NULL, NULL),
	(4, 2, 'W', NULL, NULL),
	(5, 2, 'W', NULL, NULL),
	(6, 2, 'W', NULL, NULL),
	(7, 2, 'W', NULL, NULL),
	(8, 2, 'W', NULL, NULL),
	(1, 3, 'W', NULL, NULL),
	(2, 3, 'W', NULL, NULL),
	(3, 3, 'W', NULL, NULL),
	(4, 3, 'W', NULL, NULL),
	(5, 3, 'W', NULL, NULL),
	(6, 3, 'W', NULL, NULL),
	(7, 3, 'W', NULL, NULL),
	(8, 3, 'W', NULL, NULL),
	(1, 4, 'W', NULL, NULL),
	(2, 4, 'W', NULL, NULL),
	(3, 4, 'W', NULL, NULL),
	(4, 4, 'W', NULL, NULL),
	(5, 4, 'W', NULL, NULL),
	(6, 4, 'W', NULL, NULL),
	(7, 4, 'W', NULL, NULL),
	(8, 4, 'W', NULL, NULL),
	(1, 5, 'W', NULL, NULL),
	(2, 5, 'W', NULL, NULL),
	(3, 5, 'W', NULL, NULL),
	(4, 5, 'W', NULL, NULL),
	(5, 5, 'W', NULL, NULL),
	(6, 5, 'W', NULL, NULL),
	(7, 5, 'W', NULL, NULL),
	(8, 5, 'W', NULL, NULL),
	(1, 6, 'W', NULL, NULL),
	(2, 6, 'W', NULL, NULL),
	(3, 6, 'W', NULL, NULL),
	(4, 6, 'W', NULL, NULL),
	(5, 6, 'W', NULL, NULL),
	(6, 6, 'W', NULL, NULL),
	(7, 6, 'W', NULL, NULL),
	(8, 6, 'W', NULL, NULL),
	(1, 7, 'W', NULL, NULL),
	(2, 7, 'W', NULL, NULL),
	(3, 7, 'W', NULL, NULL),
	(4, 7, 'W', NULL, NULL),
	(5, 7, 'W', NULL, NULL),
	(6, 7, 'W', NULL, NULL),
	(7, 7, 'W', NULL, NULL),
	(8, 7, 'W', NULL, NULL),
	(1, 8, 'W', NULL, NULL),
	(2, 8, 'W', NULL, NULL),
	(3, 8, 'W', NULL, NULL),
	(4, 8, 'W', NULL, NULL),
	(5, 8, 'W', NULL, NULL),
	(6, 8, 'W', NULL, NULL),
	(7, 8, 'W', NULL, NULL),
	(8, 8, 'W', NULL, NULL);

-- Dumping structure for procedure qwirkle.clean_board
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
	replace into board select * from board_empty;
    END//
DELIMITER ;

-- Dumping structure for πίνακας qwirkle.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('R','B') DEFAULT NULL,
  `result` enum('R','B','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qwirkle.game_status: ~1 rows (approximately)
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('started', 'B', '', '2024-12-21 17:39:52');

-- Dumping structure for procedure qwirkle.move_piece
DELIMITER //
CREATE PROCEDURE `move_piece`(
	IN `x1` tinyint,
	IN `y1` tinyint,
	IN `putpiece` tinytext,
	IN `putcolor` tinytext
)
BEGIN
	
	update board
	SET piece=putpiece, piece_color=putcolor
	where x=x1 and y=y1;
	
	UPDATE game_status SET p_turn=if(p_turn='R','B','R');
END//
DELIMITER ;

-- Dumping structure for πίνακας qwirkle.players
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('R','B') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qwirkle.players: ~2 rows (approximately)
INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'R', NULL, NULL),
	('arr', 'B', '9baefe8617c3ecc5cdd8f6c9358987e3', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
