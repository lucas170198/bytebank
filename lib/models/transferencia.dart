class Transferencia {
  final double valor;
  final String conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return '{valor: $valor, conta: $conta}';
  }
}
