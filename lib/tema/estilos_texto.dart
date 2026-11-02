import 'package:flutter/material.dart';
 
import 'cores.dart';
 
class EstilosTexto {
  EstilosTexto._();
 
  static const titulo = TextStyle(fontSize: 24, fontWeight: FontWeight.w800);
 
  static const subtitulo = TextStyle(
    fontSize: 14,
    color: Cores.textoSecundario,
  );
 
  static const tituloCartao = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
 
  static const link = TextStyle(fontSize: 13, color: Cores.azul);
 
  static const nota = TextStyle(fontSize: 11, color: Cores.textoSecundario);
 
  static const botao = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
 
  static const logotipo = TextStyle(fontSize: 30, fontWeight: FontWeight.w800);
 
  static const dicaCampo = TextStyle(color: Cores.textoSecundario);

  static const tituloTela = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static const tituloBico = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w800,
  );

  static const detalheBico = TextStyle(fontSize: 13);

  static const rotuloValor = TextStyle(
    fontSize: 12,
    color: Cores.textoSecundario,
  );

  static const valorBico = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Cores.azul,
  );

  static const chip = TextStyle(fontSize: 12);

  static const chipSelecionado = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
