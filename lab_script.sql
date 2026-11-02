INSERT IGNORE INTO platform (platform_name) SELECT DISTINCT platform FROM games WHERE platform IS NOT NULL ;
INSERT IGNORE INTO genre (genre_name) SELECT DISTINCT genre FROM games WHERE genre IS NOT NULL ;
INSERT IGNORE INTO publisher (publisher_name) SELECT DISTINCT publisher FROM games WHERE publisher IS NOT NULL ;

SELECT COUNT(*) AS platform_cnt FROM platform ;
SELECT COUNT(*) AS genre_cnt FROM genre ;
SELECT COUNT(*) AS publisher_cnt FROM publisher ;