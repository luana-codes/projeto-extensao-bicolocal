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
}