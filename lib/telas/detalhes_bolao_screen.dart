// Arquivo: lib/telas/detalhes_bolao_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';
import 'package:palpiteiros/telas/palpites_participante_screen.dart';
import 'package:palpiteiros/telas/ranking_bolao_screen.dart';

class DetalhesBolaoScreen extends StatefulWidget {
  final String bolaoTitle;
  final int rodadaAtual;
  final int totalRodadas;

  const DetalhesBolaoScreen({
    super.key,
    required this.bolaoTitle,
    required this.rodadaAtual,
    required this.totalRodadas,
  });

  @override
  State<DetalhesBolaoScreen> createState() => _DetalhesBolaoScreenState();
}

class _DetalhesBolaoScreenState extends State<DetalhesBolaoScreen> {
  int rodadaSelecionada = 2; // Começa com a rodada atual

  // Dados mockados dos participantes
  final List<Map<String, dynamic>> participantes = [
    {
      'nome': 'Carlos Silva',
      'avatar': '👑',
      'palpitouRodada2': true,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 45,
    },
    {
      'nome': 'Maria Santos',
      'avatar': '🥈',
      'palpitouRodada2': true,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 42,
    },
    {
      'nome': 'João Oliveira',
      'avatar': '🥉',
      'palpitouRodada2': false,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 38,
    },
    {
      'nome': 'Ana Costa',
      'avatar': '⭐',
      'palpitouRodada2': true,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 35,
    },
    {
      'nome': 'Pedro Almeida',
      'avatar': '⭐',
      'palpitouRodada2': false,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 32,
    },
    {
      'nome': 'Fernanda Lima',
      'avatar': '⭐',
      'palpitouRodada2': true,
      'palpitouRodada1': true,
      'pontuacaoRodada1': 28,
    },
  ];

  // Lista de rodadas disponíveis no dropdown
  List<int> get rodadasDisponiveis {
    return List.generate(widget.totalRodadas, (index) => index + 1);
  }

  // Verifica se é rodada atual
  bool get isRodadaAtual => rodadaSelecionada == widget.rodadaAtual;

  @override
  void initState() {
    super.initState();
    rodadaSelecionada = widget.rodadaAtual;
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
        child: Column(
          children: [
            // Banner vermelho no topo
            _buildTopBanner(),
            
            // Dropdown de rodadas
            _buildDropdown(),
            
            // Botão "Ver ranking do bolão"
            _buildRankingButton(),
            
            // Lista de participantes
            Expanded(
              child: _buildParticipantesList(),
            ),
          ],
        ),
      ),
    );
  }

  // Banner vermelho no topo
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bolaoTitle,
                  style: const TextStyle(
                    color: AppCores.textoBranco,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${participantes.length} participantes',
                  style: const TextStyle(
                    color: AppCores.textoSecundario,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppCores.textoBranco),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Dropdown de rodadas
  Widget _buildDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppCores.fundoCard,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: rodadaSelecionada,
          isExpanded: true,
          dropdownColor: AppCores.fundoCardClaro,
          style: const TextStyle(
            color: AppCores.textoBranco,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          icon: const Icon(Icons.arrow_drop_down, color: AppCores.textoBranco),
          items: rodadasDisponiveis.map((rodada) {
            final isCurrent = rodada == widget.rodadaAtual;
            return DropdownMenuItem<int>(
              value: rodada,
              child: Row(
                children: [
                  const Icon(Icons.sports_soccer, color: AppCores.textoSecundario, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Rodada $rodada'),
                  ),
                  if (isCurrent)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppCores.aviso,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Atual',
                        style: TextStyle(
                          color: AppCores.textoBranco,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
          onChanged: (int? novaRodada) {
            if (novaRodada != null) {
              setState(() {
                rodadaSelecionada = novaRodada;
              });
            }
          },
        ),
      ),
    );
  }

  // Botão "Ver ranking do bolão"
  Widget _buildRankingButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppCores.aviso,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RankingBolaoScreen(
                  bolaoTitle: widget.bolaoTitle,
                ),
              ),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.leaderboard, color: AppCores.textoBranco),
              SizedBox(width: 8),
              Text(
                "Ver ranking do bolão",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Lista de participantes
  Widget _buildParticipantesList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: participantes.length,
      itemBuilder: (context, index) {
        final participante = participantes[index];
        final palpitou = _getPalpitouStatus(participante, rodadaSelecionada);
        final pontuacao = _getPontuacao(participante, rodadaSelecionada);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppCores.fundoCard,
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
            title: Text(
              participante['nome'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: isRodadaAtual
                ? Text(
                    palpitou ? 'Já palpitou' : 'Não palpitou',
                    style: TextStyle(
                      color: palpitou ? AppCores.sucesso : AppCores.erro,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Text(
                    'Pontuação: $pontuacao pontos',
                    style: const TextStyle(
                      color: AppCores.textoSecundario,
                      fontSize: 14,
                    ),
                  ),
            trailing: isRodadaAtual && palpitou
                ? TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PalpitesParticipanteScreen(
                            nomeParticipante: participante['nome'],
                            rodada: rodadaSelecionada,
                            avatar: participante['avatar'],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Ver palpites',
                      style: TextStyle(
                        color: AppCores.textoBranco,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : isRodadaAtual && !palpitou
                    ? const Text(
                        'Aguardando palpites',
                        style: TextStyle(
                          color: AppCores.textoSecundario,
                          fontSize: 12,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PalpitesParticipanteScreen(
                                nomeParticipante: participante['nome'],
                                rodada: rodadaSelecionada,
                                avatar: participante['avatar'],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Ver palpites',
                          style: TextStyle(
                            color: AppCores.textoBranco,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
          ),
        );
      },
    );
  }

  // Helper para verificar se o participante palpitou na rodada
  bool _getPalpitouStatus(Map<String, dynamic> participante, int rodada) {
    if (rodada == 2) {
      return participante['palpitouRodada2'] ?? false;
    } else if (rodada == 1) {
      return participante['palpitouRodada1'] ?? false;
    }
    return false;
  }

  // Helper para obter pontuação na rodada
  int _getPontuacao(Map<String, dynamic> participante, int rodada) {
    if (rodada == 1) {
      return participante['pontuacaoRodada1'] ?? 0;
    }
    return 0; // Rodadas futuras não têm pontuação ainda
  }
}

