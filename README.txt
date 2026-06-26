BuiltToGrow
===========

Progetto per il corso di Tecnologie Software per il Web
Universita' degli Studi di Salerno - Corso di Laurea in Informatica
Anno Accademico 2025/2026

Docente:  Attilio Della Greca
Gruppo:   Gyathub 67
Studenti: Danilo Gargano (0512122237)
          Mario Boccia   (0512121457)


CHE COS'E'
----------
BuiltToGrow e' un sito web e-commerce dedicato al mondo del fitness.
Vende integratori alimentari, abbigliamento sportivo e accessori per
chi si allena. L'obiettivo e' permettere a un utente di navigare il
catalogo, mettere i prodotti nel carrello e completare un acquisto.


COSA SI PUO' FARE
-----------------
- Visitatore: sfogliare il catalogo, cercare prodotti e vedere le offerte.
- Utente registrato: accedere, gestire il carrello, acquistare e vedere
  lo storico degli ordini.
- Amministratore: gestire prodotti, ordini e utenti.


COM'E' STRUTTURATO (pattern MVC)
--------------------------------
Il sito segue il pattern MVC (Model-View-Controller), cioe' divide il
codice in tre parti con ruoli diversi:

- Model  -> i dati e le regole (JavaBean + accesso al database con JDBC).
- View   -> quello che l'utente vede (pagine JSP con HTML, CSS, JavaScript).
- Controller -> la logica che collega le due cose (le Servlet).

In pratica: l'utente clicca su una pagina (View), la Servlet (Controller)
riceve la richiesta, chiede i dati al Model, e poi mostra il risultato.


TECNOLOGIE USATE
----------------
- Java 11
- Apache Tomcat 9 (server)
- Servlet e JSP (lato server)
- JavaBean (oggetti dati)
- JDBC + MySQL (database)
- HTML5, CSS3, JavaScript, AJAX (lato client)


COLORI DEL SITO
---------------
- Verde scuro   #38761d  (bottoni, checkout)
- Verde chiaro  #6aa84f  (link, login)
- Bianco        #ffffff  (sfondo)
- Grigio chiaro #b7b7b7  (sfondi secondari)
- Nero          #000000  (testi)
