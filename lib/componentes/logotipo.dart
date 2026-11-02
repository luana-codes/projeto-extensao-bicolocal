import 'package:flutter/material.dart';
 
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
 
class Logotipo extends StatelessWidget {
  const Logotipo({super.key, this.tamanho = 30});
 
  final double tamanho;
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.home_repair_service,
          color: Cores.turquesa,
          size: tamanho * 1.45,
        ),
        SizedBox(width: tamanho * 0.25),
        RichText(
          text: TextSpan(
            style: EstilosTexto.logotipo.copyWith(fontSize: tamanho),
            children: const [
              TextSpan(text: 'Bico', style: TextStyle(color: Cores.azul)),
              TextSpan(text: 'Local', style: TextStyle(color: Cores.turquesa)),
            ],
          ),
        ),
      ],
    );
  }
}