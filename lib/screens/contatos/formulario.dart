import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contatos.dart';
import 'package:flutter/material.dart';

const String _appBarText = 'Criando Contato';

const String _campoNomeRotulo = 'Nome';

const String _campoNumeroRotulo = 'Numero';
const String _campoNumeroDica = '0001';

const String _textoBotaoConfirmar = 'Confirmar';

class FormularioContato extends StatefulWidget {
  @override
  _FormulatioContatoState createState() => _FormulatioContatoState();
}

class _FormulatioContatoState extends State<FormularioContato> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNumero = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarText)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              rotulo: _campoNomeRotulo,
              controlador: _controladorCampoNome,
            ),
            Editor(
              rotulo: _campoNumeroRotulo,
              dica: _campoNumeroDica,
              controlador: _controladorCampoNumero,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaContato(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaContato(context){
    final String nome = _controladorCampoNome.text;
    final String conta = _controladorCampoNumero.text;

    if(conta != null && nome != null){
      final _contato = Contato(nome, conta);
      Navigator.pop(context, _contato);
    }
  }
}
