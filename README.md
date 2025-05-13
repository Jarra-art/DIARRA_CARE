Projet SQL – Diarra Care 2

Ce projet consiste à la modélisation et à l’implémentation d’une base de données pour un centre médical fictif appelé **Diarra Care 2**. Il comprend la conception du modèle conceptuel et relationnel, la création de la base de données, l'insertion de données fictives et l'écriture de requêtes SQL pour l’analyse des données.

---

## 1. Modélisation Conceptuelle
https://lucid.app/lucidchart/1e734f38-2490-4755-b099-b471a3ed4644/edit?viewport_loc=-1423%2C-2270%2C5275%2C2573%2C0_0&invitationId=inv_23076747-f15f-4f30-af45-bc77d248a3cd
##2.Modéle relationel
## 🧩 Modèle Relationnel

PATIENT (_id_patient_, nom, prénom, sexe, date_naissance, adresse, téléphone)  
AGENT (_id_agent_, nom, prénom, spécialité, téléphone)  
CONSULTATION (_id_consultation_, date_consultation, motif, *id_patient*, *id_agent*)  
DIAGNOSTIC (_id_diagnostic_, description, type_maladie)  
CONSULTATION_DIAGNOSTIC (*id_consultation*, *id_diagnostic*)  
TRAITEMENT (_id_traitement_, nom_medicament, posologie, duree_jours, *id_diagnostic*)

##3.Modéle Logique 
https://dbdiagram.io/d/68234f6a5b2fc4582f67e26f
### Entités et attributs

- **Patient**
  
  - id_patient (PK)
  - nom
  - prenom
  - sexe
  - date_naissance
  - adresse
  - telephone
- **Agent_de_sante**
  
  - id_agent (PK)
  - nom
  - prenom
  - specialite
  - telephone
- **Consultation**
  
  - id_consultation (PK)
  - date_consultation
  - motif
  - id_patient (FK)
  - id_agent (FK)
- **Diagnostic**
  
  - id_diagnostic (PK)
  - description
  - type_maladie
- **Consultation_Diagnostic**
  
  - id_consultation (FK)
  - id_diagnostic (FK)
- **Traitement**
  
  - id_traitement (PK)
  - nom_medicament
  - posologie
  - duree_jours
  - id_diagnostic (FK)

---

## 2. Création des tables

```sql
CREATE TABLE Patient (
    id_patient INT PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(50),
    prenom VARCHAR(50),
    sexe VARCHAR(10),
    date_naissance DATE,
    adresse VARCHAR(100),
    telephone VARCHAR(20)
);

CREATE TABLE Agent_de_sante (
    id_agent INT PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(50),
    prenom VARCHAR(50),
    specialite VARCHAR(100),
    telephone VARCHAR(20)
);

CREATE TABLE Consultation (
    id_consultation INT PRIMARY KEY IDENTITY(1,1),
    date_consultation DATE,
    motif TEXT,
    id_patient INT,
    id_agent INT,
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient),
    FOREIGN KEY (id_agent) REFERENCES Agent_de_sante(id_agent)
);

CREATE TABLE Diagnostic (
    id_diagnostic INT PRIMARY KEY IDENTITY(1,1),
    description TEXT,
    type_maladie VARCHAR(100)
);

CREATE TABLE Consultation_Diagnostic (
    id_consultation INT,
    id_diagnostic INT,
    FOREIGN KEY (id_consultation) REFERENCES Consultation(id_consultation),
    FOREIGN KEY (id_diagnostic) REFERENCES Diagnostic(id_diagnostic)
);

CREATE TABLE Traitement (
    id_traitement INT PRIMARY KEY IDENTITY(1,1),
    nom_medicament VARCHAR(100),
    posologie TEXT,
    duree_jours INT,
    id_diagnostic INT,
    FOREIGN KEY (id_diagnostic) REFERENCES Diagnostic(id_diagnostic)
);
```

---

## 3. Données insérées

### Patients

15 patients insérés avec leurs identifiants, noms, prénoms, sexe, dates de naissance, adresses et numéros de téléphone.
INSERT INTO Patient (nom, prenom, sexe, date_naissance, adresse, telephone) VALUES
('Diop', 'Awa', 'F', '1990-05-12', 'Dakar', '778889900'),
('Fall', 'Mamadou', 'M', '1985-03-22', 'Thies', '771234567'),
('Sow', 'Fatou', 'F', '1992-07-18', 'Saint-Louis', '776543210'),
('Ba', 'Alioune', 'M', '1988-09-30', 'Ziguinchor', '770123456'),
('Ndiaye', 'Aminata', 'F', '1995-01-05', 'Kaolack', '779876543'),
('Seck', 'Cheikh', 'M', '1983-12-10', 'Louga', '775432198'),
('Kane', 'Seynabou', 'F', '1991-06-15', 'Fatick', '771112233'),
('Camara', 'Ibrahima', 'M', '1986-11-25', 'Kolda', '778899001'),
('Diallo', 'Adama', 'F', '1993-04-20', 'Tambacounda', '774455667'),
('Faye', 'Mame', 'F', '1989-08-14', 'Kebemer', '776667788'),
('Gueye', 'Lamine', 'M', '1987-02-28', 'Rufisque', '779900112'),
('Dieng', 'Astou', 'F', '1990-10-10', 'Tivaouane', '775566778'),
('Ndoye', 'Babacar', 'M', '1984-07-01', 'Matam', '778811223'),
('Mbaye', 'Khady', 'F', '1996-03-08', 'Bambey', '770055668'),
('Sagna', 'El Hadji', 'M', '1992-12-03', 'Podor', '772223344');


### Agents de santé

5 agents de santé insérés avec nom, prénom, spécialité, et téléphone.
INSERT INTO Agent (nom, prenom, specialite, telephone) VALUES
('Fall', 'Ousmane', 'Généraliste', '781234567'),
('Sarr', 'Moussa', 'Cardiologue', '782345678'),
('Ly', 'Awa', 'Pédiatre', '783456789'),
('Ndour', 'Fatou', 'Dermatologue', '784567890'),
('Sy', 'Cheikh', 'Neurologue', '785678901');


### Consultations

20 consultations créées, associées à des patients et agents valides (id_patient entre 1 et 15, id_agent entre 1 et 5).
INSERT INTO Consultation (date_consultation, motif, id_patient, id_agent) VALUES
('2024-01-05', 'Fièvre', 1, 1),
('2024-01-06', 'Toux', 2, 2),
('2024-01-07', 'Douleur thoracique', 3, 3),
('2024-01-08', 'Rhumatisme', 4, 4),
('2024-01-09', 'Maux de tête', 5, 5),
('2024-01-10', 'Fatigue', 6, 1),
('2024-01-11', 'Grippe', 7, 2),
('2024-01-12', 'Vertige', 8, 3),
('2024-01-13', 'Douleur abdominale', 9, 4),
('2024-01-14', 'Infection', 10, 5),
('2024-01-15', 'Stress', 11, 1),
('2024-01-16', 'Tension artérielle', 12, 2),
('2024-01-17', 'Fièvre', 13, 3),
('2024-01-18', 'Mal de dos', 14, 4),
('2024-01-19', 'Diabète', 15, 5),
('2024-01-20', 'Fatigue', 1, 2),
('2024-01-21', 'Toux', 2, 3),
('2024-01-22', 'Grippe', 3, 4),
('2024-01-23', 'Fièvre', 4, 5),
('2024-01-24', 'Diabète', 5, 1);


### Diagnostics

8 diagnostics insérés.
INSERT INTO Diagnostic (description, type_maladie) VALUES
('Grippe saisonnière', 'Infectieuse'),
('Hypertension', 'Chronique'),
('Diabète de type 2', 'Métabolique'),
('Migraine', 'Neurologique'),
('Asthme', 'Respiratoire'),
('Gastrite', 'Digestive'),
('Dermatite', 'Cutanée'),
('Anémie', 'Hématologique');


### Consultations_Diagnostics

Associations entre consultations et diagnostics pour permettre plusieurs diagnostics par consultation.
INSERT INTO Consultation_Diagnostic (id_consultation, id_diagnostic) VALUES
(1, 1),
(2, 5),
(3, 2),
(4, 4),
(5, 3),
(6, 7),
(7, 6),
(8, 2),
(9, 1),
(10, 3),
(11, 4),
(12, 5),
(13, 8),
(14, 2),
(15, 3),
(16, 6),
(17, 5),
(18, 1),
(19, 7),
(20, 3);


### Traitements

15 traitements liés à des diagnostics avec médicaments, posologie, durée, etc.
INSERT INTO Traitement (nom_medicament, posologie, duree_jours, id_diagnostic) VALUES
('Paracétamol', '500mg x 3/jour', 5, 1),
('Ventoline', '2 bouffées x 2/jour', 7, 5),
('Amlodipine', '5mg x 1/jour', 30, 2),
('Metformine', '850mg x 2/jour', 60, 3),
('Ibuprofène', '400mg x 2/jour', 5, 4),
('Oméprazole', '20mg x 1/jour', 10, 6),
('Crème hydrocortisone', '1 application/jour', 7, 7),
('Fer', '1 comprimé/jour', 20, 8),
('Doliprane', '1000mg x 3/jour', 3, 1),
('Salbutamol', '1 inhalation x 2/jour', 5, 5),
('Captopril', '25mg x 2/jour', 30, 2),
('Glibenclamide', '5mg x 1/jour', 45, 3),
('Sumatriptan', '50mg au besoin', 5, 4),
('Ranitidine', '150mg x 2/jour', 14, 6),
('Bepanthen', '1 application/jour', 10, 7);


---

## 4. Requêtes SQL

### Requêtes de base

```sql
-- Lister tous les patients avec leur date de naissance
SELECT nom, prenom, date_naissance FROM Patient;

-- Afficher les consultations du patient "Diop Awa"
SELECT * FROM Consultation 
WHERE id_patient IN (
    SELECT id_patient FROM Patient WHERE nom = 'Diop' AND prenom = 'Awa'
);

-- Compter le nombre total de patients enregistrés
SELECT COUNT(*) AS total_patients FROM Patient;

-- Lister les agents de santé par ordre alphabétique
SELECT * FROM Agent_de_sante ORDER BY nom ASC;
```

### Requêtes avec jointures

```sql
-- Lister les consultations avec le nom du patient et le nom de l’agent
SELECT C.id_consultation, P.nom AS nom_patient, A.nom AS nom_agent, C.date_consultation
FROM Consultation C
JOIN Patient P ON C.id_patient = P.id_patient
JOIN Agent_de_sante A ON C.id_agent = A.id_agent;

-- Afficher les diagnostics associés à chaque consultation
SELECT CD.id_consultation, D.description
FROM Consultation_Diagnostic CD
JOIN Diagnostic D ON CD.id_diagnostic = D.id_diagnostic;

-- Lister les traitements prescrits à un patient donné
SELECT T.nom_medicament, T.posologie, T.duree_jours, P.nom, P.prenom
FROM Patient P
JOIN Consultation C ON P.id_patient = C.id_patient
JOIN Consultation_Diagnostic CD ON C.id_consultation = CD.id_consultation
JOIN Diagnostic D ON CD.id_diagnostic = D.id_diagnostic
JOIN Traitement T ON D.id_diagnostic = T.id_diagnostic
WHERE P.nom = 'Diop' AND P.prenom = 'Awa';

-- Afficher tous les patients ayant eu plus d’un diagnostic
SELECT P.nom, P.prenom, COUNT(DISTINCT CD.id_diagnostic) AS nb_diagnostics
FROM Patient P
JOIN Consultation C ON P.id_patient = C.id_patient
JOIN Consultation_Diagnostic CD ON C.id_consultation = CD.id_consultation
GROUP BY P.nom, P.prenom
HAVING COUNT(DISTINCT CD.id_diagnostic) > 1;
```

### Requêtes avancées

```sql
-- Nombre de consultations par mois
SELECT MONTH(date_consultation) AS mois, COUNT(*) AS total_consultations
FROM Consultation
GROUP BY MONTH(date_consultation);

-- Spécialité d’agent ayant réalisé le plus de consultations
SELECT TOP 1 A.specialite, COUNT(*) AS nb_consultations
FROM Consultation C
JOIN Agent_de_sante A ON C.id_agent = A.id_agent
GROUP BY A.specialite
ORDER BY nb_consultations DESC;

-- Patients ayant reçu un traitement de plus de 7 jours
SELECT DISTINCT P.nom, P.prenom
FROM Patient P
JOIN Consultation C ON P.id_patient = C.id_patient
JOIN Consultation_Diagnostic CD ON C.id_consultation = CD.id_consultation
JOIN Diagnostic D ON CD.id_diagnostic = D.id_diagnostic
JOIN Traitement T ON D.id_diagnostic = T.id_diagnostic
WHERE T.duree_jours > 7;

-- Maladies les plus fréquentes diagnostiquées
SELECT type_maladie, COUNT(*) AS freq
FROM Diagnostic D
JOIN Consultation_Diagnostic CD ON D.id_diagnostic = CD.id_diagnostic
GROUP BY type_maladie
ORDER BY freq DESC;

-- Patients ayant consulté au moins 2 fois dans les 30 derniers jours
SELECT P.nom, P.prenom, COUNT(*) AS nb_consultations
FROM Patient P
JOIN Consultation C ON P.id_patient = C.id_patient
WHERE C.date_consultation >= DATEADD(DAY, -30, GETDATE())
GROUP BY P.nom, P.prenom
HAVING COUNT(*) >= 2;

-- Traitements utilisés pour le diabète
SELECT DISTINCT T.nom_medicament
FROM Traitement T
JOIN Diagnostic D ON T.id_diagnostic = D.id_diagnostic
WHERE D.type_maladie LIKE '%diabète%';
```

---

## 5. Outils utilisés

- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)**
- **Git & GitHub** (pour le versionnement et le dépôt final)
- **draw.io** (pour le diagramme E-A)

---

## 6. Diagramme E-A

Voir le fichier : `A_digital_Entity-Relationship_(ER)_diagram_illustr.png`

---

## 7. Organisation des données

- Chaque entité a une clé primaire unique.
- Relations 1-N et N-N représentées via les clés étrangères et les tables associatives.
- Données cohérentes : les identifiants référencés existent toujours dans les autres tables.

---

## Fin du projet

Ce projet a été réalisé pour illustrer la création d'une base de données médicale avec des cas réels de consultation, diagnostic et traitement. Toutes les requêtes ont été testées sur Microsoft SQL Server.
