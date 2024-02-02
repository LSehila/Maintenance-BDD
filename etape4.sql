//Installer les tables fournies sous mysql et postgresql Fait
//Fournir les commandes permettant de connaître la structure des tables créées ainsi que le résultat de ces commandes:
DESCRIBE P14_Pays;
+----------+---------------------+------+-----+---------+----------------+
| Field    | Type                | Null | Key | Default | Extra          |
+----------+---------------------+------+-----+---------+----------------+
| pays_id  | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| pays_nom | varchar(30)         | NO   |     | NULL    |                |
+----------+---------------------+------+-----+---------+----------------+

DESCRIBE P14_Piece;
+---------------+---------------------+------+-----+---------+----------------+
| Field         | Type                | Null | Key | Default | Extra          |
+---------------+---------------------+------+-----+---------+----------------+
| piece_id      | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| piece_valeur  | float               | NO   |     | NULL    |                |
| piece_taille  | float               | NO   |     | NULL    |                |
| piece_tranche | varchar(80)         | NO   |     | NULL    |                |
| piece_poids   | float               | YES  |     | NULL    |                |
+---------------+---------------------+------+-----+---------+----------------+

DESCRIBE P14_Utilise;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| pays_id  | int(11) | NO   | PRI | NULL    |       |
| piece_id | int(11) | NO   | PRI | NULL    |       |
| quantite | int(11) | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+

Afficher le contenu de toutes les tables:
SELECT * FROM P14_Pays, P14_Piece, P14_utilise;

Faire une jointure entre toutes les tables disponibles:
SELECT * FROM P14_Pays P INNER JOIN P14_Utilise U ON P.pays_id=U.pays_id;
+---------+-----------+---------+----------+----------+
| pays_id | pays_nom  | pays_id | piece_id | quantite |
+---------+-----------+---------+----------+----------+
|       1 | Allemagne |       1 |        1 |        3 |
|       1 | Allemagne |       1 |        5 |        3 |
|       1 | Allemagne |       1 |        6 |        3 |
|       1 | Allemagne |       1 |        7 |        3 |
|       1 | Allemagne |       1 |        8 |        3 |
|       1 | Allemagne |       1 |        9 |        3 |
|       2 | Autriche  |       2 |        2 |        1 |
|       3 | Belgique  |       3 |        3 |        0 |
|       4 | Chypre    |       4 |        4 |        2 |
|       5 | Espagne   |       5 |        5 |        5 |
|       6 | Estonie   |       6 |        6 |        2 |
|       7 | Finlande  |       7 |        7 |        3 |
|       8 | France    |       8 |        8 |        1 |
|       9 | Grece     |       9 |        9 |       32 |
|      10 | Irlande   |      10 |       10 |        3 |
+---------+-----------+---------+----------+----------+

Faire une requête qui met en oeuvre une fonction d'agrégation:
SELECT piece_valeur, MAX(piece_poids) FROM P14_Piece;
+--------------+---------+
| nombre_piece | pays_id |
+--------------+---------+
|            6 |       1 |
+--------------+---------+

Faire une requête avec une sous-requête:
SELECT * FROM P14_Utilise WHERE pays_id = (SELECT pays_id FROM P14_Pays WHERE pays_nom='Grèce');

Faire une requête qui met en oeuvre la clause Having
SELECT COUNT(quantite)AS nombre_piece, pays_id FROM P14_Utilise GROUP BY pays_id HAVING COUNT(quantite)> 5;

Faire une requête avec une jointure et une fonction d'agrégation
SELECT quantite,COUNT(pays_nom) FROM P14_Utilise U INNER JOIN P14_Pays P ON P.pays_id=U.pays_id WHERE quantite BETWEEN 0 AND 5;
