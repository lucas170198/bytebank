import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contatos.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Adicionar contato')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              rotulo: 'Nome',
              controlador: _controladorCampoNome,
            ),
            Editor(
              rotulo: 'Numero da conta',
              controlador: _controladorCampoNumero,
            ),
            RaisedButton(
              child: Text('Confirmar'),
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
