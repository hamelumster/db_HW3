-- Название и продолжительность самого длительного трека
select title, duration from Track
order by duration desc 
limit 1;

-- Название треков, продолжительность которых не менее 3,5 минут
select title, duration from track 
where duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
select title, release_year from Collection 
where release_year between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова
select name from Artist
where name not like '% %';

-- Название треков, которые содержат слово «мой» или «my»
select title from Track
where title ilike '%my%' or title ilike '%мой%';

-- Задание 3 --

-- Количество исполнителей в каждом жанре
select g.name AS genre_name, count(ag.artist_id) AS artist_count from Genre g -- посчитаем количество исполнителей (COUNT(ag.artist_id)) в каждом жанре
join Artist_Genre ag on g.id = ag.genre_id -- Объединим таблицы Genre и Artist_Genre по идентификатору жанра
group by g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
-- так как нет в базе альбомов, выпущенных в 2019-2020 годах, добавим их:

insert into Album (title, release_year) values
('Blue Bird', 2020);

-- добавим треки в нужный альбом: 
insert into Track (title, duration, album_id) values
('Blue Sky', '00:03:45', 4),
('Bird Song', '00:04:10', 4);

-- Запрос для получения количества треков, вошедших в альбомы 2019–2020 годов
select count(t.id) AS track_count FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
select a.title as album_title, AVG(t.duration) as average_duration from Track t
join Album a on t.album_id = a.id 
group by a.title

-- Все исполнители, которые не выпустили альбомы в 2020 году
select a.name from Artist a
where a.id not in ( -- подзапрос, который фильтрует данные, чтобы выбрать только те альбомы, которые были выпущены в 2020 году 
    select aa.artist_id from Album al
    join Artist_Album aa ON al.id = aa.album_id
    where al.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (The Beatles)
-- нужно объединить таблицы Artist, Artist_Album, Album, Track, Collection_Track, и Collection
select DISTINCT c.title AS collection_title FROM Collection c
JOIN Collection_Track ct ON c.id = ct.collection_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'The Beatles';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
select a.title AS album_title from Album a
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist_Genre ag ON aa.artist_id = ag.artist_id
GROUP BY a.id, a.title
HAVING COUNT(DISTINCT ag.genre_id) > 1

-- Наименование треков, которые не входят в сборники
select t.title FROM Track t
LEFT JOIN Collection_Track ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
select ar.name FROM Artist ar
JOIN Artist_Album aa ON ar.id = aa.artist_id
JOIN Album al ON aa.album_id = al.id
JOIN Track t ON al.id = t.album_id
WHERE t.duration = (
    SELECT MIN(duration)
    FROM Track
);