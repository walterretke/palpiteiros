// Arquivo: lib/telas/palpites_screen.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class PalpitesScreen extends StatefulWidget {
  const PalpitesScreen({super.key});

  @override
  State<PalpitesScreen> createState() => _PalpitesScreenState();
}

class _PalpitesScreenState extends State<PalpitesScreen> {
  int rodadaSelecionada = 2; // Começa na rodada 2

  // Dados mockados dos jogos da rodada 2
  final List<Map<String, dynamic>> jogosRodada2 = [
    {
      'id': 1,
      'timeCasa': 'Flamengo',
      'timeVisitante': 'Palmeiras',
      'placarCasa': null,
      'placarVisitante': null,
      'data': '15/03',
      'hora': '16:00',
    },
    {
      'id': 2,
      'timeCasa': 'Corinthians',
      'timeVisitante': 'São Paulo',
      'placarCasa': null,
      'placarVisitante': null,
      'data': '15/03',
      'hora': '18:30',
    },
    {
      'id': 3,
      'timeCasa': 'Fluminense',
      'timeVisitante': 'Atlético-MG',
      'placarCasa': null,
      'placarVisitante': null,
      'data': '16/03',
      'hora': '16:00',
    },
    {
      'id': 4,
      'timeCasa': 'Botafogo',
      'timeVisitante': 'Vasco',
      'placarCasa': null,
      'placarVisitante': null,
      'data': '16/03',
      'hora': '18:30',
    },
    {
      'id': 5,
      'timeCasa': 'Grêmio',
      'timeVisitante': 'Internacional',
      'placarCasa': null,
      'placarVisitante': null,
      'data': '17/03',
      'hora': '16:00',
    },
  ];

  // Dados mockados dos jogos da rodada 1 (com palpites já feitos)
  final List<Map<String, dynamic>> jogosRodada1 = [
    {
      'id': 1,
      'timeCasa': 'Flamengo',
      'timeVisitante': 'Palmeiras',
      'placarCasa': 2,
      'placarVisitante': 1,
      'placarRealCasa': 2,
      'placarRealVisitante': 1,
      'data': '08/03',
      'hora': '16:00',
      'pontos': 10, // Acertou resultado exato
    },
    {
      'id': 2,
      'timeCasa': 'Corinthians',
      'timeVisitante': 'São Paulo',
      'placarCasa': 1,
      'placarVisitante': 2,
      'placarRealCasa': 0,
      'placarRealVisitante': 2,
      'data': '08/03',
      'hora': '18:30',
      'pontos': 5, // Acertou que São Paulo ganhou
    },
    {
      'id': 3,
      'timeCasa': 'Fluminense',
      'timeVisitante': 'Atlético-MG',
      'placarCasa': 0,
      'placarVisitante': 1,
      'placarRealCasa': 1,
      'placarRealVisitante': 1,
      'data': '09/03',
      'hora': '16:00',
      'pontos': 0, // Errou o resultado
    },
    {
      'id': 4,
      'timeCasa': 'Botafogo',
      'timeVisitante': 'Vasco',
      'placarCasa': 2,
      'placarVisitante': 0,
      'placarRealCasa': 3,
      'placarRealVisitante': 0,
      'data': '09/03',
      'hora': '18:30',
      'pontos': 5, // Acertou que Botafogo ganhou
    },
    {
      'id': 5,
      'timeCasa': 'Grêmio',
      'timeVisitante': 'Internacional',
      'placarCasa': 1,
      'placarVisitante': 1,
      'placarRealCasa': 1,
      'placarRealVisitante': 1,
      'data': '10/03',
      'hora': '16:00',
      'pontos': 10, // Acertou resultado exato
    },
  ];

  List<Map<String, dynamic>> get jogosAtuais {
    return rodadaSelecionada == 1 ? jogosRodada1 : jogosRodada2;
  }

  int get totalPontosRodada1 {
    return jogosRodada1.fold(0, (sum, jogo) => sum + (jogo['pontos'] as int));
  }

  // Controllers para os campos de placar da rodada 2
  final Map<int, TextEditingController> _controllersCasa = {};
  final Map<int, TextEditingController> _controllersVisitante = {};

  @override
  void initState() {
    super.initState();
    // Inicializar controllers para rodada 2
    for (var jogo in jogosRodada2) {
      _controllersCasa[jogo['id']] = TextEditingController();
      _controllersVisitante[jogo['id']] = TextEditingController();
    }
  }

  @override
  void dispose() {
    // Limpar controllers
    for (var controller in _controllersCasa.values) {
      controller.dispose();
    }
    for (var controller in _controllersVisitante.values) {
      controller.dispose();
    }
    super.dispose();
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

              // Dropdown para selecionar a rodada
              _buildDropdown(),

              // Mostrar pontuação total da rodada 1 se estiver selecionada
              if (rodadaSelecionada == 1) _buildPontuacaoTotal(),

              // Lista de jogos
              _buildListaJogos(),
            ],
          ),
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PALPITES",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown para selecionar a rodada
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
          items: [1, 2].map((rodada) {
            return DropdownMenuItem<int>(
              value: rodada,
              child: Row(
                children: [
                  const Icon(
                    Icons.sports_soccer,
                    color: AppCores.textoSecundario,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text('Rodada $rodada'),
                ],
              ),
            );
          }).toList(),
          onChanged: (int? novaRodada) {
            setState(() {
              rodadaSelecionada = novaRodada ?? 2;
            });
          },
        ),
      ),
    );
  }

  // Mostrar pontuação total da rodada 1
  Widget _buildPontuacaoTotal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppCores.sucesso,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, color: AppCores.aviso, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pontuação Total',
                style: TextStyle(
                  color: AppCores.textoBranco,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '$totalPontosRodada1 pontos',
                style: const TextStyle(
                  color: AppCores.textoBranco,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Lista de jogos
  Widget _buildListaJogos() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0),
      child: Column(
        children: jogosAtuais.map((jogo) {
          return _buildCardJogo(jogo);
        }).toList(),
      ),
    );
  }

  // Card de um jogo
  Widget _buildCardJogo(Map<String, dynamic> jogo) {
    final bool isRodada1 = rodadaSelecionada == 1;
    final bool isRodada2 = rodadaSelecionada == 2;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            // Data e hora
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${jogo['data']} - ${jogo['hora']}',
                  style: const TextStyle(
                    color: AppCores.textoSecundario,
                    fontSize: 12,
                  ),
                ),
                if (isRodada1 && jogo['pontos'] != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getPontosColor(jogo['pontos']),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${jogo['pontos']} pts',
                      style: const TextStyle(
                        color: AppCores.textoBranco,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            // Times e placares
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Time da casa
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        jogo['timeCasa'],
                        style: const TextStyle(
                          color: AppCores.textoBranco,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      if (isRodada2)
                        // Campo de input para rodada 2
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: _controllersCasa[jogo['id']],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppCores.textoBranco,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                          ),
                        )
                      else
                        // Mostrar placar da rodada 1
                        Column(
                          children: [
                            Container(
                              width: 60,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: AppCores.overlayMedio,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${jogo['placarCasa']}',
                                style: const TextStyle(
                                  color: AppCores.textoBranco,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Real: ${jogo['placarRealCasa']}',
                              style: TextStyle(
                                color: _getPlacarColor(
                                  jogo['placarCasa'],
                                  jogo['placarRealCasa'],
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // VS
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      color: AppCores.textoBranco,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Time visitante
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        jogo['timeVisitante'],
                        style: const TextStyle(
                          color: AppCores.textoBranco,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      if (isRodada2)
                        // Campo de input para rodada 2
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: _controllersVisitante[jogo['id']],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppCores.textoBranco,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppCores.overlayMedio,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                          ),
                        )
                      else
                        // Mostrar placar da rodada 1
                        Column(
                          children: [
                            Container(
                              width: 60,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: AppCores.overlayMedio,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${jogo['placarVisitante']}',
                                style: const TextStyle(
                                  color: AppCores.textoBranco,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Real: ${jogo['placarRealVisitante']}',
                              style: TextStyle(
                                color: _getPlacarColor(
                                  jogo['placarVisitante'],
                                  jogo['placarRealVisitante'],
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Cor baseada nos pontos
  Color _getPontosColor(int pontos) {
    if (pontos == 10) return AppCores.aviso; // Ouro para acerto exato
    if (pontos == 5) return AppCores.sucesso; // Verde para acerto parcial
    return AppCores.erro; // Vermelho para erro
  }

  // Cor baseada no acerto do placar
  Color _getPlacarColor(int? palpite, int? real) {
    if (palpite == real) return AppCores.sucesso;
    return AppCores.erro;
  }
}

