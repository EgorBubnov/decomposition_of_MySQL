ALTER TABLE games ADD COLUMN platform_id INT, ADD COLUMN genre_id INT, ADD COLUMN publisher_id INT ;

UPDATE games g JOIN platform p ON g.platform = p.platform_name SET g.platform_id = p.platform_id ;
UPDATE games g JOIN genre ge ON g.genre = ge.genre_name SET g.genre_id = ge.genre_id ;
UPDATE games g JOIN publisher pb ON g.publisher = pb.publisher_name SET g.publisher_id = pb.publisher_id ;

SELECT COUNT(*) AS no_platform FROM games WHERE platform_id IS NULL ;
SELECT COUNT(*) AS no_genre FROM games WHERE genre_id IS NULL ;
SELECT COUNT(*) AS no_publisher FROM games WHERE publisher_id IS NULL ;