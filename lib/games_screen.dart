import 'package:flutter/material.dart';
import 'rock_paper_scissors.dart';
import 'heads_or_tails.dart';
import 'hangman_game.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Jogos'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RockPaperScissorsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Jokenpô', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeadsOrTailsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Cara ou Coroa', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HangmanGameScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Jogo da Forca', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Text(
          'Desenvolvido por Marilia Duarte',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
