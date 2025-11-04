// Arquivo: lib/telas/perfil_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background igual ao da home
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner vermelho no topo (igual à home)
              _buildTopBanner(),
              
              // Seção de perfil
              _buildProfileHeader(),
              
              // Estatísticas do usuário
              _buildStatsSection(),
              
              // Informações pessoais
              _buildInfoSection(),
              
              // Seção de ações
              _buildActionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Banner vermelho no topo (mesmo estilo da home)
  Widget _buildTopBanner() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppCores.fundoEscuro,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "MEU PERFIL",
            style: TextStyle(
              color: AppCores.textoBranco,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Header do perfil com avatar e nome
  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppCores.fundoCard,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppCores.textoBranco,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 80,
              color: AppCores.destaque,
            ),
          ),
          const SizedBox(height: 20),
          // Nome
          const Text(
            "Walter Retke",
            style: TextStyle(
              color: AppCores.textoBranco,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Username ou email
          const Text(
            "@walter.retke",
            style: TextStyle(
              color: AppCores.textoSecundario,
              fontSize: 16,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Seção de estatísticas
  Widget _buildStatsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppCores.fundoCardClaro,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("15", "Bolões"),
          _buildStatItem("342", "Palpites"),
          _buildStatItem("87", "Acertos"),
          _buildStatItem("12º", "Ranking"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1)),
            ],
          ),
        ),
      ],
    );
  }

  // Seção de informações pessoais
  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Azul (mesma cor dos cards públicos)
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Informações",
            style: TextStyle(
              color: AppCores.textoBranco,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.email, "walter.retke@email.com"),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.phone, "+55 (11) 98765-4321"),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.location_on, "São Paulo, SP"),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.cake, "Membro desde: Janeiro 2023"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppCores.textoBranco,
              fontSize: 16,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Seção de ações
  Widget _buildActionsSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0),
      child: Column(
        children: [
          _buildActionButton(
            "Editar Perfil",
            Icons.edit,
            AppCores.fundoCard,
            AppCores.fundoCardClaro,
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            "Configurações",
            Icons.settings,
            AppCores.fundoCard,
            AppCores.destaque,
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            "Sair",
            Icons.exit_to_app,
            AppCores.erro,
            AppCores.erro,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color, Color buttonColor) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Ação do botão
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppCores.textoBranco,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}