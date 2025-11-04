import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class EsqueciSenhaScreen extends StatefulWidget {
  const EsqueciSenhaScreen({super.key});

  @override
  State<EsqueciSenhaScreen> createState() => _EsqueciSenhaScreenState();
}

class _EsqueciSenhaScreenState extends State<EsqueciSenhaScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _enviarRecuperacao() {
    // Mostra mensagem fake e volta para login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Email de recuperação enviado! (Fake)'),
        backgroundColor: AppCores.sucesso,
      ),
    );
    
    // Volta para a tela de login após um breve delay
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Botão voltar
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppCores.textoBranco),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Título
                  const Text(
                    'Esqueci a Senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppCores.textoBranco,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Digite seu email para recuperar a senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppCores.textoSecundario,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Campo Email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: AppCores.textoSecundario),
                      prefixIcon: const Icon(Icons.email, color: AppCores.textoSecundario),
                      filled: true,
                      fillColor: AppCores.overlayClaro,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppCores.borda),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppCores.borda),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppCores.destaque, width: 2),
                      ),
                    ),
                    style: const TextStyle(color: AppCores.textoPrincipal),
                  ),
                  const SizedBox(height: 32),

                  // Botão Enviar
                  ElevatedButton(
                    onPressed: _enviarRecuperacao,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppCores.destaque,
                      foregroundColor: AppCores.textoBranco,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

