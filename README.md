# MiniMed

Minimed est une application mobile destinée aux infirmiers, aides-soignants et aide à domicile qui accompagnent plusieurs patients au quotidien.

Son objectif est de centraliser les informations essentielles de chaque patient ainsi que celles liées à son traitement médicamenteux, afin de faciliter le suivi et de limiter les risques d’oubli ou de confusion lors de l’administration des médicaments.

L’application permet notamment de consulter les médicaments prescrits, leur posologie et les différents moments de prise.

MiniMed vise ainsi à simplifier le suivi quotidien des patients en regroupant toutes les informations importantes concernant leurs traitements dans une seule application claire, pratique et accessible.

## Fonctionnalités principale

L'application permet de

* créer un compte et se connectet
* se connecter
* enregistrer de nouveau patient et les consulter
* afficher les informations principales d'un patient
* ajouter des médicaments à un patient
* indiquer la posologie et le nombre de prises par jour
* préciser les moments de prise d'un médicament si nécessaire
* modifier ou supprimer les informations enreigstrées

## Etude de l'existant

Avant de développer MiniMed, plusieurs solutions existantes ont été comparées :

| Application | Points forts | Points faibles |
|---|---|---|
| **Medisafe / MyTherapy** | Gratuites, simples, rappels de prise efficaces | Conçues pour un seul utilisateur (son propre traitement), pas de gestion multi-patients |
| **CareConnect Nurse (Corilus) / Inficyc** | Complètes, intégrées à la facturation INAMI, pensées pour les professionnels | Complexes, coûteuses, nécessitent une formation, hors de portée pour un usage familial |
| **Carnet papier / messagerie familiale** | Gratuit, aucune barrière à l'entrée | Aucune structuration, aucune synchronisation entre aidants, risque élevé d'oubli |

MiniMed se positionne entre ces deux extrêmes : une gestion multi-patients comme les logiciels professionnels, mais avec la simplicité et la gratuité des applications grand public.
## Public Cible

MiniMed s'adresse avant tout aux **aidants familiaux** : les proches qui assurent le suivi quotidien d'un patient, souvent âgé ou dépendant, et qui ont besoin d'une solution simple pour gérer les informations médicales et les traitements.

L'application reste néanmoins pertinente pour :
* les infirmiers indépendants qui suivent plusieurs patients dans leur tournée quotidienne,
* les petites structures de soins (maison de repos, cabinet) qui recherchent un outil léger, sans la complexité d'un logiciel de gestion complet.


## Parcours utilisateur

Après connexion, l'utilisateur arrive sur l'écran principal **Mes patients**.
Sur cet écran est affiché la liste de tous les patients dont l'utilisateur s'occupe.
Il peut également ajouter un nouveau patient à l'aide d'un clic de bouton.

En cliquant sur un patient, il est possible d'afficher le détail de celui-ci, notamment : 
* son nom et prénom
* sa date de naissance
* son adresse mail de contact
* son numéro de téléphone
* son sexe

Le traitement est également consultable.
On retrouvera ici : 

* la liste des médicaments à prendre
* la dose prescrite
* le nombre de prise quotidienne
* les moments de prise
* une éventuelle information en plus lié au traitement, à choisir par l'utilisateur


## Technologie utilisée

* Flutter
* Dart
* Firebase Authentification
* Cloud Firestore
* Firestore ODM
* Freezed
* JSON Serializable

Les odnnées sont manipulées à l'aide de DTO typées afin d'éviter les accès directs à des données non typées.

## Structure générale

///// à faire après lorsque le projet sera terminé, veiller à bien répartir les fichierds!!!!




## Lancer le projet

Pour lancer le projet, il faudra veiller à installer toutes les dépendances nécessaires à l'aide de la commande : 

`flutter pub get`

à lancer dans le terminal du projet.

Puis lancer l'application : 

`flutter run` 

Pour régénrer les DTO / fichiers ODM : 

`cd dto dart
run build_runner build --delete-conflicting-outputs`

