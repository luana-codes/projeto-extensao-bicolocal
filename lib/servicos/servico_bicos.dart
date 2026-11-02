import '../modelos/bico.dart';
import '../modelos/categoria.dart';
 
class ServicoBicos {
  static final List<Bico> _bicosExemplo = [
    Bico(
      id: '1',
      titulo: 'Faxina Residencial Completa',
      categoria: Categoria.limpeza,
      descricao: 'Limpeza completa de casa com 3 quartos, incluindo vidros.',
      valor: 250,
      cidade: 'Rio do Sul, SC',
      bairro: 'Centro',
      nomeAutor: 'Maria Souza',
      dataPublicacao: DateTime(2026, 11, 1),
    ),
    Bico(
      id: '2',
      titulo: 'Troca de Chuveiros',
      categoria: Categoria.reparos,
      descricao: 'Troca de dois chuveiros elétricos. Material já comprado.',
      valor: 180,
      cidade: 'Rio do Sul, SC',
      bairro: 'Budag',
      nomeAutor: 'João Pereira',
      dataPublicacao: DateTime(2026, 10, 31),
    ),
    Bico(
      id: '3',
      titulo: 'Capina de Terreno',
      categoria: Categoria.jardinagem,
      descricao: 'Capina e limpeza de terreno de 300 m².',
      valor: 120,
      cidade: 'Rio do Sul, SC',
      bairro: 'Canta Galo',
      nomeAutor: 'Carlos Lima',
      dataPublicacao: DateTime(2026, 10, 30),
    ),
    Bico(
      id: '4',
      titulo: 'Montagem de Mesas para Festa',
      categoria: Categoria.eventos,
      descricao: 'Ajuda para montar e desmontar mesas em salão de festas.',
      valor: 200,
      cidade: 'Rio do Sul, SC',
      bairro: 'Sumaré',
      nomeAutor: 'Ana Ribeiro',
      dataPublicacao: DateTime(2026, 10, 29),
    ),
    Bico(
      id: '5',
      titulo: 'Atendente para Loja',
      categoria: Categoria.atendimento,
      descricao: 'Atendimento ao público aos sábados, das 8h às 14h.',
      valor: 90,
      cidade: 'Aurora, SC',
      bairro: 'Centro',
      nomeAutor: 'Paulo Mendes',
      dataPublicacao: DateTime(2026, 10, 28),
    ),
    Bico(
      id: '6',
      titulo: 'Pintura de Muro',
      categoria: Categoria.reparos,
      descricao: 'Pintura de muro de 20 metros. Tinta por conta do contratante.',
      cidade: 'Rio do Sul, SC',
      bairro: 'Jardim América',
      nomeAutor: 'Fernanda Alves',
      dataPublicacao: DateTime(2026, 10, 27),
    ),
  ];
 
  List<Bico> listar({Categoria? categoria, String cidade = ''}) {
    final busca = cidade.trim().toLowerCase();
 
    final resultado = _bicosExemplo.where((bico) {
      final mesmaCategoria = categoria == null || bico.categoria == categoria;
      final mesmaCidade =
          busca.isEmpty || bico.cidade.toLowerCase().contains(busca);
      return mesmaCategoria && mesmaCidade;
    }).toList();
 
    resultado.sort((a, b) => b.dataPublicacao.compareTo(a.dataPublicacao));
    return resultado;
  }
}