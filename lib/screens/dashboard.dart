import 'package:bytebank/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

import 'transferencias/lista.dart';

const String _appBarText = 'Dashboard';

const String _logoBytebank = 'images/bytebank_logo.png';

const double _paddingSize = 8.00;

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(_paddingSize),
            child: Image.asset(_logoBytebank),
          ),
          DashboardBotoes(),
        ],
      ),
    );
  }
}

class DashboardBotoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FeatureBotao('Contatos', Icons.people, ListaContatos()),
        FeatureBotao('Transferêcias', Icons.attach_money, ListaTransferencias())
      ],
    );
  }
}

class FeatureBotao extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final StatelessWidget _targetWidget;

  const FeatureBotao(this._text, this._icon, this._targetWidget);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_paddingSize),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => _targetWidget),
            );
          },
          child: Container(
            padding: EdgeInsets.all(_paddingSize),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  _icon,
                  color: Theme.of(context).iconTheme.color,
                  size: 24.00,
                ),
                Text(
                  _text,
                  style: TextStyle(color: Colors.white, fontSize: 16.00),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
