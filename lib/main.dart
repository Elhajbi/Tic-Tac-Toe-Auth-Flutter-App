import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.screen.dart';
import 'screens/tictactoe.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Cette fonction vérifie si un utilisateur est déjà connecté
  Future<Widget> _getInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLogin = prefs.getString('login');
    final savedPassword = prefs.getString('password');

    if (savedLogin != null && savedPassword != null) {
      return TicTacToeScreen(login: savedLogin);
    } else {
      return LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optionnel : personnalisation de la font globale
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Widget>(
        future: _getInitialScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!;
          } else {
            // Affiche un loader pendant la récupération des préférences
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
