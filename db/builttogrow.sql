CREATE DATABASE IF NOT EXISTS builttogrow;
USE builttogrow;

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
