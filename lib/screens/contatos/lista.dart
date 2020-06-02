import 'package:bytebank/components/app_lista.dart';
import 'package:bytebank/models/contatos.dart';
import 'package:bytebank/screens/contatos/formulario.dart';
import 'package:flutter/material.dart';

const String _appBarText = 'Contatos';

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLista(
      appBarText: _appBarText,
      itemWidget: ItemContato(),
      formularioWidget: FormularioContato(),
    );
  }
}

class ItemContato implements Item<Contato> {
  @override
  StatelessWidget itemCard(entity) {
    return Card(
      child: ListTile(
        title: Text(entity.nome),
        subtitle: Text(entity.conta),
      ),
    );
    ;
  }
}
