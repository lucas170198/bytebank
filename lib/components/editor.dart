import 'package:flutter/material.dart';

const double _editorPadding = 16.0;
const double _editorFontSize = 24.0;

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controlador;
  final IconData icon;

  const Editor({this.rotulo, this.dica, this.controlador, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_editorPadding),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: _editorFontSize),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
