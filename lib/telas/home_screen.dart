import 'package:flutter/material.dart';
// Vamos criar este componente no próximo passo
import 'package:palpiteiros/componentes/bolao_card.dart';
import 'package:palpiteiros/cores.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Vamos remover o AppBar padrão, pois seu design tem um banner customizado
      // appBar: AppBar(...),
      
      body: Container(
        // 1. O BACKGROUND
        // Ocupa toda a tela
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"), // Caminho do pubspec.yaml
            fit: BoxFit.cover, // Cobre todo o espaço
          ),
        ),
        
        // 2. O CONTEÚDO ROLÁVEL
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha tudo à esquerda
            children: [
              
              // 3. O BANNER VERMELHO (HEADER)
              _buildTopBanner(),

              // 4. O TÍTULO "SEUS BOLÕES"
              _buildSectionTitle("Seus bolões"),

              // 5. A LISTA HORIZONTAL DE CARDS
              _buildHorizontalList(),

              // Você pode adicionar mais seções aqui
              _buildSectionTitle("Bolões públicos"),
              _buildHorizontalList(), // Reutilizando a lista

            ],
          ),
        ),
      ),
    );
  }

  // MÉTODO PRIVADO PARA CRIAR O BANNER VERMELHO
  Widget _buildTopBanner() {
    return Container(
      // Margem para não colar nas bordas
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppCores.fundoEscuro,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20), // Bordas arredondadas só embaixo
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Coluna para os textos
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PALPITEIROS, SEU APP DE BOLÃO!",
                style: TextStyle(
                  color: AppCores.textoBranco,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "PALPITES, RESENHA E DIVERSÃO",
                style: TextStyle(
                  color: AppCores.textoSecundario,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Imagem do Logo
          // Certifique-se de ter essa imagem em 'assets/images/logo_fc.png'
          Image.asset(
            'assets/images/logo_fc.png', 
            height: 60,
            errorBuilder: (context, error, stackTrace) {
              // Placeholder se a imagem não for encontrada
              return const Icon(Icons.shield, color: AppCores.textoBranco, size: 60);
            },
          ),
        ],
      ),
    );
  }

  // MÉTODO PRIVADO PARA O TÍTULO DA SEÇÃO
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppCores.textoBranco,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // MÉTODO PRIVADO PARA A LISTA HORIZONTAL
  Widget _buildHorizontalList() {
    return Container(
      // Altura definida é essencial para ListViews horizontais
      height: 290, 
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espaçamento nas laterais da lista
        children: [
          // Vamos criar os cards
          // (Os dados são 'hardcoded' pois é só front-end)
          BolaoCard(
            title: "Turma da facul",
            participants: "12 participantes",
            round: "Rodada 2/38",
            isPrivate: true,
            infoTime: "Próxima rodada em 1 dia",
            infoAction: "Não esqueça de fazer seus palpites!",
            avatarPath: "assets/images/avatar_facul.png",
          ),
          BolaoCard(
            title: "Bolão da Firma",
            participants: "30 participantes",
            round: "Rodada 2/38",
            isPrivate: false,
            infoTime: "Próxima rodada em 1 dia",
            infoAction: "Rodada aberta para palpites!",
            avatarPath: "assets/images/avatar_firma.png",
          ),
          // Adicione mais cards aqui...
        ],
      ),
    );
  }
}