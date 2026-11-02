import 'package:flutter/material.dart';
 
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
 
class Logotipo extends StatelessWidget {
  const Logotipo({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.home_repair_service, color: Cores.turquesa, size: 44),
        const SizedBox(width: 8),
        RichText(
          text: const TextSpan(
            style: EstilosTexto.logotipo,
            children: [
              TextSpan(text: 'Bico', style: TextStyle(color: Cores.azul)),
              TextSpan(text: 'Local', style: TextStyle(color: Cores.turquesa)),
            ],
          ),
        ),
      ],
    );
  }
}