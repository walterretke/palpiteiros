// Arquivo: lib/telas/ranking_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  // Dados mockados dos bolões do usuário
  final List<Map<String, dynamic>> meusBoloes = [
    {'id': 'brasileiro', 'nome': 'Ranking Brasileiro', 'participantes': 15420},
    {'id': 'facul', 'nome': 'Turma da facul', 'participantes': 12},
    {'id': 'firma', 'nome': 'Bolão da Firma', 'participantes': 30},
    {'id': 'familia', 'nome': 'Bolão da Família', 'participantes': 8},
  ];

  String? rankingSelecionado = 'brasileiro';

  // Dados mockados do ranking brasileiro
  final List<Map<String, dynamic>> rankingBrasileiro = [
    {'posicao': 1, 'nome': 'Carlos Silva', 'pontos': 2847, 'avatar': '👑'},
    {'posicao': 2, 'nome': 'Maria Santos', 'pontos': 2756, 'avatar': '🥈'},
    {'posicao': 3, 'nome': 'João Oliveira', 'pontos': 2689, 'avatar': '🥉'},
    {'posicao': 4, 'nome': 'Ana Costa', 'pontos': 2645, 'avatar': '⭐'},
    {'posicao': 5, 'nome': 'Pedro Almeida', 'pontos': 2598, 'avatar': '⭐'},
    {'posicao': 12, 'nome': 'Walter Retke', 'pontos': 2342, 'avatar': '🔥'},
    {'posicao': 13, 'nome': 'Fernanda Lima', 'pontos': 2321, 'avatar': '⭐'},
    {'posicao': 14, 'nome': 'Rafael Souza', 'pontos': 2305, 'avatar': '⭐'},
    {'posicao': 15, 'nome': 'Juliana Rocha', 'pontos': 2289, 'avatar': '⭐'},
    {'posicao': 16, 'nome': 'Lucas Ferreira', 'pontos': 2274, 'avatar': '⭐'},
  ];

  // Dados mockados do ranking da facul
  final List<Map<String, dynamic>> rankingFacul = [
    {'posicao': 1, 'nome': 'Bruno Lima', 'pontos': 342, 'avatar': '👑'},
    {'posicao': 2, 'nome': 'Walter Retke', 'pontos': 328, 'avatar': '🥈'},
    {'posicao': 3, 'nome': 'Camila Silva', 'pontos': 315, 'avatar': '🥉'},
    {'posicao': 4, 'nome': 'Thiago Costa', 'pontos': 298, 'avatar': '⭐'},
    {'posicao': 5, 'nome': 'Larissa Santos', 'pontos': 287, 'avatar': '⭐'},
    {'posicao': 6, 'nome': 'Gabriel Alves', 'pontos': 275, 'avatar': '⭐'},
    {'posicao': 7, 'nome': 'Isabela Oliveira', 'pontos': 264, 'avatar': '⭐'},
    {'posicao': 8, 'nome': 'Rafael Martins', 'pontos': 251, 'avatar': '⭐'},
  ];

  // Dados mockados do ranking da firma
  final List<Map<String, dynamic>> rankingFirma = [
    {'posicao': 1, 'nome': 'Patricia Souza', 'pontos': 456, 'avatar': '👑'},
    {'posicao': 2, 'nome': 'Roberto Lima', 'pontos': 442, 'avatar': '🥈'},
    {'posicao': 3, 'nome': 'Amanda Costa', 'pontos': 428, 'avatar': '🥉'},
    {'posicao': 4, 'nome': 'Walter Retke', 'pontos': 415, 'avatar': '🔥'},
    {'posicao': 5, 'nome': 'Felipe Rocha', 'pontos': 401, 'avatar': '⭐'},
    {'posicao': 6, 'nome': 'Mariana Alves', 'pontos': 389, 'avatar': '⭐'},
    {'posicao': 7, 'nome': 'Daniel Silva', 'pontos': 375, 'avatar': '⭐'},
    {'posicao': 8, 'nome': 'Carolina Santos', 'pontos': 362, 'avatar': '⭐'},
  ];

  // Dados mockados do ranking da família
  final List<Map<String, dynamic>> rankingFamilia = [
    {'posicao': 1, 'nome': 'Walter Retke', 'pontos': 189, 'avatar': '👑'},
    {'posicao': 2, 'nome': 'Mãe Maria', 'pontos': 175, 'avatar': '🥈'},
    {'posicao': 3, 'nome': 'Pai João', 'pontos': 162, 'avatar': '🥉'},
    {'posicao': 4, 'nome': 'Irmã Ana', 'pontos': 148, 'avatar': '⭐'},
    {'posicao': 5, 'nome': 'Tio Carlos', 'pontos': 135, 'avatar': '⭐'},
  ];

  List<Map<String, dynamic>> get rankingAtual {
    switch (rankingSelecionado) {
      case 'facul':
        return rankingFacul;
      case 'firma':
        return rankingFirma;
      case 'familia':
        return rankingFamilia;
      default:
        return rankingBrasileiro;
    }
  }

  String get nomeRankingAtual {
    return meusBoloes.firstWhere(
      (bolao) => bolao['id'] == rankingSelecionado,
      orElse: () => meusBoloes[0],
    )['nome'];
  }

  int get totalParticipantes {
    return meusBoloes.firstWhere(
      (bolao) => bolao['id'] == rankingSelecionado,
      orElse: () => meusBoloes[0],
    )['participantes'];
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner vermelho no topo
              _buildTopBanner(),
              
              // Dropdown para selecionar o ranking
              _buildDropdown(),
              
              // Título do ranking atual
              _buildSectionTitle(nomeRankingAtual),
              
              // Lista de ranking
              _buildRankingList(),
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
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "RANKING",
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

  // Dropdown para selecionar o ranking
  Widget _buildDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppCores.fundoCard,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: rankingSelecionado,
          isExpanded: true,
          dropdownColor: AppCores.fundoCardClaro,
          style: const TextStyle(
            color: AppCores.textoBranco,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          icon: const Icon(Icons.arrow_drop_down, color: AppCores.textoBranco),
          items: meusBoloes.map((bolao) {
            return DropdownMenuItem<String>(
              value: bolao['id'],
              child: Row(
                children: [
                  Icon(
                    bolao['id'] == 'brasileiro' 
                        ? Icons.flag 
                        : Icons.groups,
                    color: AppCores.textoSecundario,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(bolao['nome']),
                  ),
                  Text(
                    '${bolao['participantes']}',
                    style: const TextStyle(
                      color: AppCores.textoSecundario,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? novoId) {
            setState(() {
              rankingSelecionado = novoId;
            });
          },
        ),
      ),
    );
  }

  // Título da seção
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppCores.textoBranco,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppCores.aviso,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$totalParticipantes participantes',
              style: const TextStyle(
                color: AppCores.textoBranco,
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
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0),
      child: Column(
        children: rankingAtual.map((participante) {
          final int index = rankingAtual.indexOf(participante);
          final bool isCurrentUser = participante['nome'] == 'Walter Retke';
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: isCurrentUser 
                  ? AppCores.destaque // Destaque para o usuário atual
                  : AppCores.fundoCard,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
              border: isCurrentUser 
                  ? Border.all(color: AppCores.destaque, width: 2)
                  : null,
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
                    color: AppCores.textoBranco,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
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