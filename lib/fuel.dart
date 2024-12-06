import 'package:flutter/material.dart';

class FuelScreen extends StatefulWidget {
  const FuelScreen({super.key});

  @override
  _FuelScreenState createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  final TextEditingController _alcoholPriceController = TextEditingController();
  final TextEditingController _gasolinePriceController = TextEditingController();
  String _result = '';

  void _calculateFuelChoice() {
    double alcoholPrice = double.tryParse(_alcoholPriceController.text) ?? 0;
    double gasolinePrice = double.tryParse(_gasolinePriceController.text) ?? 0;

    if (gasolinePrice == 0) {
      setState(() {
        _result = 'O preço da gasolina não pode ser zero.';
      });
      return;
    }

    double ratio = alcoholPrice / gasolinePrice;
    setState(() {
      _result = ratio < 0.7
          ? 'É melhor abastecer com Álcool.'
          : 'É melhor abastecer com Gasolina.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha de Combustível'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _alcoholPriceController,
                  decoration: const InputDecoration(labelText: 'Preço do Álcool'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _gasolinePriceController,
                  decoration: const InputDecoration(labelText: 'Preço da Gasolina'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateFuelChoice,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Desenvolvido por Marilia Duarte',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
