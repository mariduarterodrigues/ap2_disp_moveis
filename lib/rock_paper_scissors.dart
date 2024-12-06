import 'dart:math';
import 'package:flutter/material.dart';

class RockPaperScissorsScreen extends StatefulWidget {
  const RockPaperScissorsScreen({super.key});

  @override
  _RockPaperScissorsScreenState createState() => _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  final List<String> _options = ['Pedra', 'Papel', 'Tesoura'];
  String _userChoice = '';
  String _computerChoice = '';
  String _result = '';

  void _play(String userChoice) {
    String computerChoice = _options[Random().nextInt(_options.length)];
    setState(() {
      _userChoice = userChoice;
      _computerChoice = computerChoice;

      if (userChoice == computerChoice) {
        _result = 'Empate! Ambos escolheram $userChoice.';
      } else if ((userChoice == 'Pedra' && computerChoice == 'Tesoura') ||
          (userChoice == 'Papel' && computerChoice == 'Pedra') ||
          (userChoice == 'Tesoura' && computerChoice == 'Papel')) {
        _result = 'Você ganhou! $userChoice vence $computerChoice.';
      } else {
        _result = 'Você perdeu! $computerChoice vence $userChoice.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jokenpô')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sua escolha: $_userChoice', style: const TextStyle(fontSize: 18)),
          Text('Escolha do computador: $_computerChoice', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          Text(_result, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _options
                .map(
                  (option) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  onPressed: () => _play(option),
                  child: Text(option),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
