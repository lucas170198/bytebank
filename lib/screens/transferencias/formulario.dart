import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String _appBarText = 'Criando Transferência';

const String _campoNumeroRotulo = 'Número da conta';
const String _campoNumeroDica = '0001';

const String _campoValorRotulo = 'Valor';
const String _campoValorDica = '100.00';

const String _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_appBarText)),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(
                  rotulo: _campoNumeroRotulo,
                  dica: _campoNumeroDica,
                  controlador: _controladorCampoNumero,
                ),
                Editor(
                  rotulo: _campoValorRotulo,
                  dica: _campoValorDica,
                  controlador: _controladorCampoValor,
                  icon: Icons.monetization_on,
                ),
                RaisedButton(
                  child: Text(_textoBotaoConfirmar),
                  onPressed: () => _criaTransferencia(context),
                ),
              ],
            )));
  }

  void _criaTransferencia(context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final String numeroConta = _controladorCampoNumero.text;
    if (valor != null && numeroConta != null) {
      final _transferecia = Transferencia(valor, numeroConta);
      Navigator.pop(context, _transferecia);
    }
  }
}
