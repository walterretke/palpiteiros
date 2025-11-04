import 'package:flutter/material.dart';
import 'package:palpiteiros/app_layout.dart';
import 'package:palpiteiros/telas/esqueci_senha_screen.dart';
import 'package:palpiteiros/telas/cadastro_screen.dart';
import 'package:palpiteiros/cores.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _fazerLogin() {
    // Se tiver qualquer coisa no email e senha, entra
    if (_emailController.text.isNotEmpty && _senhaController.text.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AppLayout()),
      );
    } else {
      // Mostra mensagem de erro se estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor, preencha email e senha'),
          backgroundColor: AppCores.erro,
        ),
      );
    }
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo ou Título
                    const Text(
                      'PALPITEIROS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppCores.textoBranco,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Seu app de bolão',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppCores.textoSecundario,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Campo Email
                    TextFormField(
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
                    TextFormField(
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
                    const SizedBox(height: 32),

                    // Botão Entrar
                    ElevatedButton(
                      onPressed: _fazerLogin,
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
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Links inferiores
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EsqueciSenhaScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Esqueci a senha',
                        style: TextStyle(
                          color: AppCores.textoSecundario,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: AppCores.textoSecundario,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

