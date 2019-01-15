-- Query all of the entries in the Genre table
SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist (ArtistName, YearEstablished)
VALUES( "Keith Urban", 1997)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES("Ripcord", "2016", 45, "Capitol Records", 28, 11)

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Some Song", 123, "2016", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Country" AND Artist.ArtistName = "Keith Urban" AND Album.Title = "Ripcord"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT Song.Title as 'song title', Album.Title as 'album title', artist.artistName as 'artist Name'
FROM Song
LEFT JOIN Album on Album.AlbumId = Song.AlbumId
LEFT JOIN Artist on Song.ArtistId = Artist.ArtistId
WHERE Artist.ArtistName = "Keith Urban"
AND Album.Title = "Ripcord"

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Album.Title as Album, COUNT(Song.Title) as Song
From Album
LEFT JOIN Song on Song.AlbumId = Album.AlbumId
GROUP BY Album.Title

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Artist.ArtistName as Artist, COUNT(Song.Title) as Song
From Artist
LEFT JOIN Song on Song.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Genre.Label as Genre, COUNT(Song.Title) as Song
From Genre
LEFT JOIN Song on Song.GenreId = Genre.GenreId
GROUP BY Genre.Label

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, MAX(AlbumLength)
FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, MAX(SongLength)
FROM Song

-- Modify the previous query to also display the title of the album.
SELECT Song.Title as'Song Title', Album.Title as 'Album', MAX(Song.SongLength)
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId
