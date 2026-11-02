import 'package:flutter/material.dart';
 
import '../tema/estilos_texto.dart';
 
class BotaoArredondado extends StatelessWidget {
  const BotaoArredondado({
    super.key,
    required this.texto,
    required this.cor,
    required this.aoPressionar,
  });
 
  final String texto;
  final Color cor;
  final VoidCallback aoPressionar;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: aoPressionar,
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const StadiumBorder(),
          textStyle: EstilosTexto.botao,
        ),
        child: Text(texto),
      ),
    );
  }
}