CREATE DATABASE IF NOT EXISTS booking CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password CHAR(60) NOT NULL
) engine=InnoDB;

CREATE TABLE payment_methods (
  id INT PRIMARY KEY AUTO_INCREMENT,
  method VARCHAR(20)
) engine=InnoDB;

CREATE TABLE complexes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  complex_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL
) engine=InnoDB;

CREATE TABLE halls (
  id INT AUTO_INCREMENT,
  hall_number INT(11) NOT NULL,
  seats INT(11) NOT NULL,
  has INT(11) NOT NULL,
  FOREIGN KEY (has) REFERENCES complexes(id) ON DELETE CASCADE, 
  PRIMARY KEY (id, has)
) engine=InnoDB;

CREATE TABLE movies_screening (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  screening_time DATETIME NOT NULL,
  hall INT NOT NULL
) engine=InnoDB;

CREATE TABLE administrators (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password CHAR(60) NOT NULL,
  manage INT(11),
  FOREIGN KEY (manage) REFERENCES complexes(id)
) engine=InnoDB;

CREATE TABLE screened_at (
  movies_screening_id INT(11) NOT NULL,
  complexes_id INT(11) NOT NULL,
  PRIMARY KEY (movies_screening_id, complexes_id),
  FOREIGN KEY (movies_screening_id) REFERENCES movies_screening(id),
  FOREIGN KEY (complexes_id) REFERENCES complexes(id)
) engine=InnoDB;

CREATE TABLE tickets (
  id INT PRIMARY KEY AUTO_INCREMENT,
  category VARCHAR(20) NOT NULL,
  pricing DECIMAL(3,2) NOT NULL,
  customer INT(11) NOT NULL,
  payment INT(11) NOT NULL,
  grant_access_to INT(11) NOT NULL,
  FOREIGN KEY (customer) REFERENCES users(id),
  FOREIGN KEY (payment) REFERENCES payment_methods(id),
  FOREIGN KEY (grant_access_to) REFERENCES movies_screening(id)
) engine=InnoDB;


--- REMPLISSAGE DES TABLES ---

INSERT INTO users (first_name, last_name, email, password)
VALUES ('Hirsch', 'David', 'hdavid0@tumblr.com', '$2y$10$7EPMf/TX.6A08Vy5kEhw1...CQQFFbmZ1617iHNi0bho9ba8NW4ce');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Colby', 'Benny', 'cbenny1@jalbum.net', '$2y$10$yBCtRUXAAhYNZ2J3PTV/POEP86A9Z2XZ8V5OQNuPDdCAvikeNtJCa');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Denice', 'Giddings', 'dgiddings2@adobe.com', '$2y$10$O.4dYxI0LF55qypyjgaGK.ERUGYtQsBgcLj.0xuJ.H81KwO5Au5K2');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Clementius', 'Younie', 'cyounie3@phoca.cz', '$2y$10$7NOQ4IkcB1dj08wZUzqUhu2xekSNoWmkaBDyuxuz8OKY1De.EiNXu');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Evelyn', 'List', 'elist4@marketwatch.com', '$2y$10$595fhLhv4BBf2.azWD/2veiquA1cG7q66yPDwXSpuXL6hEUsFXrOq');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Tarrance', 'O''Connolly', 'toconnolly5@microsoft.com', '$2y$10$gJd.kNUQZMn4nHGMvAbjueGykCjFLfRBeonfG/YePKhLWxfgupQGi');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Maisie', 'McDonald', 'mmcdonald6@amazonaws.com', '$2y$10$hxuU1udQTX1tyECgDA1zlu0bXB6faUyLAzFU7V9n6QN/GjWjwQUC6');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Ardine', 'Shadfourth', 'ashadfourth7@gravatar.com', '$2y$10$fg4TQnQAk5J8RcieyO4W9.YaLoGQTRmJTA1PrZJXE1OqiAcrRjGhG');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Kiley', 'Cozzi', 'kcozzi8@latimes.com', '$2y$10$VkHABmulFA2Em2zed.O16OtCKGClxlqMUu9WmQDuC.OQ3YfPcGRLC');
INSERT INTO users (first_name, last_name, email, password)
VALUES ('Kari', 'Moorrud', 'kmoorrud9@livejournal.com', '$2y$10$1FrxVZHeexUdacFkqhBX1uBK3Zgb9O.6cP4NaJYaFn.W.NSF/HASO');

INSERT INTO payment_methods (method) VALUES ('Sur place'), ('En ligne');

INSERT INTO complexes (complex_name, city) VALUES ('Pathé', 'Limoges'), ('Grand Écran', 'Feytiat'), ('Cinevox', 'Panazol'), ('Capitole', 'Isle');

INSERT INTO administrators (first_name, last_name, email, password, manage)
VALUES ('Clea', 'Antoney', 'cantoney0@bravesites.com', '$2y$10$CkZbu0qDxdn65QPpfRM59e8kqEuzOOg/K/dTV0l7kABieuIDu5sA.', 1);
INSERT INTO administrators (first_name, last_name, email, password, manage)
VALUES ('Ronica', 'Critchley', 'rcritchley1@lulu.com', '$2y$10$TWovFvbsOm97L0YXo6Cq/elj/SVe8GQ50uIXMXDRPN2ljcRGqAHgK', 2);
INSERT INTO administrators (first_name, last_name, email, password, manage)
VALUES ('Brittney', 'Soot', 'bsoot2@e-recht24.de', '$2y$10$AwwHp0r.YMq62Q4yBNxxUOnH1te9.UHTQC47QqeK2qRb3Zdj3.mXa', 3);
INSERT INTO administrators (first_name, last_name, email, password, manage)
VALUES ('Rachel', 'Widdowes', 'rwiddowes3@seattletimes.com', '$2y$10$/eW4bU8/Zt1mp1WetBOVCOow74a07865QlFrHbdtI3VL9i20FJOoG', 4);
INSERT INTO administrators (first_name, last_name, email, password)
VALUES ('Valentina', 'Boase', 'vboase0@ucoz.com', '$2y$10$EWIxvpzCDdFYmsOakLV1JePlwAZgoJ7xlJNm09.Z4J2TYl7YcPAzW');
INSERT INTO administrators (first_name, last_name, email, password)
VALUES ('Donny', 'Wallas', 'dwallas1@sphinn.com', '$2y$10$TZ3fIB/RZ.Z52qc.n3oUkugIKfEOsOOk3WnL5cu8e4SrfkKCquA4m');

INSERT INTO halls (hall_number, seats, has) VALUES 
(1, 60, 1),
(2, 70, 1),
(3, 70, 1),
(4, 90, 1),
(5, 80, 1),

(1, 80, 2),
(2, 90, 2),
(3, 100, 2),
(4, 80, 2),
(5, 80, 2),

(1, 80, 3),
(2, 85, 3),
(3, 75, 3),
(4, 60, 3),

(1, 100, 4),
(2, 90, 4),
(3, 90, 4),
(4, 70, 4),
(5, 85, 4);

INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Shooting War', '2022-05-02 19:40:00', 1);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Timber Falls', '2022-05-02 19:00:00', 2);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Coonskin', '2022-05-02 20:00:00', 3);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Ciao Bella', '2022-05-02 21:00:00', 4);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('God''s Country', '2022-05-02 20:30:00', 5);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Tripper, The', '2022-05-02 19:00:00', 6);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Dreamers, The', '2022-05-02 19:30:00', 7);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Paradise', '2022-05-02 21:20:00', 8);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Off the Map', '2022-05-02 21:45:00', 9);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Cider House Rules, The', '2022-05-02 22:20:00', 10);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Step Brothers', '2022-05-02 20:10:00', 11);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Altered States', '2022-05-02 20:30:00', 12);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Wise Guys, The', '2022-05-02 21:00:00', 13);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Ring, The', '2022-05-02 21:15:00', 14);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Abraham''s Valley', '2022-05-02 20:05:00', 15);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Finding Nemo', '2022-05-02 20:25:00', 16);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Woman''s Tale, A', '2022-05-02 20:50:00', 17);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Goldfinger', '2022-05-02 20:50:00', 18);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Gaslight', '2022-05-02 21:00:00', 19);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Flight of the Living Dead', '2022-05-02 23:30:00', 16);
INSERT INTO movies_screening (title, screening_time, hall) VALUES ('Ring, The', '2022-05-02 21:15:00', 2);

INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (1, 1);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (2, 1);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (3, 1);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (4, 1);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (5, 1);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (6, 2);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (7, 2);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (8, 2);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (9, 2);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (10, 2);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (11, 3);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (12, 3);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (13, 3);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (14, 3);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (15, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (16, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (17, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (18, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (19, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (20, 4);
INSERT INTO screened_at (movies_screening_id, complexes_id) VALUES (21, 1);

INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Plein tarif', 9.20, 1, 2, 16);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Moins de 14 ans', 5.90, 1, 2, 16);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Etudiant', 7.60, 2, 1, 8);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Moins de 14 ans', 5.90, 3, 2, 18);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Plein tarif', 9.20, 4, 2, 13);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Etudiant', 7.60, 5, 1, 19);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Plein tarif', 9.20, 6, 2, 14);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Etudiant', 7.60, 7, 1, 21);
INSERT INTO tickets (category, pricing, customer, payment, grant_access_to) VALUES ('Plein tarif', 9.20, 8, 2, 14);


--- VERIFICATION DE LA VALIDITÉ ---

-- Instruction permettant de voir les différentes séances :

SELECT movies_screening.title, complexes.complex_name, movies_screening.screening_time FROM movies_screening
JOIN screened_at ON movies_screening.id = screened_at.movies_screening_id
JOIN complexes ON  screened_at.complexes_id = complexes.id;

-- Instruction permettant d'afficher les informations sur le lieu de projection d’une séance en particulier, ainsi que le nombre de places disponibles :

SELECT movies_screening.title, complexes.complex_name, movies_screening.screening_time,
halls.hall_number, halls.seats - COUNT(tickets.grant_access_to) AS 'Places Disponibles'
FROM movies_screening
JOIN screened_at ON movies_screening.id = screened_at.movies_screening_id
JOIN complexes ON screened_at.complexes_id = complexes.id
JOIN halls ON movies_screening.hall = halls.id
JOIN tickets ON movies_screening.id = tickets.grant_access_to
WHERE movies_screening.title = 'Ring, The' AND movies_screening.id = 14;

-- Affiche la liste des utilisateurs avec l'id client, nom, prénom, méthode de paiement, tarification et le titre du film :

SELECT tickets.customer, users.first_name, users.last_name, payment_methods.method, tickets.category, title FROM tickets 
JOIN payment_methods ON tickets.payment = payment_methods.id 
JOIN users ON tickets.customer = users.id
JOIN movies_screening ON tickets.grant_access_to = movies_screening.id

-- liste des administrateurs avec leur eventuel complexe attitré
SELECT administrators.first_name, administrators.last_name, complexes.complex_name FROM administrators 
LEFT JOIN complexes ON administrators.manage = complexes.id

-- Création d'un compte 'superadmin' auquel on donne tous les accés sur la BDD :

CREATE USER 'superadmin'@localhost
IDENTIFIED BY '$2y$10$CkZbu0qDxdn65QPpfRM59e8kqEuzOOg/K/dTV0l7kABieuIDu5sA.'; 

GRANT ALL PRIVILEGES ON *.* 
TO 'superadmin'@localhost
IDENTIFIED BY '$2y$10$CkZbu0qDxdn65QPpfRM59e8kqEuzOOg/K/dTV0l7kABieuIDu5sA.'; 