DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Showtime;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema (
CinemaID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Address VARCHAR(255) NOT NULL,
Phone VARCHAR(20)
);
CREATE TABLE Theater (
TheaterID INT PRIMARY KEY,
CinemaID INT,
Name VARCHAR(50) NOT NULL,
Capacity INT NOT NULL,
ScreenType VARCHAR(50),
FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
);
CREATE TABLE Movie (
MovieID INT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
Director VARCHAR(100),
ReleaseDate DATE,
DurationMinutes INT,
Rating VARCHAR(5)
);
CREATE TABLE Showtime (
ShowtimeID INT PRIMARY KEY,
MovieID INT,
TheaterID INT,
ShowDateTime DATETIME NOT NULL,
Price DECIMAL(5,2) NOT NULL,
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
);

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100),
PhoneNumber VARCHAR(20)
);
CREATE TABLE Ticket (
TicketID INT PRIMARY KEY,
ShowtimeID INT,
SeatNumber VARCHAR(10) NOT NULL,
PurchasedDateTime DATETIME NOT NULL,
CustomerID INT,
FOREIGN KEY (ShowtimeID) REFERENCES Showtime(ShowtimeID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE Review (
ReviewID INT PRIMARY KEY,
MovieID INT,
CustomerID INT,
ReviewText TEXT,
Rating INT CHECK (Rating >= 1 AND Rating <= 5),
ReviewDate DATETIME NOT NULL,
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
CinemaID INT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Position VARCHAR(50),
HireDate DATE,
FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
);


INSERT INTO Cinema (CinemaID, Name, Address, Phone) VALUES
(1, 'Cineplex Odeon', '123 Main Street', '555-1234'),
(2, 'AMC Theatres', '456 Elm Street', '555-5678'),
(3, 'Regal Cinemas', '789 Oak Street', '555-9012'),
(4, 'Vue Cinemas', '101 Pine Street', '555-3456'),
(5, 'Cinemark', '202 Maple Street', '555-7890'),
(6, 'Omniplex Cinemas', '303 Cedar Street', '555-2345');


INSERT INTO Theater (TheaterID, CinemaID, Name, Capacity, ScreenType) VALUES
(1, 1, 'Screen 1', 150, 'IMAX'),
(2, 1, 'Screen 2', 100, 'Standard'),
(3, 2, 'Theater 1', 120, '3D'),
(4, 2, 'Theater 2', 90, 'Standard'),
(5, 3, 'Auditorium 1', 200, 'Standard'),
(6, 3, 'Auditorium 2', 180, 'Standard');


INSERT INTO Movie (MovieID, Title, Director, ReleaseDate, DurationMinutes, Rating) VALUES
(1, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', '1999-03-31', 136, '5'),
(2, 'Inception', 'Christopher Nolan', '2010-07-16', 148, '3'),
(3, 'Pulp Fiction', 'Quentin Tarantino', '1994-10-14', 154, '4'),
(4, 'The Shawshank Redemption', 'Frank Darabont', '1994-10-14', 142, '5'),
(5, 'The Dark Knight', 'Christopher Nolan', '2008-07-18', 152, '1'),
(6, 'Interstellar', 'Christopher Nolan', '2014-11-07', 169, '2');
INSERT INTO Movie (MovieID, Title, Director, ReleaseDate, DurationMinutes, Rating) VALUES
(7, 'The Shawshank Redemption', 'Frank Darabont', '1994-10-14', 142, '5'),
(8, 'The Dark Knight', 'Christopher Nolan', '2008-07-18', 152, '1'),
(9, 'Interstellar', 'Christopher Nolan', '2014-11-07', 169, '2');


INSERT INTO Showtime (ShowtimeID, MovieID, TheaterID, ShowDateTime, Price) VALUES
(1, 1, 1, CONVERT(datetime, '2024-03-15 18:00:00', 120), 12.50),
(2, 2, 3, CONVERT(datetime, '2024-03-15 19:00:00', 120), 11.00),
(3, 3, 5, CONVERT(datetime, '2024-03-15 20:00:00', 120), 10.00),
(4, 4, 6, CONVERT(datetime, '2024-03-15 21:00:00', 120), 9.50),
(5, 5, 2, CONVERT(datetime, '2024-03-15 22:00:00', 120), 11.50),
(6, 6, 4, CONVERT(datetime, '2024-03-15 23:00:00', 120), 10.50);
INSERT INTO Showtime (ShowtimeID, MovieID, TheaterID, ShowDateTime, Price) VALUES
(7, 4, 6, CONVERT(datetime, '2024-03-15 21:00:00', 120), 9.50),
(8, 4, 6, CONVERT(datetime, '2024-03-15 21:00:00', 120), 9.50),
(9, 4, 6, CONVERT(datetime, '2024-03-15 21:00:00', 120), 9.50);





INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1111'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-2222'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-3333'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '555-4444'),
(5, 'William', 'Jones', 'william.jones@example.com', '555-5555'),
(6, 'Olivia', 'Garcia', 'olivia.garcia@example.com', '555-6666');

INSERT INTO Ticket (TicketID, ShowtimeID, SeatNumber, PurchasedDateTime, CustomerID) VALUES
(1, 1, 'A1', CONVERT(datetime, '2024-03-15 17:30:00', 120), 1),
(2, 2, 'B3', CONVERT(datetime, '2024-03-15 18:45:00', 120), 2),
(3, 3, 'C5', CONVERT(datetime, '2024-03-15 19:30:00', 120), 3),
(4, 4, 'D7', CONVERT(datetime, '2024-03-15 20:45:00', 120), 4),
(5, 5, 'E9', CONVERT(datetime, '2024-03-15 21:45:00', 120), 5),
(6, 6, 'F11', CONVERT(datetime, '2024-03-15 22:45:00', 120), 6);

INSERT INTO Review (ReviewID, MovieID, CustomerID, ReviewText, Rating, ReviewDate) VALUES
(1, 1, 1, 'Fantastic movie!', 5, CONVERT(datetime, '2024-03-15 20:00:00', 120)),
(2, 2, 2, 'Mind-bending!', 4, CONVERT(datetime, '2024-03-15 21:00:00', 120)),
(3, 3, 3, 'Classic!', 5, CONVERT(datetime, '2024-03-15 22:00:00', 120)),
(4, 4, 4, 'A masterpiece!', 5, CONVERT(datetime, '2024-03-15 23:00:00', 120)),
(5, 5, 5, 'Amazing performance by Heath Ledger.', 5, CONVERT(datetime, '2024-03-15 23:30:00', 120)),
(6, 6, 6, 'Epic journey through space and time.', 4, CONVERT(datetime, '2024-03-15 00:00:00', 120));


INSERT INTO Employee (EmployeeID, CinemaID, FirstName, LastName, Position, HireDate) VALUES
(1, 1, 'David', 'Smith', 'Manager', '2020-01-15'),
(2, 2, 'Jennifer', 'Johnson', 'Assistant Manager', '2021-03-20'),
(3, 3, 'Michael', 'Williams', 'Clerk', '2022-05-10'),
(4, 4, 'Jessica', 'Brown', 'Clerk', '2023-07-05'),
(5, 5, 'Daniel', 'Jones', 'Janitor', '2023-09-15'),
(6, 6, 'Sarah', 'Garcia', 'Janitor', '2022-12-01');


/*Creare una vista FilmsInProgrammation che mostri i titoli dei film, la data di inizio
programmazione, la durata e la classificazione per rating. Questa vista aiuterà il personale e i clienti a
vedere rapidamente quali film sono attualmente in programmazione.*/

DROP VIEW IF EXISTS FilmsInProgrammation;

CREATE VIEW FilmsInProgrammation AS
	SELECT
		Title AS FilmTitle,
		ReleaseDate AS StartDate,
		DurationMinutes AS Duration,
		Rating AS RatingClassification
	FROM Movie;

SELECT * FROM FilmsInProgrammation;


/*Creare una vista AvailableSeatsForShow che, per ogni spettacolo, mostri il numero totale di
posti nella sala e quanti sono ancora disponibili. Questa vista è essenziale per il personale alla
biglietteria per gestire le vendite dei biglietti*/
DROP VIEW IF EXISTS AvailableSeatsForShow;


CREATE VIEW AvailableSeatsForShow AS
	SELECT
		Showtime.ShowtimeID,
		Theater.TheaterID,
		(Theater.Capacity - COUNT(Ticket.TicketID)) AS AvailableSeats
	FROM Theater
	JOIN Showtime ON Theater.TheaterID = Showtime.TheaterID
	JOIN Ticket ON Showtime.ShowtimeID = Ticket.ShowtimeID
	GROUP BY Showtime.ShowtimeID, Theater.TheaterID, Theater.Capacity;

SELECT * FROM AvailableSeatsForShow;


/*Generare una vista TotalEarningsPerMovie che elenchi ogni film insieme agli incassi totali
generati. Questa informazione è cruciale per la direzione per valutare il successo commerciale dei
film.*/

DROP VIEW IF EXISTS TotalEarningsPerMovie;

CREATE VIEW TotalEarningsPerMovie AS
	SELECT
		Movie.MovieID,
		Movie.Title AS MovieTitle,
		SUM(Showtime.Price) AS TotalEarnings
	FROM Movie
	JOIN Showtime ON Movie.MovieID = Showtime.MovieID
	GROUP BY Movie.MovieID, Movie.Title;

SELECT * FROM TotalEarningsPerMovie;



/*
Creare una vista RecentReviews che mostri le ultime recensioni lasciate dai clienti, includendo il
titolo del film, la valutazione, il testo della recensione e la data. Questo permetterà al personale e
alla direzione di monitorare il feedback dei clienti in tempo reale.
*/

DROP VIEW IF EXISTS RecentReviews;
CREATE VIEW RecentReviews AS
	SELECT
		Review.ReviewID,
		Movie.Title AS MovieTitle,
		Review.Rating,
		Review.ReviewText,
		Review.ReviewDate
	FROM Review 
	JOIN Movie ON Review.MovieID = Movie.MovieID
	--ORDER BY 
	--	ReviewDate DESC;

SELECT * 
	FROM RecentReviews
	ORDER BY ReviewDate DESC;


-------------------------------------------------------------------------------------
---STORED PROCEDURES--

/*1. Procedura di Acquisto Biglietti
Creare una stored procedure PurchaseTicket che permetta di acquistare un biglietto per uno
spettacolo, specificando l'ID dello spettacolo, il numero del posto e l'ID del cliente. La procedura
dovrebbe verificare la disponibilità del posto e registrare l'acquisto.*/
DROP PROCEDURE IF EXISTS PurchaseTicket;
CREATE PROCEDURE PurchaseTicket 
	@ShowtimeID INT,
	@SeatNumber VARCHAR(10),
	@TicketID INT,
	@CustomerID INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
			DECLARE @Capacity INT;
			DECLARE @AvailableSeats INT;
		
			-- trova capacita
			SELECT @Capacity = Capacity
			FROM Theater
			JOIN Showtime ON Theater.TheaterID = Showtime.TheaterID
			WHERE Showtime.ShowtimeID = @ShowtimeID;

			-- conta posti
			SELECT @AvailableSeats = @Capacity - COUNT(TicketID)
			FROM Ticket
			WHERE ShowtimeID = @ShowtimeID;
		
			-- controllo disponib.
			IF @AvailableSeats > 0
				BEGIN
					INSERT INTO Ticket (TicketID,ShowtimeID,SeatNumber, PurchasedDateTime, CustomerID)VALUES 
					(@TicketID,@ShowtimeID, @SeatNumber, GETDATE(), @CustomerID);
		COMMIT TRANSACTION;
					PRINT 'Ticket purchased successfully.';
				END
			ELSE
				BEGIN
					PRINT 'Sorry, no seats available for this showtime.';
				END
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		PRINT 'An error occurred: ' + ERROR_MESSAGE();
	END CATCH;
END;




EXEC PurchaseTicket @TicketID = 7, @ShowtimeID = 1, @SeatNumber = 'A2', @CustomerID = 1;

select * from Ticket;


/*2. Procedura di Aggiornamento Programmazione Film
Implementare una stored procedure UpdateMovieSchedule che permetta di aggiornare gli orari
degli spettacoli per un determinato film. Questo include la possibilità di aggiungere o rimuovere
spettacoli dall'agenda.*/


--CREATE PROCEDURE UpdateMovieSchedule;

/*3. Procedura di Inserimento Nuovo Film
Sviluppare una stored procedure InsertNewMovie che consenta di inserire un nuovo film nel
sistema, richiedendo tutti i dettagli pertinenti come titolo, regista, data di uscita, durata e
classificazione.*/	



CREATE PROCEDURE InsertNewMovie
	@MovieIDValue INT,
	@TitleValue VARCHAR(255),
	@DirectorValue VARCHAR(100),
	@ReleaseDateValue DATE,
	@DurationMinutesValue INT,
	@RatingValue VARCHAR(5)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Movie (MovieID, Title, Director, ReleaseDate, DurationMinutes, Rating) VALUES
			(@MovieIDValue,@TitleValue,@DirectorValue,@ReleaseDateValue,@DurationMinutesValue,@RatingValue)
		PRINT 'Inserimento eseguito con successo'
	END TRY
	BEGIN CATCH
		PRINT 'Ho incontrato l''errore: ' + ERROR_MESSAGE()
	END CATCH
END;

EXEC InsertNewMovie 
	@MovieIDValue = 10,
	@TitleValue = 'by the window',
	@DirectorValue = 'helionsky', 
	@ReleaseDateValue = '2024-03-15 21:00:00',
	@DurationMinutesValue = 120,
	@RatingValue = 3;

SELECT * FROM Movie;


/*4. Procedura per Registrare una Recensione
Creare una stored procedure SubmitReview che consenta ai clienti di lasciare una recensione per
un film, comprensiva di valutazione, testo e data. Questa procedura dovrebbe verificare che il
cliente abbia effettivamente acquistato un biglietto per il film in questione prima di permettere la
pubblicazione della recensione.*/

DROP PROCEDURE IF EXISTS SubmitReview;
CREATE PROCEDURE SubmitReview
    @CustomerID INT,
    @MovieID INT,
    @ReviewText TEXT,
    @Rating INT

AS
BEGIN
	BEGIN TRY
		DECLARE @HasPurchased INT;
		DECLARE @ExistingReviews INT;
		SELECT @HasPurchased = COUNT(*)
		FROM Ticket 
		JOIN Showtime ON Ticket.ShowtimeID = Showtime.ShowtimeID
		WHERE Ticket.CustomerID = @CustomerID
		AND Showtime.MovieID = @MovieID;

		SELECT @ExistingReviews = COUNT(*)
		FROM Review
		WHERE MovieID = @MovieID
		AND CustomerID = @CustomerID;


		IF @HasPurchased > 0 AND @ExistingReviews = 0
			BEGIN
				INSERT INTO Review (MovieID, CustomerID, ReviewText, Rating, ReviewDate)
				VALUES (@MovieID, @CustomerID, @ReviewText, @Rating, GETDATE());
        
				PRINT 'Review submitted successfully.';
			END
		ELSE
			BEGIN
				PRINT 'Erroor: no tickets purchased, cannot enter this review';
			END
	END TRY
	BEGIN CATCH
		 PRINT 'HO INCONtrato l''errore: ' + ERROR_MESSAGE()
	END CATCH
END;

EXEC SubmitReview 
    @CustomerID = 1,
    @MovieID = 1,
    @ReviewText = 'Fantastic movie!',
    @Rating = 5;

EXEC SubmitReview 
    @CustomerID = 2,
    @MovieID = 1,
    @ReviewText = 'Great movie!',
    @Rating = 4;

EXEC SubmitReview 
    @CustomerID = 4,
    @MovieID = 4,
    @ReviewText = 'A masterpiece!',
    @Rating = 5;


