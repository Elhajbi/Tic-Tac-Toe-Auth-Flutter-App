# Tic Tac Toe Auth Flutter App

Une application Flutter simple combinant un système d’authentification basique (login/sign-up) avec une sauvegarde locale des identifiants grâce à Shared Preferences, et un jeu Tic Tac Toe.

---

## Fonctionnalités

- **Inscription** : Crée un compte utilisateur (login + mot de passe) stocké localement.
- **Connexion** : Authentifie l’utilisateur en comparant avec les données sauvegardées.
- **Jeu Tic Tac Toe** : Jouez contre un autre joueur localement avec une interface simple et moderne.
- **Déconnexion** : Permet de se déconnecter et de revenir à l’écran de connexion.
- Gestion des erreurs et messages utilisateurs via `SnackBar`.

---

## Technologies utilisées

- Flutter
- Dart
- [Shared Preferences](https://pub.dev/packages/shared_preferences) pour la persistance locale
- [Google Fonts](https://pub.dev/packages/google_fonts) pour la typographie personnalisée

---

## Installation & lancement

1. **Cloner le dépôt**

```bash
git clone <URL_DU_DEPOT>
cd <nom_du_projet>
```
2. **Installer les dépendances**
```bash
   flutter pub get
```
3. **Lancer l’application**
```bash
flutter run
```
## Structure du projet
```
lib/
├── main.dart             # Point d'entrée de l'application
├── screens/
│    ├── login.screen.dart
│    ├── signup.screen.dart
│    └── tictactoe.screen.dart
```
## Personnalisation

- 🎨 Modifier les couleurs dans les fichiers d’écran pour changer la charte graphique.
- 🗄️ Ajouter une vraie base de données ou API pour gérer les utilisateurs.
- 🧠 Améliorer l’IA du jeu Tic Tac Toe pour jouer contre l’ordinateur.

---

## Auteur

**Abdelkarim El Hajbi** – Full Stack Flutter Developer  
🔗 [LinkedIn](https://www.linkedin.com/in/abdelkarim-el-hajbi-65b783160/)  
💻 [GitHub](https://github.com/Elhajbi)

