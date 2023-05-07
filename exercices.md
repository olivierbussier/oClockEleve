
# Commandes SQL

Un moteur de bases de données PostegreSQL contient des databases. Chaque database peut contenir plusieurs tables

Les commandes SQL pour gérer les databases et les tables.

- Les databases se créent au moyen de la commande `create database` [lien vers la doc](https://docs.postgresql.fr/9.6/sql-createdatabase.html)
- Les tables sont créées au moyen de la commande `create table` [lien vers la doc](https://docs.postgresql.fr/9.6/sql-createtable.html)

De la même manière, les databases et tables pourront être supprimées (irréversible) au moyen des commandes :

- `drop database` [lien vers la doc](https://docs.postgresql.fr/9.6/sql-dropdatabase.html)
- `drop table`    [lien vers la doc](https://docs.postgresql.fr/9.6/sql-droptable.html)

En SQL, la manipulation des données dans les tables s'effectue au moyen de 4 commandes:
- `select` qui permet de séléctionner et récuperer des lignes de données. [lien vers la doc](https://docs.postgresql.fr/9.6/sql-select.html)
- `insert` qui permet d'insérer des lignes. [lien vers la doc](https://docs.postgresql.fr/9.6/sql-insert.html)
- `update` qui permet de modifier des lignes existantes. [lien vers la doc](https://docs.postgresql.fr/9.6/sql-update.html)
- `delete` qui permet de supprimer des lignes. [lien vers la doc](https://docs.postgresql.fr/9.6/sql-delete.html)

Il existe également beaucoup d'autres commandes pour gérer les utilisateurs, les droits d'accès aux databases et tables, toutes ces commandes sont décrites dans la documentation officielle que l'on trouvera [ici](https://docs.postgresql.fr/9.6/sql-commands.html)

## Travaux pratiques

On considère ici que postgresql est installé, en fonctionnement et que le compte par défault `postgres` est utilisable (voir le fichier [installation](installation.md)).

Avant de commencer les travaux pratiques il faut faire quelques bricoles qui seront utiles pour plus tard, on y reviendra
- Ouvrir une session shell avec votre login.
- Copier le fichier `poids_sac.csv` dans le répèrtoire `/tmp`
- se connecter àu compte postgresql en utilisant la commande `sudo` (la commande `sudo` doit normalement vous demander votre mot de passe).

```shell
$ cp poids_sac.csv /tmp

$ sudo -i -u postgres
```
et ensuite on lance l'interpreteur SQL interactif `psql`

```shell
$ psql

postgres=#
```
A ce stade, si on execute la commande `\du` (display users), il ne devrait y avoir qu'un seul utilisateur

```sql
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

```
On va maintenant créer un utlisateur qui a le même nom que notre login. Moi mon login c'est `olivier`, je vais donc créer un user postgres `olivier`

```sql
postgres=# create user olivier;
CREATE ROLE
```
le système répond `CREATE ROLE`, ce qui indique que le rôle a été créé avec succès.

On va maintenant créer une database qui porte également notre nom de login

```sql
postgres=# create database olivier;
CREATE DATABASE
```
Le systeme répond `CREATE DATABASE`, ce qui indique là encore que la database à été créée avec succès.

On a donc créé une base olivier et un role olivier. Mais cela ne suffira pas pour se connecter à la base `olivier` en tant qu'utilisateur `olivier`. En effet, à ce stade cet utilisateur ne dispose d'aucun droit sur cette base (n'oublions pas que nous sommes connectés à la base en tant qu'utilisateur `postgres` qui est admin). Nous allons maintenant attribuer des droits a l'utilisateur `olivier`:

```sql
postgres=# grant all on database olivier to olivier;
GRANT
```

Yes! Maintenant, il doit être possible de se connecter en tant qu'utilisateur `olivier` au système; allons voir cela de plus près:

Je quitte psql (`exit`)
Je me déconnecte du compte `postgres` avec la commande `exit`.

Je peux utiliser la commande `whoami` (who I'm I) pour vérifier que je suis bien sur mon compte.

```
postgres=# exit

postgres@Olivs-Ubuntu:~$ exit

olivier@Olivs-Ubuntu:~/oClock$ whoami
olivier

olivier@Olivs-Ubuntu:~/oClock$
```
Parfait, je tente maintenant de me connecter à la base avec psql

```
olivier@Olivs-Ubuntu:~/oClock$ psql
sql (14.7 (Ubuntu 14.7-0ubuntu0.22.04.1))
Type "help" for help.

olivier=>
```
Ca à l'air bien , non ?, mais est-ce que je suis bien sur la base `olivier` ? On peut le vérifier avec la commande `\c` sans paramètre qui indique la base sur laquelle on est connecté.

```
olivier=> \c
You are now connected to database "olivier" as user "olivier".
```
Yes again! je suis connecté a la base `olivier` avec mon role `olivier`. Mais pour autant, puis-je créer une table ? Eh bien essayons !

```sql
create table if not exists sac (
    id          serial primary key,
    categorie   varchar(255) not null,
    materiel    varchar(255) not null,
    type        varchar(255),
    dans_sac    varchar(32) not null,
    poids_en_g  int ,
    present     varchar(32),
    commentaire varchar(255),
    pese        varchar(32),
    emplacement varchar(128)
);
CREATE TABLE
```
CREATE TABLE ?, c'est tout bon, on peut le vérifier avec la commande `\dt`
```sql
olivier=> \dt
        List of relations
 Schema | Name | Type  |  Owner
--------+------+-------+---------
 public | sac  | table | olivier
(1 row)
```
Nickel, la table `sac` existe bien! () noter qu'un synonyme de `table` dans le jargon SQL est `relation`.

Pour importer facilement une bonne quantité de données, J'ai réalisé un export d'une google sheet sous forme CSV dans le fichier `poids_sac.csv`. On va importer ce fichier dans la table nouvellement crée. Pour cela on va utiliser une commande SQL un peu spéciale, la commande `copy`.

Mais malheureusement cette commande n'est utilisable que par les utilisateurs disposant d'une autorisation spéciale; si nous essayons quand même, nous aurons une erreur:

```sql
olivier=> COPY sac (
    categorie,materiel,type,dans_sac,
    poids_en_g,present,commentaire,pese,emplacement
)
FROM './poids_sac.csv'
DELIMITER ','
CSV HEADER;

ERROR:  must be superuser or a member of the pg_read_server_files role to COPY from a file
HINT:  Anyone can COPY to stdout or from stdin. psql's \copy command also works for anyone.
```
On pourrait s'attribuer l'autorisation en question, mais pour des raisons de sécurité, il vaut mieux éviter de s'attribuer plus de droits que ceux dont on à vraiment besoin le plus souvent.

Les commandes un peu spéciales pourront toujours être éxécutées avec le compte postgres

Il faut executer psql avec le compte `postgres` pour effectuer la commande `copy`. En effet, le rôle 'postgress' est `superutilisateur` et dispose de tous les droits sur les bases.

Attention à bien préciser à psql que l'on veut accéder à la base `olivier` sinon, par défaut psql utilisera la base nommée à l'identique du compte (qui est par défaut `postgres`)

```bash
olivier=> exit

olivier@Olivs-Ubuntu:~/oClock$ sudo -i -u postgres

postgres@Olivs-Ubuntu:~$ psql olivier
psql (14.7 (Ubuntu 14.7-0ubuntu0.22.04.1))
Type "help" for help.

olivier=#
```
Executons a nouveau la commande copy
```sql
 COPY sac (
    categorie,materiel,type,dans_sac,
    poids_en_g,present,commentaire,pese,emplacement
)
FROM './poids_sac.csv'
DELIMITER ','
CSV HEADER;
```
Mince, on obtient encore une erreur

```
ERROR:  could not open file "./poids_sac.csv" for reading: No such file or directory
HINT:  COPY FROM instructs the PostgreSQL server process to read a file. You may want a client-side facility such as psql's \copy.
```

La cause de cette erreur est simple. Ici c'est le compte `postgres` qui essaie de lire le fichier `poids_sac.csv`; or ce fichier est placé dans notre home directory `olivier`. Et quand bien même le moteur dispose de tous les droits sur ses bases, il n'a pas celui d'aller lire les données d'autres utilisateurs, heureusement !

 Voila pourquoi tout à l'heure nous avons placé le fichier `poids_sac.csv` dans le répertoire `/tmp` qui est accessible par tout le monde. Retentons la copie avec le bon fichier.

```sql
COPY sac (
    categorie,materiel,type,dans_sac,
    poids_en_g,present,commentaire,pese,emplacement
)
FROM '/tmp/poids_sac.csv'
DELIMITER ','
CSV HEADER;
COPY 86
```
L'indication `COPY 86` indique que la commande à bien fonctionné, et a créé 86 nouvelles ligners dans la table `sac`.

Revenons dans psql avec le compte `olivier` pour continuer

```shell
olivier=# exit

postgres:~$ exit

olivier:~$ psql
psql (14.7 (Ubuntu 14.7-0ubuntu0.22.04.1))
Type "help" for help.

olivier=> \c
You are now connected to database "olivier" as user "olivier".
olivier=> \dt
       List of relations
 Schema | Name | Type  |  Owner
--------+------+-------+---------
 public | sac  | table | olivier
(1 row)
```
Tout va bien.

Pour vérifier si la table `sac` contient bien des choses, on va réaliser notre première selection de données sur une table:

```postgres
select * from sac; /* affichage de toutes les lignes de la table */
```
Cette commande nous retourne toutes les lignes de la table `sac`.
Résultat :
```sql
id |     categorie     |             materiel             |             type             | dans_sac | poids_en_g |   present   |         commentaire          | pese |     emplacement
----+-------------------+----------------------------------+------------------------------+----------+------------+-------------+------------------------------+------+----------------------
  1 | 0 - Vêtements     | Chaussures rando                 |                              | Non      |        690 | Oui         |                              |      | Hors sac
  2 | 0 - Vêtements     | Polaire                          |                              | Oui      |        318 | Oui         | Au lieu de 380               | Oui  | 2
  3 | 0 - Vêtements     | Sandales                         |                              | Oui      |        300 | Non         | A acheter plus tard          |      | Grande poche
  4 | 0 - Vêtements     | Pantalon                         |                              | Oui      |        213 | Oui         |                              | Oui  | 2
  5 | 0 - Vêtements     | Merinos manches longues          | Odlo vert                    | Oui      |        212 | Oui         |                              | Oui  | 2
...
```
Et bien d'autres encore (il est possible de naviguer dans les données retournées avec les fleches haut et bas, pour sortir, appuyer sur `Q`)

Attention `*` se réfère aux colonnes et non aux lignes, pour le montrer on peut réduire le nombre de colonnes retournées en listant en remplacant `*` par ceux souhaités. Mais comment connaitre le nom des champs de la table `sac` ? avec la commande `\d sac`!

```sql
olivier=> \d sac
   Column    |          Type          | Collation | Nullable |             Default
-------------+------------------------+-----------+----------+---------------------------------
 id          | integer                |           | not null | nextval('sac_id_seq'::regclass)
 categorie   | character varying(255) |           | not null |
 materiel    | character varying(255) |           | not null |
 type        | character varying(255) |           |          |
 dans_sac    | character varying(32)  |           | not null |
 poids_en_g  | integer                |           |          |
 present     | character varying(32)  |           |          |
 commentaire | character varying(255) |           |          |
 pese        | character varying(32)  |           |          |
 emplacement | character varying(128) |           |          |
Indexes:
    "sac_pkey" PRIMARY KEY, btree (id)
```
Faisons une selection un peu plus 'short' en ne gardant que 3 colonnes

```sql
olivier=> select categorie, materiel, poids_en_g from sac;

     categorie     |             materiel             | poids_en_g
-------------------+----------------------------------+------------
 0 - Vêtements     | Chaussures rando                 |        690
 0 - Vêtements     | Polaire                          |        318
 0 - Vêtements     | Sandales                         |        300
 0 - Vêtements     | Pantalon                         |        213
 0 - Vêtements     | Merinos manches longues          |        212
 0 - Vêtements     | coupe-vent                       |        194
 0 - Vêtements     | Bermuda                          |        233
 ...
```
Il n'y a plus que les colonnes demandées, par contre il y a toujours 86 lignes.

Je peux faire des milliers de choses avec SQL, comme par exemple, lister quelles sont les différentes catégories de matériel de mon sac. Pour cela je tente:

```sql
select distinct(categorie) from sac;
```

Je vois que c'est un peu le foutoir dans cette liste, est-ce que par hasard, je pourrai pas mieux 'ranger' l'affichage des catégories ?

```sql
select distinct(categorie) from sac order by categorie;
```

La je viens de rajouter une clause "order by" qui permet de classer les lignes suivant un ordre précis, ici le champ catégorie. Si je veux trier par ordre descendant (l'ordre est ascendant par défaut), je rajoute `desc` apres order by.

```sql
select distinct categorie from sac order by categorie desc;
```

Du coup, je peux réaliser des opération plus complexes sur cette table, comme par exemple lister les champs matériel, emplacement et poids_en_g, trier par poids décroissant, cela donne:

```sql
select materiel, emplacement, poids_en_g from sac order by poids_en_g desc;
```

Et si maintenant je veux affichier le top 10 des matériels les plus lourds ?

```sql
select materiel, emplacement, poids_en_g from sac order by poids_en_g desc limit 10;
```
Je viens d'ajouter une nouveauté, la clause `limit <nombre [, départ]>` qui vient après order, du coup, postgres ne me renvoie que les 10 premières lignes.

SQL est également capable de faire des calculs; par exemple, et en dehors de toute table, je peux faire des opérations telles-que :

```sql
select ((3 + 7) * 12) / 22; /* sous forme de résultat entier */
select ((3 + 7) * 12) / 22.0; /* sous forme de résultat en nombres flottants */
select now(); /* renvoie la date et heure actuelle */
select pi(); /*  la liste est longue */
```
Je peux faire des calculs sur les données avant de les afficher, par exemple je vais demander a postgres de multiplier par pi (3.1415) tous les poids ... ca marche, mais bon ...

```sql
select categorie, poids_en_g * pi() from sac limit 10;
```
Plus utile, je peux demander a postgres de faire la somme des poids de toutes les lignes; la du coup, j'aurai le poids total de mon sac.

```sql
select sum(poids_en_g) from sac;
```
Après on peut vraiment aller très loin dans la structuration d'une requete pour affiner les résultats, par exemple, si je veux connaitre le poinds des différentes poches et emplacements de mon sac, j'aurai recours à la requete suivante:

```sql
select
    emplacement, sum(poids_en_g)
from sac
order by emplacement
group by emplacement;
```
Et si je veux savoir les poids sans l'eau et la nourriture du contenu du sac:

```sql
select
    emplacement, sum(poids_en_g)
from sac
    where categorie not like '%8 -%' and dans_sac = 'Oui'
group by emplacement
order by sum desc;

```
Bon, pour la selection de données, vous commencez à voir la puissance de ce langage

## Insert
Pour inserer des nouvelles lignes dans la table, c'est très simple, la syntaxe de l commande est :
```sql
insert into <table> (champ1, champ2, ...) values (value1, value2, ...), (...)
```
Voir la documentation complète à ce sujet : [ici](https://www.postgresql.org/docs/current/sql-insert.html)

## Update
Il est également possible de modifier des lignes existantes de la table, pour ce faire, utiliser la commande :
```sql
update <table> set champ1=value1, champ2=value2, ... where <where clause>
```

Par exemple poir modifier le poids de la tente, il faudra executer la requete en ciblant la ligne 'Tente':
```sql
update sac set poids_en_g=1234 where materiel='Tente'
```
Mais cela peut etre imprécis (si on emporte deux tentes par exemple), il est préférable de faire la selection avec l'id (qui est créé pour cela). En l'occurence, celui de la tente est 59, donc, on peut effectuer :
```sql
update sac set poids_en_g=1234 where id=59
```
La on est sur de notre coup.

Attention, là encore, ne **JAMAIS** faire d'update sans cibler une ou plusieurs lignes avec une clause where. La ligne `update sac set poids=1234';` aura pour effet de remplacer tous les poids de toutes les lignes par 1234, oups!


## Delete
On peut supprimer des lignes avec la commande `delete from <table>`, à manipuler avec précaution, et **JAMAIS** sans clause `where`. Pourquoi ?

Parce que si j'execute la commande `delete from sac`, cela aura pour effet de supprimer **toutes les lignes** de la table `sac`
