import 'package:flutter/material.dart';
 
import 'cores.dart';
 
class TemaApp {
  TemaApp._();
 
  static ThemeData get claro => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Cores.azul),
        scaffoldBackgroundColor: Cores.fundo,
      );
}