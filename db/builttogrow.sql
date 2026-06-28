CREATE DATABASE IF NOT EXISTS builttogrow;
USE builttogrow;

DROP TABLE IF EXISTS recensione;
DROP TABLE IF EXISTS dettaglio_ordine;
DROP TABLE IF EXISTS ordine;
DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS prodotto;
DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descrizione VARCHAR(500)
);

CREATE TABLE prodotto (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descrizione VARCHAR(500),
	prezzo DECIMAL(10,2) NOT NULL,
	quantita INT DEFAULT 0,
	categoria_id INT,
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE utente (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	ruolo VARCHAR(20) NOT NULL DEFAULT 'cliente',
	data_registrazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ordine (
	id INT AUTO_INCREMENT PRIMARY KEY,
	utente_id INT NOT NULL,
	data_ordine TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	prezzo_totale DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (utente_id) REFERENCES utente(id)
);

CREATE TABLE dettaglio_ordine (
	id INT AUTO_INCREMENT PRIMARY KEY,
	ordine_id INT NOT NULL,
	prodotto_id INT,
	quantita INT NOT NULL,
	prezzo_unitario DECIMAL(10,2) NOT NULL,
	iva DECIMAL(4,2) NOT NULL,
	FOREIGN KEY (ordine_id) REFERENCES ordine(id),
	FOREIGN KEY (prodotto_id) REFERENCES prodotto(id) ON DELETE SET NULL
);

CREATE TABLE recensione (
	id INT AUTO_INCREMENT PRIMARY KEY,
	utente_id INT NOT NULL,
	prodotto_id INT NOT NULL,
	stelle INT NOT NULL CHECK (stelle BETWEEN 1 AND 5),
	descrizione VARCHAR(500),
	data_recensione TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (utente_id) REFERENCES utente(id),
	FOREIGN KEY (prodotto_id) REFERENCES prodotto(id)
);

INSERT INTO categoria (nome, descrizione) VALUES
('Proteine', 'Proteine in polvere per il recupero muscolare'),
('Creatina', 'Integratori di creatina per la forza'),
('Vitamine', 'Vitamine e sali minerali'),
('Abbigliamento', 'Abbigliamento tecnico sportivo'),
('Accessori', 'Shaker, borse e accessori per il fitness');

INSERT INTO prodotto (nome, descrizione, prezzo, quantita, categoria_id) VALUES
('Proteine Whey 1kg', 'Proteine del siero del latte, gusto cioccolato', 34.99, 50, 1),
('Creatina Monoidrato', 'Creatina monoidrato micronizzata, 300g', 19.99, 80, 2),
('Vitamine Multipack', 'Complesso multivitaminico, 60 compresse', 14.99, 100, 3),
('T-Shirt Performance', 'Maglietta tecnica traspirante da uomo', 24.99, 40, 4),
('Shaker BuiltToGrow', 'Shaker da 600ml con griglia anti-grumi', 9.99, 200, 5),
('Cintura Sollevamento', 'Cintura da powerlifting in pelle', 39.99, 25, 5);

INSERT INTO utente (nome, email, password, ruolo) VALUES
('Danilo Gargano', 'danilo@builttogrow.it', 'password123', 'cliente'),
('Mario Boccia', 'mario@builttogrow.it', 'password123', 'cliente'),
('Admin', 'admin@builttogrow.it', 'admin123', 'admin');

INSERT INTO ordine (utente_id, prezzo_totale) VALUES
(1, 59.97),
(2, 44.98);
