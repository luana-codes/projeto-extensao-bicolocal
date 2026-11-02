import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
import '../componentes/botao_arredondado.dart';
import '../componentes/campo_texto.dart';
import '../componentes/logotipo.dart';
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _EstadoTelaLogin();
}

class _EstadoTelaLogin extends State<TelaLogin> {
  final _formularioLogin = GlobalKey<FormState>();
  final _formularioCadastro = GlobalKey<FormState>();

//Login Usuario
  final _loginEmail = TextEditingController();
  final _loginSenha = TextEditingController();

//Cadastro
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _cidade = TextEditingController();
  final _telefone = TextEditingController();

  @override
  void dispose() {
    for (final controlador in [
      _loginEmail,
      _loginSenha,
      _nome,
      _email,
      _senha,
      _cidade,
      _telefone,
    ]) {
      controlador.dispose();
    }
    super.dispose();
  }

//Validacao
  String? _validarEmail(String? valor) {
    final texto = valor?.trim() ?? '';
    if (texto.isEmpty) return 'Informe o e-mail';
    final valido = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(texto);
    return valido ? null : 'E-mail inválido';
  }
 
  String? _validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Informe a senha';
    if (valor.length < 6) return 'A senha deve ter ao menos 6 caracteres';
    return null;
  }
 
  String? _validarObrigatorio(String? valor) {
    return (valor == null || valor.trim().isEmpty)
        ? 'Campo obrigatório'
        : null;
  }
 
  String? _validarTelefone(String? valor) {
    final digitos = valor ?? '';
    if (digitos.isEmpty) return 'Informe o telefone';
    if (digitos.length < 10) return 'Informe DDD + número';
    return null;
  }

//Acoes
  void _mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(texto)));
  }
 
  void _entrar() {
    if (_formularioLogin.currentState!.validate()) {
      _mostrarMensagem('Login validado. Autenticação será ligada na Etapa 2.');
    }
  }
 
  void _cadastrar() {
    if (_formularioCadastro.currentState!.validate()) {
      _mostrarMensagem('Cadastro validado. Gravação será ligada na Etapa 2.');
    }
  }
 
  void _esqueceuSenha() {
    // TODO (futuro): RF03 - recuperação de senha por e-mail.
    _mostrarMensagem('Recuperação de senha prevista para as próximas etapas.');
  }

//Estrutura da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  const Logotipo(),
                  const SizedBox(height: 20),
                  const Text(
                    'Bem-vindo ao BicoLocal',
                    textAlign: TextAlign.center,
                    style: EstilosTexto.titulo,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Acesso rápido para serviços locais.',
                    textAlign: TextAlign.center,
                    style: EstilosTexto.subtitulo,
                  ),
                  const SizedBox(height: 24),
                  _construirBlocoLogin(),
                  const SizedBox(height: 24),
                  _construirCartaoCadastro(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 
  Widget _construirBlocoLogin() {
    return Form(
      key: _formularioLogin,
      child: Column(
        children: [
          CampoTexto(
            controlador: _loginEmail,
            dica: 'E-mail',
            icone: Icons.mail_outline,
            teclado: TextInputType.emailAddress,
            validador: _validarEmail,
          ),
          const SizedBox(height: 12),
          CampoTexto(
            controlador: _loginSenha,
            dica: 'Senha',
            icone: Icons.lock_outline,
            senha: true,
            validador: _validarSenha,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _esqueceuSenha,
              child: const Text('Esqueceu a senha?', style: EstilosTexto.link),
            ),
          ),
          const SizedBox(height: 4),
          BotaoArredondado(
            texto: 'Entrar',
            cor: Cores.verde,
            aoPressionar: _entrar,
          ),
        ],
      ),
    );
  }
 
  Widget _construirCartaoCadastro() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Cores.cartao,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Cores.sombra,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formularioCadastro,
        child: Column(
          children: [
            const Text(
              'Não tem conta? Cadastre-se abaixo',
              style: EstilosTexto.tituloCartao,
            ),
            const SizedBox(height: 14),
            CampoTexto(
              controlador: _nome,
              dica: 'Nome completo',
              icone: Icons.person_outline,
              raio: 24,
              validador: _validarObrigatorio,
            ),
            const SizedBox(height: 10),
            CampoTexto(
              controlador: _email,
              dica: 'E-mail',
              icone: Icons.mail_outline,
              raio: 24,
              teclado: TextInputType.emailAddress,
              validador: _validarEmail,
            ),
            const SizedBox(height: 10),
            CampoTexto(
              controlador: _senha,
              dica: 'Senha',
              icone: Icons.lock_outline,
              raio: 24,
              senha: true,
              validador: _validarSenha,
            ),
            const SizedBox(height: 10),
            CampoTexto(
              controlador: _cidade,
              dica: 'Cidade',
              icone: Icons.location_on_outlined,
              raio: 24,
              validador: _validarObrigatorio,
            ),
            const SizedBox(height: 10),
            CampoTexto(
              controlador: _telefone,
              dica: 'Telefone (WhatsApp)',
              icone: Icons.phone_outlined,
              raio: 24,
              teclado: TextInputType.phone,
              formatadores: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
              validador: _validarTelefone,
            ),
            const SizedBox(height: 18),
            BotaoArredondado(
              texto: 'Cadastrar',
              cor: Cores.azul,
              aoPressionar: _cadastrar,
            ),
            const SizedBox(height: 10),
            const Text(
              'Ao criar uma conta, você concorda com os nossos Termos de Privacidade.',
              textAlign: TextAlign.center,
              style: EstilosTexto.nota,
            ),
          ],
        ),
      ),
    );
  }
}