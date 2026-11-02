import 'package:flutter/material.dart';
 
import '../modelos/categoria.dart';
 
class Icones {
  Icones._();
 
  static const inicio = Icons.home;
  static const mensagens = Icons.chat_bubble;
  static const perfil = Icons.person;
  static const publicar = Icons.edit;
 
  static const localizacao = Icons.location_on_outlined;
  static const semResultados = Icons.search_off;
 
  static IconData daCategoria(Categoria categoria) {
    return switch (categoria) {
      Categoria.limpeza => Icons.cleaning_services,
      Categoria.reparos => Icons.handyman,
      Categoria.jardinagem => Icons.yard,
      Categoria.eventos => Icons.celebration,
      Categoria.atendimento => Icons.support_agent,
    };
  }
}