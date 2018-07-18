-- Query all of the entries in the Genre table
SELECT * FROM Genre
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ("Britney Spears", 1998)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Britney", 1998, 600, "People", 28, 7)

--multiple albums added--
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ("Britney", 1998, 600, "People", 28, 7), ("Britney2", 1999, 400, "People", 28, 7)


-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreID, ArtistId, AlbumId)
VALUES ("SingSong", 30, 1998, 7, 28, 24)

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreID, ArtistId, AlbumId)
VALUES ("BlahBlah", 800, 1999, 7, 28, 23)

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT a.Title, s.Title 
FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId
JOIN artist ON a.artistId = Artist.ArtistId
WHERE Artist.ArtistName = "Britney Spears"

        -- Reminder: Direction of join matters. Try the following statements and see the difference in results.

        -- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
        -- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT AlbumId, COUNT(SongId) 
FROM Song
GROUP BY AlbumId
--^^^Simple version
SELECT COUNT(SongId) AS "Song Count", Album.Title AS "Album Title"
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId --needs representation of what is COMMON between both tables
GROUP BY Album.Title -- Sorty By Album Title
--^^^More robust version

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT ArtistId, COUNT(songId)
FROM Song
GROUP BY ArtistId
--^^^Simple version

SELECT COUNT(SongId) AS "Song Count", Artist.ArtistName AS "Artist"
FROM Song
LEFT JOIN Artist ON Song.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistName
--^^^More robust version

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT GenreId, COUNT(songId)
FROM Song
GROUP BY GenreId
--^^^Simple Version

SELECT COUNT(SongId) AS "Song Count", Genre.Label AS "Genre"
FROM Song
LEFT JOIN Genre ON Song.GenreId = Genre.GenreId
GROUP BY Genre.Label -- Sort by Genre
--^^^More robust version

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(AlbumLength) AS "Album Length", Album.Title AS "Album Title" -- Here we are not joining tables but looking at two columns within the same table.  WHERE isn't necessary
FROM Album


-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(SongLength) AS "Song Length", Song.Title AS "Song"
FROM Song 


-- Modify the previous query to also display the title of the album.
SELECT MAX(SongLength) AS "Song Length", Song.Title AS "Song", Album.Title
FROM Song -- Result is 'THUG'
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId
