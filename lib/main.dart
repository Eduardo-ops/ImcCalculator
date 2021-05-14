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
        backgroundColor: Colors.white, // Adionando cor do fundo geral do app.
        // padronizando o body como coluna, ou seja, nossa estrutura será um coluna vertical.
        // Corrgindo a falha que ao abrir o teclado, faz aparecer um alerta com listas coloridas.
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Posicionando no centro o eixo cruzado.
            children: <Widget>[
              // Adicionado um widge do tipo Icon.
              Icon(
                Icons.account_box_rounded,
                size: 120,
                color: Colors.purple,
              ),
              // adicionado um widget do tipo textField, um campo de digitação que recebe valor númerico.
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle:
                          TextStyle(color: Colors.purple, fontSize: 30.0))),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(
                        color: Colors.purple,
                        fontSize: 30.0,
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    color: Colors.purple,
                    onPressed: () {},
                  ),
                ),
              ),
              Text(
                "Informações do usuário",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
