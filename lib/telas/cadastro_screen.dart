import 'package:flutter/material.dart';
import 'package:palpiteiros/cores.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    // Mostra mensagem fake e volta para login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Cadastro realizado com sucesso! (Fake)'),
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
                    'Cadastrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppCores.textoBranco,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Crie sua conta para começar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppCores.textoSecundario,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Campo Nome
                  TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: const TextStyle(color: AppCores.textoSecundario),
                      prefixIcon: const Icon(Icons.person, color: AppCores.textoSecundario),
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
                  const SizedBox(height: 16),

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
                  const SizedBox(height: 16),

                  // Campo Senha
                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: AppCores.textoSecundario),
                      prefixIcon: const Icon(Icons.lock, color: AppCores.textoSecundario),
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
                  const SizedBox(height: 16),

                  // Campo Confirmar Senha
                  TextField(
                    controller: _confirmarSenhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: const TextStyle(color: AppCores.textoSecundario),
                      prefixIcon: const Icon(Icons.lock_outline, color: AppCores.textoSecundario),
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

                  // Botão Cadastrar
                  ElevatedButton(
                    onPressed: _cadastrar,
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
                      'Cadastrar',
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

