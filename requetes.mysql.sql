
version mysql:

Liste des bateaux participants
SELECT * FROM P03_Bateau ;

Liste des bateaux dont le nom contient « LA » ou « DO »
SELECT * FROM P03_Bateau WHERE bateau_nom LIKE '%LA%' OR '%DO%';

Liste des skippers dont le bateau à été lancé entre 2010 et 2018
SELECT * FROM P03_Skipper WHERE bateau_nom IN(SELECT bateau_nom FROM P03_Bateau WHERE bateau_anneelancement BETWEEN 2010 AND 2018) ;

Nombre de classes de bateaux
SELECT COUNT(DISTINCT bateau_classe) AS nombre_classe_bateaux FROM P03_Bateau ;

Liste des bateaux dont un skipper a un nom qui commence entre B et L
SELECT * FROM P03_Bateau.*, P03_Skipper.skipper_nom FROM P03_Bateau INNER JOIN P03_Skipper ON P03_Bateau.bateau_nom = P03_Skipper.skipper_nom WHERE  P03_Skipper.skipper_nom BETWEEN 'B%' AND 'L%';

Skippers des bateaux « REDMAN » et « VOLVO »
SELECT skipper_nom FROM P03_Skipper WHERE bateau_nom IN('REDMAN', 'VOLVO');

Noms des bateaux pilotés par un skipper prénommé « Olivier »
SELECT bateau_nom , P03_Skipper.skipper_nom FROM P03_Bateau INNER JOIN P03_Skipper ON P03_Bateau.bateau_nom = P03_Skipper.skipper_nom WHERE  skipper_nom  LIKE '%Olivier%' ;

Liste des skippers navigant sur un bateau dont le nom commence par « G »
 SELECT * FROM P03_Skipper WHERE bateau_nom LIKE 'G%' ;

Nombre de bateaux par catégorie
SELECT bateau_classe AS categorie, COUNT(bateau_nom) AS NB_Bateaux FROM P03_Bateau GROUP BY bateau_classe ;

Catégories ayant plus de 10 bateaux
SELECT bateau_classe AS categorie, COUNT(bateau_nom) AS NB_Bateaux FROM P03_Bateau GROUP BY bateau_classe HAVING NB_Bateaux>=10 ;


                           ***************************************************************

version psql:

Liste des bateaux participants
SELECT * FROM P03_Bateau ;

Liste des bateaux dont le nom contient « LA » ou « DO »
SELECT * FROM P03_Bateau WHERE bateau_nom LIKE ~ '.*LA ~ '.* OR ~ '.*DO ~ '.*;

Liste des skippers dont le bateau à été lancé entre 2010 et 2018
SELECT * FROM P03_Skipper WHERE bateau_nom IN(SELECT bateau_nom FROM P03_Bateau WHERE bateau_anneelancement BETWEEN 2010 AND 2018) ;

Nombre de classes de bateaux
SELECT COUNT(DISTINCT bateau_classe) AS nombre_classe_bateaux FROM P03_Bateau ;

Liste des bateaux dont un skipper a un nom qui commence entre B et L
SELECT * FROM P03_Bateau.*, P03_Skipper.skipper_nom FROM P03_Bateau INNER JOIN P03_Skipper ON P03_Bateau.bateau_nom = P03_Skipper.skipper_nom WHERE  P03_Skipper.skipper_nom BETWEEN 'B%' AND 'L%';

Skippers des bateaux « REDMAN » et « VOLVO »
SELECT skipper_nom FROM P03_Skipper WHERE bateau_nom IN('REDMAN', 'VOLVO');

Noms des bateaux pilotés par un skipper prénommé « Olivier »
SELECT bateau_nom , P03_Skipper.skipper_nom FROM P03_Bateau INNER JOIN P03_Skipper ON P03_Bateau.bateau_nom = P03_Skipper.skipper_nom WHERE  skipper_nom LIKE ~ '.*Olivier ~ '.* ;

Liste des skippers navigant sur un bateau dont le nom commence par « G »
SELECT * FROM P03_Skipper WHERE bateau_nom LIKE ~ '.*G ~ '.* ;

Nombre de bateaux par catégorie
SELECT bateau_classe AS categorie, COUNT(bateau_nom) AS NB_Bateaux FROM P03_Bateau GROUP BY bateau_classe ;

Catégories ayant plus de 10 bateaux
SELECT bateau_classe AS categorie, COUNT(bateau_nom) AS NB_Bateaux FROM P03_Bateau GROUP BY bateau_classe HAVING NB_Bateaux>=10 ;
