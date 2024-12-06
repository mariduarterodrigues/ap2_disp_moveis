import 'dart:math';
import 'package:flutter/material.dart';

class HangmanGameScreen extends StatefulWidget {
  const HangmanGameScreen({super.key});

  @override
  _HangmanGameScreenState createState() => _HangmanGameScreenState();
}

class _HangmanGameScreenState extends State<HangmanGameScreen> {
  final List<String> _words = [
    'Futuro', 'Desenvolvimento', 'Tecnologia', 'Flutter', 'Programacao', 'Software',
    'Computacao', 'Desafio', 'Inovacao', 'Ciencia', 'Aplicativo', 'Algoritmo',
    'Framework', 'Inteligencia', 'Robotica', 'Aprendizagem', 'Internet', 'Redes',
    'Banco', 'Servidor'
  ];

  String _wordToGuess = '';
  String _displayedWord = '';
  int _attemptsLeft = 6;
  TextEditingController _letterController = TextEditingController();

  void _startNewGame() {
    _wordToGuess = _words[Random().nextInt(_words.length)].toUpperCase();
    _displayedWord = '_' * _wordToGuess.length;
    _attemptsLeft = 6;
    _letterController.clear();
  }

  void _guessLetter() {
    String letter = _letterController.text.toUpperCase();
    if (letter.length == 1 && 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.contains(letter)) {
      setState(() {
        if (_wordToGuess.contains(letter)) {
          List<String> displayedWordList = _displayedWord.split('');
          for (int i = 0; i < _wordToGuess.length; i++) {
            if (_wordToGuess[i] == letter) {
              displayedWordList[i] = letter;
            }
          }
          _displayedWord = displayedWordList.join('');
        } else {
          _attemptsLeft--;
        }
      });
    }
    _letterController.clear();
  }

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jogo da Forca')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Palavra: $_displayedWord', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Tentativas restantes: $_attemptsLeft', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Margem nas laterais
              child: TextField(
                controller: _letterController,
                maxLength: 1,
                decoration: const InputDecoration(
                  labelText: 'Digite uma letra',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0), // Margem interna
                ),
                onSubmitted: (_) => _guessLetter(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startNewGame,
              child: const Text('Recomeçar'),
            ),
          ],
        ),
      ),
    );
  }
}
