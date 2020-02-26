import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contatos'),
                ],
              ),
            ),
          ],
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
    );
  }
}
