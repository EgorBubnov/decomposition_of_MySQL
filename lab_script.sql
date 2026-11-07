
DROP TABLE IF EXISTS demo_games;
CREATE TABLE demo_games LIKE games_backup;
INSERT INTO demo_games SELECT * FROM games_backup;


CREATE TABLE demo_platform (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(20) NOT NULL UNIQUE
);
INSERT INTO demo_platform (platform_name) 
SELECT DISTINCT platform FROM demo_games WHERE platform IS NOT NULL;


ALTER TABLE demo_games ADD COLUMN platform_id INT;
UPDATE demo_games g JOIN demo_platform p ON g.platform = p.platform_name SET g.platform_id = p.platform_id;
ALTER TABLE demo_games DROP COLUMN platform; 
ALTER TABLE demo_games ADD CONSTRAINT fk_demo_platform FOREIGN KEY (platform_id) REFERENCES demo_platform (platform_id);

CREATE TABLE demo_genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(30) NOT NULL UNIQUE
);
INSERT INTO demo_genre (genre_name) 
SELECT DISTINCT genre FROM demo_games WHERE genre IS NOT NULL;

-- Связываем игры с жанрами
ALTER TABLE demo_games ADD COLUMN genre_id INT;
UPDATE demo_games g JOIN demo_genre ge ON g.genre = ge.genre_name SET g.genre_id = ge.genre_id;
ALTER TABLE demo_games DROP COLUMN genre;
ALTER TABLE demo_games ADD CONSTRAINT fk_demo_genre FOREIGN KEY (genre_id) REFERENCES demo_genre (genre_id);


CREATE TABLE demo_publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO demo_publisher (publisher_name) 
SELECT DISTINCT publisher FROM demo_games WHERE publisher IS NOT NULL;

ALTER TABLE demo_games ADD COLUMN publisher_id INT;
UPDATE demo_games g JOIN demo_publisher pb ON g.publisher = pb.publisher_name SET g.publisher_id = pb.publisher_id;
ALTER TABLE demo_games DROP COLUMN publisher;
ALTER TABLE demo_games ADD CONSTRAINT fk_demo_publisher FOREIGN KEY (publisher_id) REFERENCES demo_publisher (publisher_id);


SELECT * FROM demo_platform;


SELECT * FROM demo_genre;


SELECT * FROM demo_publisher;


SELECT * FROM demo_games;


SELECT 
    g.title AS "Название игры", 
    p.platform_name AS "Платформа", 
    ge.genre_name AS "Жанр", 
    pb.publisher_name AS "Издатель"
FROM demo_games g
JOIN demo_platform p ON g.platform_id = p.platform_id
JOIN demo_genre ge ON g.genre_id = ge.genre_id
LEFT JOIN demo_publisher pb ON g.publisher_id = pb.publisher_id
LIMIT 15;
