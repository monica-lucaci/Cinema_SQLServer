## Richieste di Creazione di Viste
1. Vista dei Film in Programmazione
Creare una vista FilmsInProgrammation che mostri i titoli dei film, la data di inizio
programmazione, la durata e la classificazione per età. Questa vista aiuterà il personale e i clienti a
vedere rapidamente quali film sono attualmente in programmazione.

2. Vista Posti Disponibili per Spettacolo
Creare una vista AvailableSeatsForShow che, per ogni spettacolo, mostri il numero totale di
posti nella sala e quanti sono ancora disponibili. Questa vista è essenziale per il personale alla
biglietteria per gestire le vendite dei biglietti.

3. Vista Incassi Totali per Film
Generare una vista TotalEarningsPerMovie che elenchi ogni film insieme agli incassi totali
generati. Questa informazione è cruciale per la direzione per valutare il successo commerciale dei
film.

4. Vista Recensioni Recenti
Creare una vista RecentReviews che mostri le ultime recensioni lasciate dai clienti, includendo il
titolo del film, la valutazione, il testo della recensione e la data. Questo permetterà al personale e
alla direzione di monitorare il feedback dei clienti in tempo reale.


## Richieste di Creazione di Stored Procedures
1. Procedura di Acquisto Biglietti
Creare una stored procedure PurchaseTicket che permetta di acquistare un biglietto per uno
spettacolo, specificando l'ID dello spettacolo, il numero del posto e l'ID del cliente. La procedura
dovrebbe verificare la disponibilità del posto e registrare l'acquisto.
2. Procedura di Aggiornamento Programmazione Film
Implementare una stored procedure UpdateMovieSchedule che permetta di aggiornare gli orari
degli spettacoli per un determinato film. Questo include la possibilità di aggiungere o rimuovere
spettacoli dall'agenda.
3. Procedura di Inserimento Nuovo Film
Sviluppare una stored procedure InsertNewMovie che consenta di inserire un nuovo film nel
sistema, richiedendo tutti i dettagli pertinenti come titolo, regista, data di uscita, durata e
classificazione.
4. Procedura per Registrare una Recensione
Creare una stored procedure SubmitReview che consenta ai clienti di lasciare una recensione per
un film, comprensiva di valutazione, testo e data. Questa procedura dovrebbe verificare che il
cliente abbia effettivamente acquistato