USE video_games ;
SET SQL_SAFE_UPDATES = 0 ;
CREATE TABLE games_backup LIKE games ;
INSERT INTO games_backup SELECT * FROM games ;
SELECT COUNT(*) AS backup_cnt FROM games_backup ;
SELECT COUNT(*) AS games_cnt FROM games ;