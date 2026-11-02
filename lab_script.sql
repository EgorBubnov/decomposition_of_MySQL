ALTER TABLE games DROP COLUMN platform, DROP COLUMN genre, DROP COLUMN publisher ;

ALTER TABLE games
  ADD CONSTRAINT fk_games_platform FOREIGN KEY (platform_id) REFERENCES platform (platform_id),
  ADD CONSTRAINT fk_games_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id),
  ADD CONSTRAINT fk_games_publisher FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id) ;