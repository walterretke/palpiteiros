// Arquivo: lib/cores.dart
// Paleta de cores neutras para o app
import 'package:flutter/material.dart';

class AppCores {
  // Cores neutras principais
  static const Color fundoEscuro = Color(0xFF2C2C2C);
  static const Color fundoCard = Color(0xFF3A3A3A);
  static const Color fundoCardClaro = Color(0xFF4A4A4A);
  
  // Cores de texto
  static const Color textoPrincipal = Color(0xFFF5F5F5);
  static const Color textoSecundario = Color(0xFFB0B0B0);
  static const Color textoBranco = Colors.white;
  
  // Cores de destaque (usar apenas para detalhes importantes)
  static const Color destaque = Color(0xFF4A90E2); // Azul suave
  static const Color destaqueHover = Color(0xFF5BA0F2);
  
  // Cores de status (usar apenas para feedback)
  static const Color sucesso = Color(0xFF5CB85C); // Verde suave
  static const Color erro = Color(0xFFD9534F); // Vermelho suave
  static const Color aviso = Color(0xFFF0AD4E); // Amarelo suave
  
  // Cores de borda e divisores
  static const Color borda = Color(0xFF555555);
  static const Color divisor = Color(0xFF4A4A4A);
  
  // Cores de overlay
  static Color overlayClaro = Colors.white.withOpacity(0.1);
  static Color overlayMedio = Colors.white.withOpacity(0.2);
}

