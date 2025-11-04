// Arquivo: lib/telas/ranking_bolao_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class RankingBolaoScreen extends StatelessWidget {
  final String bolaoTitle;

  RankingBolaoScreen({
    super.key,
    required this.bolaoTitle,
  });

  // Dados mockados do ranking do bolão
  final List<Map<String, dynamic>> ranking = [
    {'posicao': 1, 'nome': 'Carlos Silva', 'pontos': 2847, 'avatar': '👑'},
    {'posicao': 2, 'nome': 'Maria Santos', 'pontos': 2756, 'avatar': '🥈'},
    {'posicao': 3, 'nome': 'João Oliveira', 'pontos': 2689, 'avatar': '🥉'},
    {'posicao': 4, 'nome': 'Ana Costa', 'pontos': 2645, 'avatar': '⭐'},
    {'posicao': 5, 'nome': 'Pedro Almeida', 'pontos': 2598, 'avatar': '⭐'},
    {'posicao': 6, 'nome': 'Fernanda Lima', 'pontos': 2543, 'avatar': '⭐'},
    {'posicao': 7, 'nome': 'Walter Retke', 'pontos': 2342, 'avatar': '🔥'},
    {'posicao': 8, 'nome': 'Rafael Souza', 'pontos': 2305, 'avatar': '⭐'},
    {'posicao': 9, 'nome': 'Juliana Rocha', 'pontos': 2289, 'avatar': '⭐'},
    {'posicao': 10, 'nome': 'Lucas Ferreira', 'pontos': 2274, 'avatar': '⭐'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Banner vermelho no topo
            _buildTopBanner(context),
            
            // Título do ranking
            _buildSectionTitle(),
            
            // Lista de ranking
            Expanded(
              child: _buildRankingList(),
            ),
          ],
        ),
      ),
    );
  }

  // Banner vermelho no topo
  Widget _buildTopBanner(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RANKING',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  bolaoTitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Título da seção
  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Classificação',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 2, offset: Offset(1, 1)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppCores.aviso,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${ranking.length} participantes',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Lista de ranking
  Widget _buildRankingList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: ranking.length,
      itemBuilder: (context, index) {
        final participante = ranking[index];
        final isCurrentUser = participante['nome'] == 'Walter Retke';
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              color: isCurrentUser 
                ? AppCores.destaque // Destaque para o usuário atual
                : AppCores.fundoCard,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: AppCores.overlayMedio,
              ),
              child: Center(
                child: Text(
                  participante['avatar'],
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getPositionColor(participante['posicao']),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${participante['posicao']}',
                      style: const TextStyle(
                        color: AppCores.textoBranco,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    participante['nome'],
                    style: TextStyle(
                      color: AppCores.textoBranco,
                      fontSize: 16,
                      fontWeight: isCurrentUser 
                          ? FontWeight.bold 
                          : FontWeight.normal,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                  color: AppCores.overlayMedio,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${participante['pontos']} pts',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getPositionColor(int posicao) {
    switch (posicao) {
      case 1:
        return AppCores.aviso; // Ouro
      case 2:
        return AppCores.textoSecundario; // Prata
      case 3:
        return AppCores.aviso.withOpacity(0.7); // Bronze
      default:
        return AppCores.fundoCardClaro;
    }
  }
}

