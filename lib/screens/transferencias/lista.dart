import 'package:bytebank/components/app_lista.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formuario.dart';

const String _appBarText = 'Transferências';

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLista(
      appBarText: _appBarText,
      itemWidget: ItemTransferencia(),
      formularioWidget: FormularioTransferencia(),
    );
  }
}

class ItemTransferencia implements Item<Transferencia> {
  @override
  StatelessWidget itemCard(entity) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(entity.valor.toString()),
        subtitle: Text(entity.conta),
      ),
    );
    ;
  }
}
