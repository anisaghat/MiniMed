# MiniMed

Minimed est une application mobile destinée aux infirmiers, aides-soignants et aide à domicile qui accompagnent plusieurs patients au quotidien.

Son objectif est de centraliser les informations essentielles de chaque patient ainsi que celles liées à son traitement médicamenteux, afin de faciliter le suivi et de limiter les risques d’oubli ou de confusion lors de l’administration des médicaments.

L’application permet notamment de consulter les médicaments prescrits, leur posologie et les différents moments de prise.

MiniMed vise ainsi à simplifier le suivi quotidien des patients en regroupant toutes les informations importantes concernant leurs traitements dans une seule application claire, pratique et accessible.

## Fonctionnalités principales

L'application permet de

* créer un compte et se connectet
* se connecter
* enregistrer de nouveau patient et les consulter
* afficher les informations principales d'un patient
* ajouter des médicaments à un patient
* indiquer la posologie et le nombre de prises par jour
* préciser les moments de prise d'un médicament si nécessaire
* modifier ou supprimer les informations enregistrées

## Étude de l'existant

Avant de développer MiniMed, plusieurs solutions existantes ont été comparées :

| Application | Points forts | Points faibles |
|---|---|---|
| **Medisafe / MyTherapy** | Gratuites, simples, rappels de prise efficaces | Conçues pour un seul utilisateur (son propre traitement), pas de gestion multi-patients |
| **CareConnect Nurse (Corilus) / Inficyc** | Complètes, intégrées à la facturation INAMI, pensées pour les professionnels | Complexes, coûteuses, nécessitent une formation, hors de portée pour un usage familial |
| **Carnet papier / messagerie familiale** | Gratuit, aucune barrière à l'entrée | Aucune structuration, aucune synchronisation entre aidants, risque élevé d'oubli |

MiniMed se positionne entre ces deux extrêmes : une gestion multi-patients comme les logiciels professionnels, mais avec la simplicité et la gratuité des applications grand public.
## Public cible

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

Les données sont manipulées à l'aide de DTO typées afin d'éviter les accès directs à des données non typées.


## Structure générale

### Racine du projet

À la racine du dépôt, on retrouve :

- `/lib` : cœur de l'application Flutter (l'app `minimed`)
- `/dto` : package séparé contenant les modèles de données (DTO) partagés, générés via Freezed et firestore_odm
- `/android`, `/ios` : configurations spécifiques aux plateformes
- `pubspec.yaml` : dépendances et configuration Flutter

### Organisation du dossier `lib`

Le dossier lib est organisé de la manière suivante :

```
lib/
│── constants/         → tailles, polices, couleurs, styles
│── router/             → configuration des routes de l'application
│── screens/            → écrans de l'application
│   ├── auth_screen/
│   ├── login/
│   ├── registration/
│   ├── welcome_screen/
│   ├── main_screen/    → écran principal, profil, paramètres
│   ├── patients/         → liste, détail, création de patient
│   ├── medication/       → ajout de médicament
│── widget/               → composants UI réutilisables
```

### Organisation du package `dto`

Le package dto contient les modèles de données partagés entre l'application et la base de données Firestore. Il est organisé comme suit :

dto/lib/
│── models/ → Patient, Medication, User (objets typés, générés via Freezed)
│── schema.dart → déclaration du schéma Firestore (firestore_odm)


Cette séparation entre `minimed` et `dto` permet de garder la logique de données indépendante de l'interface et de garantir un accès typé à Firestore plutot que des données brutes non structurées.

## Fonctionnalités à venir

- 🎮 **Dimension ludique** : badges ou indicateurs de suivi régulier pour encourager un usage sur la durée
- 📡 **Gestion fine du mode hors-ligne** : messages dédiés en cas de perte de connexion (au-delà des états de chargement/erreur déjà gérés par les `StreamBuilder`)
- ✏️ **Modification et suppression des médicaments** : actuellement, seuls l'ajout et la consultation sont disponibles pour les médicaments (le CRUD complet a été priorisé sur la ressource Patient)
- 🌍 **Support multilingue complet** (FR/EN)


## Documentation développeur

### Installation

1. Cloner ce dépôt
2. Installer les dépendances dans le dossier `minimed` :

`flutter pub get`

3. Configurer Firebase :
    - Créer un projet sur la [console Firebase](https://console.firebase.google.com/)
    - Activer **Authentication** → méthode **E-mail / Mot de passe**
    - Activer **Firestore Database** (mode production)
    - Exécuter `flutterfire configure` à la racine du projet pour générer `lib/firebase_options.dart`
4. Générer les DTO / fichiers ODM (dans le dossier `dto`) :

```
cd dto
dart run build_runner build --delete-conflicting-outputs
```
5. Lancer l'application :
 `flutter run`

## Problèmes connus

- La gestion du mode hors-ligne se limite pour l'instant aux états de chargement/erreur natifs des `StreamBuilder` ; aucun message dédié n'est encore affiché en cas de perte de connexion internet.
- Les médicaments ne peuvent pas encore être modifiés ou supprimés après ajout (seuls la création et la consultation sont disponibles).

