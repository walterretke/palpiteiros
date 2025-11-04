// Arquivo: lib/main.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/telas/login_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palpiteiros',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), 
    );
  }
}