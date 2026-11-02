import 'package:flutter/material.dart';

import '../componentes/barra_navegacao.dart';
import '../componentes/campo_texto.dart';
import '../componentes/cartao_bico.dart';
import '../componentes/filtro_categorias.dart';
import '../componentes/logotipo.dart';
import '../modelos/categoria.dart';
import '../servicos/servico_bicos.dart';
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
import '../tema/icones.dart';

class TelaListaBicos extends StatefulWidget {
  const TelaListaBicos({super.key});

  @override
  State<TelaListaBicos> createState() => _EstadoTelaListaBicos();
}

class _EstadoTelaListaBicos extends State<TelaListaBicos> {
  final _servico = ServicoBicos();
  final _cidade = TextEditingController(text: 'Rio do Sul, SC');

  Categoria? _categoria; // nulo = "Todos"

  @override
  void dispose() {
    _cidade.dispose();
    super.dispose();
  }

  void _mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(texto)));
  }

  void _selecionarAba(int indice) {
    if (indice != 0) {
      _mostrarMensagem('Esta tela será desenvolvida nas próximas etapas.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bicos = _servico.listar(categoria: _categoria, cidade: _cidade.text);

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _construirCabecalho(),
                Expanded(
                  child: bicos.isEmpty
                      ? _construirListaVazia()
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                          itemCount: bicos.length,
                          separatorBuilder: (contexto, indice) =>
                              const SizedBox(height: 16),
                          itemBuilder: (contexto, indice) => CartaoBico(
                            bico: bicos[indice],
                            aoTocar: () => _mostrarMensagem(
                              'Os detalhes do bico serão criados na próxima tela.',
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BarraNavegacao(
        indiceAtual: 0,
        aoSelecionar: _selecionarAba,
      ),
    );
  }

  Widget _construirCabecalho() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Logotipo(),
          const SizedBox(height: 16),
          const Text(
            'Bicos Disponíveis',
            textAlign: TextAlign.center,
            style: EstilosTexto.titulo,
          ),
          const SizedBox(height: 14),
          CampoTexto(
            controlador: _cidade,
            dica: 'Cidade',
            icone: Icones.localizacao,
            aoMudar: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          FiltroCategorias(
            selecionada: _categoria,
            aoSelecionar: (categoria) => setState(() => _categoria = categoria),
          ),
        ],
      ),
    );
  }

  Widget _construirListaVazia() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icones.semResultados, size: 48, color: Cores.textoSecundario),
          SizedBox(height: 12),
          Text(
            'Nenhum bico encontrado.\nTente outra categoria ou cidade.',
            textAlign: TextAlign.center,
            style: EstilosTexto.subtitulo,
          ),
        ],
      ),
    );
  }
}