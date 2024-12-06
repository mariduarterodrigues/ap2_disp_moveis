import 'dart:math';
import 'package:flutter/material.dart';

class HeadsOrTailsScreen extends StatefulWidget {
  const HeadsOrTailsScreen({super.key});

  @override
  _HeadsOrTailsScreenState createState() => _HeadsOrTailsScreenState();
}

class _HeadsOrTailsScreenState extends State<HeadsOrTailsScreen> {
  String _userChoice = '';
  String _computerChoice = '';
  String _result = '';
  bool _isFlipping = false;

  void _flipCoin(String userChoice) {
    setState(() {
      _isFlipping = true;
      _userChoice = userChoice;
    });

    Future.delayed(const Duration(seconds: 2), () {
      String computerChoice = Random().nextBool() ? 'Cara' : 'Coroa';
      setState(() {
        _computerChoice = computerChoice;
        _result = _userChoice == _computerChoice ? 'Você ganhou!' : 'Você perdeu!';
        _isFlipping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cara ou Coroa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isFlipping) ...[
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text('Lançando a moeda...', style: TextStyle(fontSize: 18)),
            ] else ...[
              Text('Sua escolha: $_userChoice', style: const TextStyle(fontSize: 18)),
              Text('Resultado: $_computerChoice', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Text(_result, style: const TextStyle(fontSize: 18)),
            ],
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _flipCoin('Cara'),
                  child: const Text('Cara'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _flipCoin('Coroa'),
                  child: const Text('Coroa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
