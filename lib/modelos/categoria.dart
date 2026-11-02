enum Categoria {
  limpeza('Limpeza'),
  reparos('Reparos'),
  jardinagem('Jardinagem'),
  eventos('Eventos'),
  atendimento('Atendimento');
 
  const Categoria(this.rotulo);
 
  final String rotulo;
}