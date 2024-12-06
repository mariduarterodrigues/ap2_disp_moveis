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

        if (_displayedWord == _wordToGuess) {
          _showGameOverDialog('Você venceu!');
          _startNewGame();
        } else if (_attemptsLeft == 0) {
          _showGameOverDialog('Você perdeu! A palavra era $_wordToGuess.');
          _startNewGame();
        }
      });
      _letterController.clear();
    }
  }

  void _showGameOverDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startNewGame();
              },
              child: const Text('Jogar Novamente'),
            ),
          ],
        );
      },
    );
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Palavra: $_displayedWord', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Tentativas restantes: $_attemptsLeft', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _letterController,
                maxLength: 1,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  labelText: 'Digite uma letra',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _guessLetter,
              child: const Text('Confirmar Letra'),
            ),
          ],
        ),
      ),
    );
  }
}