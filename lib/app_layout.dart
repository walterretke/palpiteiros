// Arquivo: lib/app_layout.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

// 1. Importar as páginas com os novos nomes
import 'package:palpiteiros/telas/home_screen.dart';      // <-- Esta é a "Inicio"
import 'package:palpiteiros/telas/ranking_screen.dart';   // <-- Nova
import 'package:palpiteiros/telas/palpites_screen.dart';  // <-- Nova
import 'package:palpiteiros/telas/perfil_screen.dart';    // <-- Nova

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _paginaAtualIndex = 1; // <-- IMPORTANTE: Começar na tela "Inicio" (índice 1)

  // 2. Definir a ORDEM das páginas
  final List<Widget> _paginas = [
    const RankingScreen(), // <-- Índice 0
    const HomeScreen(),    // <-- Índice 1 (Inicio)
    const PalpitesScreen(), // <-- Índice 2
    const PerfilScreen(),  // <-- Índice 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _paginaAtualIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _paginaAtualIndex,
        children: _paginas,
      ),

      // 3. AQUI ESTÁ A MÁGICA DO MENU
      bottomNavigationBar: BottomNavigationBar(
        
        // Esta propriedade garante que todos os itens apareçam
        // mesmo com tamanhos diferentes
        type: BottomNavigationBarType.fixed, 
        
        items: const <BottomNavigationBarItem>[
          // Item da Esquerda (Índice 0)
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard), // Ícone de ranking
            label: 'Ranking',
          ),
          
          // Item do Meio (Índice 1)
          BottomNavigationBarItem(
            // AQUI: Usamos um ícone maior (size: 40)
            icon: Icon(Icons.home, size: 40), 
            label: 'Inicio',
          ),
          
          // Item (Índice 2)
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer), // Ícone de palpites
            label: 'Palpites',
          ),
          
          // Item da Direita (Índice 3)
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ícone de perfil
            label: 'Perfil',
          ),
        ],
        currentIndex: _paginaAtualIndex,
        onTap: _onItemTapped,
        
        // Estilo para o item selecionado
        selectedItemColor: AppCores.destaque,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        // Estilo para itens não selecionados
        unselectedItemColor: AppCores.textoSecundario,
      ),
    );
  }
}