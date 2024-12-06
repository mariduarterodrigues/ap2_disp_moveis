import 'dart:math';
import 'package:flutter/material.dart';

class DailyPhrasesScreen extends StatefulWidget {
  const DailyPhrasesScreen({super.key});

  @override
  _DailyPhrasesScreenState createState() => _DailyPhrasesScreenState();
}

class _DailyPhrasesScreenState extends State<DailyPhrasesScreen> {
  final List<String> _phrases = [
    "A persistência é o caminho do êxito.",
    "Acredite em você mesmo e tudo será possível.",
    "A felicidade não é algo pronto. Ela vem de suas próprias ações.",
    "Seja a mudança que você deseja ver no mundo.",
    "O sucesso é ir de fracasso em fracasso sem perder o entusiasmo.",
    "Não espere por oportunidades. Crie-as.",
    "Grandes coisas nunca vêm da zona de conforto.",
    "O único limite para o nosso amanhã são as dúvidas de hoje.",
    "Faça o que você pode, com o que você tem, onde você está.",
    "A única maneira de alcançar o impossível é acreditar que é possível.",
    "O futuro pertence àqueles que acreditam na beleza de seus sonhos.",
    "Cada dia é uma nova chance de fazer melhor.",
    "Sua única limitação é aquela que você impõe a si mesmo.",
    "A vida começa onde termina sua zona de conforto.",
    "A determinação hoje é o sucesso de amanhã.",
    "Acredite no poder dos seus sonhos.",
    "Sempre parece impossível até que seja feito.",
    "A única coisa impossível é aquilo que você não tenta.",
    "O segredo do sucesso é começar.",
    "Transforme seus obstáculos em oportunidades."
  ];

  String _currentPhrase = "Clique para gerar uma nova frase!";

  void _generateNewPhrase() {
    setState(() {
      _currentPhrase = _phrases[Random().nextInt(_phrases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do Dia'),
      ),
      body: Center( // Centraliza o conteúdo
        child: Column(
          mainAxisSize: MainAxisSize.min, // Limita o tamanho à soma dos filhos
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _currentPhrase,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateNewPhrase,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Nova Frase',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Text(
          'Desenvolvido por Marilia Duarte',
          textAlign: TextAlign.center, // Centraliza o texto no rodapé
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
