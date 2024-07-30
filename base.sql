DROP TABLE IF EXISTS etudiant;
DROP TABLE IF EXISTS emplois_du_temps;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS fields;
DROP TABLE IF EXISTS salles;
DROP TABLE IF EXISTS absences;
DROP TABLE IF EXISTS ouvertures_porte;

CREATE TABLE etudiant (
    etudiant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    cin VARCHAR(8) NOT NULL,
    email TEXT NOT NULL,
    classes INTEGER NOT NULL,
    fields INTEGER NOT NULL,
    password TEXT NOT NULL,
    FOREIGN KEY (classes) REFERENCES classes(id),
    FOREIGN KEY (fields) REFERENCES fields(id)
);

CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE fields (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE salles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE emplois_du_temps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classe_id INTEGER NOT NULL,
    periode VARCHAR(50) NOT NULL,
    matiére VARCHAR(50) NOT NULL,
    fields_id INTEGER NOT NULL,
    salles_id INTEGER NOT NULL,
    FOREIGN KEY (salles_id) REFERENCES salles(id),
    FOREIGN KEY (fields_id) REFERENCES fields(id),
    FOREIGN KEY (classe_id) REFERENCES classes(id)
);


CREATE TABLE absences (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    etudiant_id INTEGER NOT NULL,
    emploi_du_temps_id INTEGER NOT NULL,
    salle_id INTEGER NOT NULL,
    presence BOOLEAN NOT NULL,
    date_absence DATE NOT NULL,
    carte_rfid VARCHAR(20) NOT NULL,
    cin VARCHAR(20) NOT NULL,
    FOREIGN KEY (etudiant_id) REFERENCES etudiant(etudiant_id),
    FOREIGN KEY (emploi_du_temps_id) REFERENCES emplois_du_temps(id),
    FOREIGN KEY (salle_id) REFERENCES salles(id)
);

CREATE TABLE ouvertures_porte (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    carte_rfid VARCHAR(20) NOT NULL,
    date_ouverture DATETIME NOT NULL,
    salles_id INTEGER NOT NULL,
    FOREIGN KEY (salles_id) REFERENCES salles(id)
);



-- Insert data into salles table
INSERT INTO salles (id, salle_name) VALUES (1, 'Salle A');
INSERT INTO salles (id, salle_name) VALUES (2, 'Salle B');
INSERT INTO salles (id, salle_name) VALUES (3, 'Salle C');
INSERT INTO salles (id, salle_name) VALUES (4, 'Salle D');
INSERT INTO salles (id, salle_name) VALUES (5, 'Salle E');
INSERT INTO salles (id, salle_name) VALUES (6, 'Salle F');
INSERT INTO salles (id, salle_name) VALUES (7, 'Salle G');
INSERT INTO salles (id, salle_name) VALUES (8, 'Salle H');

-- Insert data into fields table
INSERT INTO fields (id, field_name) VALUES (1, 'ISI');
INSERT INTO fields (id, field_name) VALUES (2, 'SI');
INSERT INTO fields (id, field_name) VALUES (3, 'IT');
INSERT INTO fields (id, field_name) VALUES (4, 'IG');

-- Insert data into classes table
INSERT INTO classes (id, classe_name) VALUES (1, '1');
INSERT INTO classes (id, classe_name) VALUES (2, '2');
INSERT INTO classes (id, classe_name) VALUES (3, '3');



-- Insert data into emplois_du_temps table
INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 08:00-10:00', 'Algèbre', 1, 1);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 10:00-12:00', 'Mécanique', 1, 7);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 14:00-16:00', 'base de donné', 1, 4);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Lundi 16:00-18:00', 'Analyse', 1, 8);





INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 08:00-10:00', 'Algorithmique', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 10:00-12:00', 'Électronique', 1, 4);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 14:00-16:00', 'Probabilité', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 16:00-18:00', 'Électromagnétisme', 1, 4);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 08:00-10:00', 'Algorithmique', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 10:00-12:00', 'Électromagnétisme', 1, 4);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 08:00-10:00', 'Algorithmique', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 10:00-12:00', 'Électromagnétisme', 1, 4);


INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 08:00-10:00', 'Algorithmique', 1, 2);

INSERT INTO emplois_du_temps (classe_id, periode, matiére, fields_id, salles_id)
VALUES (1, 'Mardi 10:00-12:00', 'Électromagnétisme', 1, 4);
