import 'package:flutter/material.dart';
 
import '../tema/cores.dart';
import '../tema/icones.dart';
 
class BarraNavegacao extends StatelessWidget {
  const BarraNavegacao({
    super.key,
    required this.indiceAtual,
    required this.aoSelecionar,
  });
 
  final int indiceAtual;
  final ValueChanged<int> aoSelecionar;
 
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indiceAtual,
      onTap: aoSelecionar,
      backgroundColor: Cores.cartao,
      elevation: 12,
      iconSize: 30,
      selectedItemColor: Cores.verde,
      unselectedItemColor: Cores.textoSecundario,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icones.inicio),
          label: 'Início',
          tooltip: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icones.mensagens),
          label: 'Mensagens',
          tooltip: 'Mensagens',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icones.perfil),
          label: 'Perfil',
          tooltip: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icones.publicar),
          label: 'Publicar',
          tooltip: 'Publicar bico',
        ),
      ],
    );
  }
}