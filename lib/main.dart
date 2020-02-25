import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaTransferencias());
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criando Transferência')),
        body: Column(
          children: <Widget>[
            Editor(
              rotulo: 'Número da conta',
              dica: '0001',
              controlador: _controladorCampoNumero,
            ),
            Editor(
              rotulo: "Valor",
              dica: "100.00",
              controlador: _controladorCampoValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ));
  }

  void _criaTransferencia(context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final String numeroConta = _controladorCampoNumero.text;
    if (valor != null && numeroConta != null) {
      final _transferecia = Transferencia(valor, numeroConta);
      debugPrint('Criando transferencia: $_transferecia');
      Navigator.pop(context, _transferecia);
    }
  }
}

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controlador;
  final IconData icon;

  const Editor({this.rotulo, this.dica, this.controlador, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();
  @override
  State<StatefulWidget> createState() {
    return ListaTransaferenicasState();
  }
}

class ListaTransaferenicasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index){
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferencia){
            debugPrint('Chegou transferencia $transferencia');
            widget._transferencias.add(transferencia);
          });
        },
      ),
    );
  }

}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return '{valor: $valor, conta: $conta}';
  }
}
