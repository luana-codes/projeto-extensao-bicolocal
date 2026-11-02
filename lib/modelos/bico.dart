import 'categoria.dart';
 
class Bico {
  const Bico({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.descricao,
    required this.cidade,
    required this.bairro,
    required this.nomeAutor,
    required this.dataPublicacao,
    this.valor,
  });
 
  final String id;
  final String titulo;
  final Categoria categoria;
  final String descricao;
  final String cidade;
  final String bairro;
  final String nomeAutor;
  final DateTime dataPublicacao;
 
  final double? valor;
 
  String get valorFormatado {
    final v = valor;
    if (v == null) return 'A combinar';
 
    final partes = v.toStringAsFixed(2).split('.');
    final inteiro = partes[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => '.',
    );
    return 'R\$ $inteiro,${partes[1]}';
  }
}