-- Создание таблицы Genre
create table Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы Artist
create table Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы Album
create table Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Создание таблицы Collection
create table Collection (
	id SERIAL primary key,
	title VARCHAR(255) not null,
	release_year INT not null
);

-- Создание таблицы Track
create table Track (
	id SERIAL primary key,
	title VARCHAR(255) not null,
	duration TIME not null, 
	album_id INT,
	constraint fk_album_id foreign key (album_id) references Album(id)
);

-- Создание таблицы Artist_Genre
create table Artist_Genre (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    CONSTRAINT fk_artist_genre_artist FOREIGN KEY (artist_id) REFERENCES Artist(id),
    CONSTRAINT fk_artist_genre_genre FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

-- Создание таблицы Artist_Album
create table Artist_Album (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    CONSTRAINT fk_artist_album_artist FOREIGN KEY (artist_id) REFERENCES Artist(id),
    CONSTRAINT fk_artist_album_album FOREIGN KEY (album_id) REFERENCES Album(id)
);

-- Создание таблицы Collection_Track
create table Collection_Track (
    collection_id INT,
    track_id INT,
    PRIMARY KEY (collection_id, track_id),
    CONSTRAINT fk_collection_id FOREIGN KEY (collection_id) REFERENCES Collection(id),
    CONSTRAINT fk_track_id FOREIGN KEY (track_id) REFERENCES Track(id)
);