import 'package:flutter/material.dart';
 
import '../modelos/categoria.dart';
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
 
class FiltroCategorias extends StatelessWidget {
  const FiltroCategorias({
    super.key,
    required this.selecionada,
    required this.aoSelecionar,
  });
 
  final Categoria? selecionada;
  final ValueChanged<Categoria?> aoSelecionar;
 
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _construirBotao('Todos', selecionada == null, () => aoSelecionar(null)),
        for (final categoria in Categoria.values)
          _construirBotao(
            categoria.rotulo,
            selecionada == categoria,
            () => aoSelecionar(categoria),
          ),
      ],
    );
  }
 
  Widget _construirBotao(String rotulo, bool ativo, VoidCallback aoTocar) {
    return ChoiceChip(
      label: Text(
        rotulo,
        style: ativo ? EstilosTexto.chipSelecionado : EstilosTexto.chip,
      ),
      selected: ativo,
      onSelected: (_) => aoTocar(),
      showCheckmark: false,
      selectedColor: Cores.azul,
      backgroundColor: Cores.campo,
      shape: const StadiumBorder(),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}