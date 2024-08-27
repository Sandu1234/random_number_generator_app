// ignore_for_file: library_private_types_in_public_api, use_full_hex_values_for_flutter_colors

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RandomNumberGeneratorApp());
}

class RandomNumberGeneratorApp extends StatelessWidget {
  const RandomNumberGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number Generator',
      home: RandomNumberGeneratorPage(),
    );
  }
}

class RandomNumberGeneratorPage extends StatefulWidget {
  const RandomNumberGeneratorPage({super.key});

  @override
  _RandomNumberGeneratorPageState createState() =>
      _RandomNumberGeneratorPageState();
}

class _RandomNumberGeneratorPageState extends State<RandomNumberGeneratorPage> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  String _generatedNumber = 'Enter a range and press Generate';

  void _generateRandomNumber() {
    final int? min = int.tryParse(_minController.text);
    final int? max = int.tryParse(_maxController.text);

    if (min != null && max != null && min <= max) {
      final random = Random();
      final int randomNumber = min + random.nextInt(max - min + 1);
      setState(() {
        _generatedNumber = randomNumber.toString();
      });
    } else {
      setState(() {
        _generatedNumber = 'Invalid range. Please enter a valid range.';
      });
    }
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF343a40),
      appBar: AppBar(
        title: const Text('Random Number Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _minController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Minimum value',
                  labelStyle: TextStyle(
                      color: Colors.white), // Change the label text color
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Change border color when not focused
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _maxController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Maximum value',
                  labelStyle: TextStyle(
                      color: Colors.white), // Change the label text color
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Change border color when not focused
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateRandomNumber,
                child: const Text('Generate Random Number'),
              ),
              const SizedBox(height: 20),
              Text(
                _generatedNumber,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
