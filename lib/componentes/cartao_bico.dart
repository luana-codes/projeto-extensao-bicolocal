import 'package:flutter/material.dart';
 
import '../modelos/bico.dart';
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
import '../tema/icones.dart';
 
class CartaoBico extends StatelessWidget {
  const CartaoBico({super.key, required this.bico, this.aoTocar});
 
  final Bico bico;
  final VoidCallback? aoTocar;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Cores.cartao,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Cores.sombra,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: aoTocar,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bico.titulo, style: EstilosTexto.tituloBico),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _linhaInformacao(
                            Icones.daCategoria(bico.categoria),
                            bico.categoria.rotulo,
                          ),
                          const SizedBox(height: 6),
                          _linhaInformacao(Icones.localizacao, bico.cidade),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Valor', style: EstilosTexto.rotuloValor),
                        Text(
                          bico.valorFormatado,
                          style: EstilosTexto.valorBico,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  Widget _linhaInformacao(IconData icone, String texto) {
    return Row(
      children: [
        Icon(icone, size: 22, color: Colors.black87),
        const SizedBox(width: 8),
        Flexible(child: Text(texto, style: EstilosTexto.detalheBico)),
      ],
    );
  }
}