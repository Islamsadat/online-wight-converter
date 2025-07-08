import 'package:flutter/material.dart';

void main() {
  runApp(const WeightConverterApp());
}

class WeightConverterApp extends StatelessWidget {
  const WeightConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WeightConverterScreen(),
    );
  }
}

class WeightConverterScreen extends StatefulWidget {
  const WeightConverterScreen({super.key});

  @override
  State<WeightConverterScreen> createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
  final TextEditingController _kgController = TextEditingController();
  double _milliGram = 0.0;

  void _convert() {
    if (_kgController.text.isEmpty) return;

    final kg = double.tryParse(_kgController.text) ?? 0.0;
    setState(() {
      _milliGram = kg * 1000000; // 1 kg = 1,000,000 mg
    });
  }

  void _reset() {
    setState(() {
      _kgController.clear();
      _milliGram = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weight Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to online weight converter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Converter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kilogram',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _kgController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter kg',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _convert, child: const Text('Convert')),
            const SizedBox(height: 20),
            const Text(
              'Milli Gram',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _milliGram.toStringAsFixed(2),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kgController.dispose();
    super.dispose();
  }
}
