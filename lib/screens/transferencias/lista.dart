import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencias/formuario.dart';
import 'package:flutter/material.dart';

const String _appBarText = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransaferenicasState();
  }
}

class ListaTransaferenicasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget.transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          ).then((transferencia) => _atualiza(transferencia));
        },
      ),
    );
  }
  void _atualiza(Transferencia transferencia) {
    setState(() {
      if (transferencia != null) {
        widget.transferencias.add(transferencia);
      }
    });
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
