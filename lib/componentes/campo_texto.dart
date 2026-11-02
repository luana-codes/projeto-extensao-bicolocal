import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
import '../tema/cores.dart';
import '../tema/estilos_texto.dart';
 
class CampoTexto extends StatefulWidget {
  const CampoTexto({
    super.key,
    required this.controlador,
    required this.dica,
    required this.icone,
    this.senha = false,
    this.teclado = TextInputType.text,
    this.validador,
    this.formatadores,
    this.raio = 12,
    this.aoMudar,
  });
 
  final TextEditingController controlador;
  final String dica;
  final IconData icone;
  final bool senha;
  final TextInputType teclado;
  final String? Function(String?)? validador;
  final List<TextInputFormatter>? formatadores;
  final double raio;
  final ValueChanged<String>? aoMudar;
 
  @override
  State<CampoTexto> createState() => _EstadoCampoTexto();
}
 
class _EstadoCampoTexto extends State<CampoTexto> {
  bool _senhaOculta = true;
 
  OutlineInputBorder _borda([Color cor = Colors.transparent]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.raio),
      borderSide: BorderSide(color: cor, width: 1.5),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controlador,
      obscureText: widget.senha && _senhaOculta,
      keyboardType: widget.teclado,
      inputFormatters: widget.formatadores,
      validator: widget.validador,
      onChanged: widget.aoMudar,
      decoration: InputDecoration(
        hintText: widget.dica,
        hintStyle: EstilosTexto.dicaCampo,
        prefixIcon: Icon(widget.icone, color: Cores.textoSecundario),
        suffixIcon: widget.senha
            ? IconButton(
                tooltip: _senhaOculta ? 'Mostrar senha' : 'Ocultar senha',
                icon: Icon(
                  _senhaOculta
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Cores.textoSecundario,
                ),
                onPressed: () => setState(() => _senhaOculta = !_senhaOculta),
              )
            : null,
        filled: true,
        fillColor: Cores.campo,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: _borda(),
        enabledBorder: _borda(),
        focusedBorder: _borda(Cores.azul),
        errorBorder: _borda(Cores.erro),
        focusedErrorBorder: _borda(Cores.erro),
      ),
    );
  }
}