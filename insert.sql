-- Заполняем таблицу Genre
insert into Genre (name) values
('Rock'),
('Pop'),
('Jazz');

-- Заполняем таблицу Artist
insert into Artist (name) values
('The Beatles'),
('Elton John'),
('Miles Davis'),
('Adele');

-- Заполняем таблицу Album
insert into Album (title, release_year) values
('Abbey Road', 1969),
('Goodbye Yellow Brick Road', 1973),
('Kind of Blue', 1959);

-- Заполняем таблицу Track
insert into Track (title, duration, album_id) values
('Come Together', '00:04:20', 1),
('Something', '00:03:03', 1),
('Goodbye Yellow Brick Road', '00:03:13', 2),
('Candle in the Wind', '00:03:50', 2),
('So What', '00:09:22', 3),
('My Freddie Freeloader', '00:09:49', 3);

-- Заполняем таблицу Collection
insert into Collection (title, release_year) values
('Classic Rock', 2020),
('Best of Pop', 2021),
('Jazz Essentials', 2021),
('Greatest Hits', 2022);

-- Заполняем таблицу Artist_Genre
insert into Artist_Genre (artist_id, genre_id) values
(1, 1), -- The Beatles -> Rock
(2, 1), -- Elton John -> Rock
(3, 3), -- Miles Davis -> Jazz
(4, 2); -- Adele -> Pop

-- Заполняем таблицу Artist_Album
insert into Artist_Album (artist_id, album_id) values
(1, 1), -- The Beatles -> Abbey Road
(2, 2), -- Elton John -> Goodbye Yellow Brick Road
(3, 3); -- Miles Davis -> Kind of Blue

-- Заполняем таблицу Collection_Track
insert into Collection_Track (collection_id, track_id) values
(1, 1), -- Classic Rock -> Come Together
(1, 2), -- Classic Rock -> Something
(2, 3), -- Best of Pop -> Goodbye Yellow Brick Road
(2, 4), -- Best of Pop -> Candle in the Wind
(3, 5), -- Jazz Essentials -> So What
(3, 6), -- Jazz Essentials -> My Freddie Freeloader
(4, 1), -- Greatest Hits -> Come Together
(4, 3), -- Greatest Hits -> Goodbye Yellow Brick Road
(4, 5); -- Greatest Hits -> So What

-- Проверка заполнения таблицы:
select * from Genre;
select * from Artist;
select * from Album;
select * from Collection;
select * from Track;

select * from Artist_Genre;
select * from Artist_Album;
select * from Collection_Track;