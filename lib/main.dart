import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Adicionando widget Scaffold para implementar barras de navegação.
    return Scaffold(
      // adicionando barra.
      appBar: AppBar(
        title: Text('IMC Calculator'),
        centerTitle: true, // Colocando o título no centro da barra.
        backgroundColor: Colors.purple, // adicionando cor na barra.
        actions: <Widget>[
          // implementando um botão de refresh.
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
