// Arquivo: lib/componentes/bolao_card.dart
import 'package:flutter/material.dart';
import 'package:palpiteiros/telas/detalhes_bolao_screen.dart';
import 'package:palpiteiros/cores.dart';

// Este é o widget reutilizável do Card
class BolaoCard extends StatelessWidget {
  // Parâmetros que o card vai receber
  final String title;
  final String participants;
  final String round;
  final bool isPrivate;
  final String infoTime;
  final String infoAction;
  final String avatarPath;

  const BolaoCard({
    super.key,
    required this.title,
    required this.participants,
    required this.round,
    required this.isPrivate,
    required this.infoTime,
    required this.infoAction,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280, // Largura fixa para cada card
      margin: const EdgeInsets.only(right: 16.0), // Espaçamento entre os cards
      decoration: BoxDecoration(
        color: AppCores.fundoCard,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CHIPS SUPERIORES (Rodada e Cadeado)
            _buildTopChips(),
            const SizedBox(height: 16),
            
            // 2. HEADER (Avatar e Título)
            _buildHeader(),
            const SizedBox(height: 12),

            // 3. DIVISOR
            const Divider(color: AppCores.divisor),
            const SizedBox(height: 12),

            // 4. INFORMAÇÕES (Relógio e Textos)
            _buildInfoRow(),
            
            // Spacer para empurrar o botão para baixo
            const Spacer(), 

            // 5. BOTÃO DE ACESSAR
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  // Helper para os chips "Rodada 2/38" e "Cadeado"
  Widget _buildTopChips() {
    return Row(
      children: [
        // Chip da Rodada
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: AppCores.aviso,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            round,
            style: const TextStyle(
                color: AppCores.textoBranco, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        const SizedBox(width: 8),
        // Chip de Privacidade (Cadeado)
        if (isPrivate) // Só mostra se 'isPrivate' for verdadeiro
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AppCores.aviso,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.lock, color: AppCores.textoBranco, size: 14),
          ),
      ],
    );
  }

  // Helper para o Avatar e Título
  Widget _buildHeader() {
    // Verifica se o avatarPath está vazio ou nulo
    final bool hasAvatar = avatarPath.isNotEmpty;
    
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppCores.overlayMedio,
          child: hasAvatar
              ? ClipOval(
                  child: Image.asset(
                    avatarPath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Se houver erro ao carregar a imagem, mostrar o ícone padrão
                      return const Icon(
                        Icons.group,
                        color: AppCores.textoSecundario,
                        size: 30,
                      );
                    },
                  ),
                )
              : const Icon(
                  Icons.group,
                  color: AppCores.textoSecundario,
                  size: 30,
                ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppCores.textoBranco,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              participants,
              style: const TextStyle(color: AppCores.textoSecundario, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  // Helper para a linha de Informação (Relógio)
  Widget _buildInfoRow() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.alarm, color: AppCores.textoSecundario, size: 20),
          const SizedBox(width: 8),
          // Usamos Expanded para o texto quebrar a linha se for muito longo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoTime,
                  style: const TextStyle(color: AppCores.textoPrincipal, fontSize: 13),
                ),
                Text(
                  infoAction,
                  style: const TextStyle(color: AppCores.textoSecundario, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      );
  }

  // Helper para o Botão
  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Faz o botão ocupar toda a largura do card
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppCores.destaque,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          // Extrair o número da rodada atual e total de rodadas do formato "Rodada 2/38"
          final rodadaMatch = RegExp(r'Rodada (\d+)/(\d+)').firstMatch(round);
          final rodadaAtual = rodadaMatch != null ? int.parse(rodadaMatch.group(1)!) : 2;
          final totalRodadas = rodadaMatch != null ? int.parse(rodadaMatch.group(2)!) : 38;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesBolaoScreen(
                bolaoTitle: title,
                rodadaAtual: rodadaAtual,
                totalRodadas: totalRodadas,
              ),
            ),
          );
        },
        child: const Text(
          "Acessar este bolão",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}