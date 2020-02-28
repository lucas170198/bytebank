import 'package:bytebank/screens/transferencias/formuario.dart';
import 'package:flutter/material.dart';

class AppLista<T> extends StatefulWidget {
  final String appBarText;
  final Item<T> itemWidget;
  final Widget formularioWidget;
  final List<T> _items = new List();

  AppLista({this.appBarText, this.itemWidget, this.formularioWidget});
  @override
  State<StatefulWidget> createState() {
    return new AppListaState<T>();
  }
}

class AppListaState<T> extends State<AppLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarText),
      ),
      body: ListView.builder(
        itemCount: widget._items.length,
        itemBuilder: (context, index) {
          final item = widget._items[index];
          return widget.itemWidget.itemCard(item);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return widget.formularioWidget;
            }),
          ).then((item) => _atualiza(item));
        },
      ),
    );
  }
  void _atualiza(T item) {
    setState(() {
      if (item != null) {
        widget._items.add(item);
      }
    });
  }
}

abstract class Item<T>{
  StatelessWidget itemCard(T entity);
}

