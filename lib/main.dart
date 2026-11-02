import 'package:flutter/material.dart';
 
import 'telas/tela_login.dart';
import 'tema/tema_app.dart';
 
void main() => runApp(const AplicativoBicoLocal());
 
class AplicativoBicoLocal extends StatelessWidget {
  const AplicativoBicoLocal({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BicoLocal',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.claro,
      home: const TelaLogin(),
    );
  }
}