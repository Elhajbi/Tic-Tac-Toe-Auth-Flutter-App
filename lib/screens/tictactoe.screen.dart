import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeScreen extends StatelessWidget {
  final String login;
  const TicTacToeScreen({required this.login});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blue.shade700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Tic Tac Toe - $login', style: GoogleFonts.poppins()),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('login');
              await prefs.remove('password');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(child: TicTacToeGame()),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> _board = List.filled(9, '');
  bool _xTurn = true;

  void _handleTap(int index) {
    if (_board[index] == '') {
      setState(() {
        _board[index] = _xTurn ? 'X' : 'O';
        _xTurn = !_xTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    final lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var line in lines) {
      final a = line[0];
      final b = line[1];
      final c = line[2];
      if (_board[a] != '' && _board[a] == _board[b] && _board[a] == _board[c]) {
        _showDialog('Le joueur "${_board[a]}" a gagné !');
        return;
      }
    }

    if (!_board.contains('')) {
      _showDialog("Égalité !");
    }
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, '');
      _xTurn = true;
    });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text('Résultat', style: GoogleFonts.poppins()),
        content: Text(message, style: GoogleFonts.poppins(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
            },
            child: Text('Rejouer', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blue.shade700;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          shrinkWrap: true,
          itemCount: 9,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => _handleTap(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _board[index] == ''
                      ? Colors.grey[300]
                      : (_board[index] == 'X'
                      ? Colors.blue.shade200
                      : Colors.red.shade200),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _board[index],
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _board[index] == 'X' ? Colors.blue[900] : Colors.red[900],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: _resetGame,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            'Réinitialiser',
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
