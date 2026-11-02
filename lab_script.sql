USE video_games ;
DESCRIBE games ;
SELECT * FROM games LIMIT 8 ;
SELECT * FROM platform LIMIT 10 ;
SELECT * FROM genre ORDER BY genre_id ;
SELECT * FROM publisher LIMIT 10 ;
SELECT g.game_id, g.title, p.platform_name, g.year, ge.genre_name, pb.publisher_name, g.global_sales FROM games g JOIN platform p ON g.platform_id = p.platform_id JOIN genre ge ON g.genre_id = ge.genre_id LEFT JOIN publisher pb ON g.publisher_id = pb.publisher_id ORDER BY g.game_id LIMIT 8 ;
SELECT (SELECT COUNT(*) FROM games_backup) AS before_cnt, (SELECT COUNT(*) FROM games) AS after_cnt ;