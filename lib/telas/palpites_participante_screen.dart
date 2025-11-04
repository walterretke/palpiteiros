// Arquivo: lib/telas/palpites_participante_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class PalpitesParticipanteScreen extends StatelessWidget {
  final String nomeParticipante;
  final int rodada;
  final String avatar;

  const PalpitesParticipanteScreen({
    super.key,
    required this.nomeParticipante,
    required this.rodada,
    required this.avatar,
  });

  // Dados mockados dos palpites
  List<Map<String, dynamic>> get palpites {
    return [
      {
        'mandante': 'Flamengo',
        'visitante': 'Palmeiras',
        'palpiteMandante': 2,
        'palpiteVisitante': 1,
        'resultadoReal': null, // Se null, jogo ainda não aconteceu
      },
      {
        'mandante': 'Corinthians',
        'visitante': 'São Paulo',
        'palpiteMandante': 1,
        'palpiteVisitante': 0,
        'resultadoReal': {'mandante': 2, 'visitante': 1}, // Resultado real
      },
      {
        'mandante': 'Santos',
        'visitante': 'Fluminense',
        'palpiteMandante': 3,
        'palpiteVisitante': 2,
        'resultadoReal': {'mandante': 1, 'visitante': 1},
      },
      {
        'mandante': 'Grêmio',
        'visitante': 'Internacional',
        'palpiteMandante': 0,
        'palpiteVisitante': 1,
        'resultadoReal': null,
      },
      {
        'mandante': 'Atlético-MG',
        'visitante': 'Cruzeiro',
        'palpiteMandante': 2,
        'palpiteVisitante': 2,
        'resultadoReal': {'mandante': 2, 'visitante': 2},
      },
    ];
  }

  // Calcula pontuação do palpite
  int _calcularPontuacao(Map<String, dynamic> palpite) {
    final resultadoReal = palpite['resultadoReal'];
    if (resultadoReal == null) return 0; // Jogo ainda não aconteceu

    final palpiteMandante = palpite['palpiteMandante'] as int;
    final palpiteVisitante = palpite['palpiteVisitante'] as int;
    final realMandante = resultadoReal['mandante'] as int;
    final realVisitante = resultadoReal['visitante'] as int;

    // Acertou placar exato
    if (palpiteMandante == realMandante && palpiteVisitante == realVisitante) {
      return 10;
    }

    // Acertou resultado (vitória/empate/derrota)
    final palpiteVencedor = palpiteMandante > palpiteVisitante
        ? 'mandante'
        : palpiteMandante < palpiteVisitante
            ? 'visitante'
            : 'empate';
    final realVencedor = realMandante > realVisitante
        ? 'mandante'
        : realMandante < realVisitante
            ? 'visitante'
            : 'empate';

    if (palpiteVencedor == realVencedor) {
      return 5;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final pontuacaoTotal = palpites
        .map((p) => _calcularPontuacao(p))
        .fold(0, (sum, pontos) => sum + pontos);

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
            
            // Informações do participante
            _buildParticipanteInfo(pontuacaoTotal),
            
            // Lista de palpites
            Expanded(
              child: _buildPalpitesList(),
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
                  'Palpites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rodada $rodada',
                  style: const TextStyle(
                      color: AppCores.textoSecundario,
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

  // Informações do participante
  Widget _buildParticipanteInfo(int pontuacaoTotal) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
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
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                avatar,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomeParticipante,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pontuação: $pontuacaoTotal pontos',
                  style: TextStyle(
                    color: AppCores.aviso,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Lista de palpites
  Widget _buildPalpitesList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: palpites.length,
      itemBuilder: (context, index) {
        final palpite = palpites[index];
        final pontuacao = _calcularPontuacao(palpite);
        final resultadoReal = palpite['resultadoReal'];

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placar do palpite
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            palpite['mandante'],
                            style: const TextStyle(
                              color: AppCores.textoBranco,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppCores.overlayMedio,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${palpite['palpiteMandante']}',
                                style: const TextStyle(
                                  color: AppCores.textoBranco,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'x',
                      style: TextStyle(
                        color: AppCores.textoBranco,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            palpite['visitante'],
                            style: const TextStyle(
                              color: AppCores.textoBranco,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppCores.overlayMedio,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${palpite['palpiteVisitante']}',
                                style: const TextStyle(
                                  color: AppCores.textoBranco,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Resultado real (se disponível)
                if (resultadoReal != null) ...[
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white54),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Resultado: ${resultadoReal['mandante']} x ${resultadoReal['visitante']}',
                        style: const TextStyle(
                          color: AppCores.textoSecundario,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: pontuacao > 0
                              ? AppCores.sucesso
                              : AppCores.erro,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$pontuacao pts',
                          style: const TextStyle(
                            color: AppCores.textoBranco,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white54),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.schedule, color: Colors.white70, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Jogo ainda não aconteceu',
                        style: TextStyle(
                          color: AppCores.textoSecundario,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

