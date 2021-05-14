import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Instânciando dois objetos da classe TextEditingController,
//ficando mais fácil de obter os dados informados.
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _info = "Informe seus dados";

// Método para atualizar a home principal e seus dados.
  void _atualizarHome() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      _info = "Informe seus dados";
    });
  }

// Método que realiza o calculo do imc
  void _calcImc() {
    setState(() {
      double wight = double.parse(pesoController.text);
      double heigth = double.parse(alturaController.text) / 100;

      double imc = wight / (heigth * heigth);

      if (imc < 18.5) {
        _info =
            "Cuidado, seu IMC é ${imc.toStringAsPrecision(4)} e você se encontra na classificação de magreza. Você precisa ganhar peso.";
      } else if (imc > 18.5 && imc < 24.9) {
        _info =
            "Parabéns, seu IMC é ${imc.toStringAsPrecision(4)} e você se encontra na classificação normal.";
      } else if (imc > 24.9 && imc < 30.0) {
        _info =
            "Cuidado, seu IMC é ${imc.toStringAsPrecision(4)} e você se encontra na classificação de sobrepeso. Você deve emagrecer.";
      } else if (imc > 30.0 && imc < 34.9) {
        _info =
            "Urgente, seu IMC é ${imc.toStringAsPrecision(4)} e você se encontra na classificação de obesidade grau I. Procure um médico.";
      } else if (imc > 34.9 && imc < 39.9) {
        _info =
            "Urgente, seu IMC é ${imc.toStringAsPrecision(4)}} e você se encontra na classificação de obesidade grau II. Procure um médico.";
      } else if (imc > 39.9) {
        _info =
            "Urgente, seu IMC é ${imc.toStringAsPrecision(4)} e você se encontra na classificação de obesidade grau III. Procure um médico.";
      }
    });
  }

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
              onPressed: () {
                _atualizarHome();
              },
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
                        TextStyle(color: Colors.purple, fontSize: 30.0)),
                controller: pesoController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 30.0,
                    )),
                controller: alturaController,
              ),
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
                      onPressed: () {
                        _calcImc();
                      }),
                ),
              ),
              Text(
                "$_info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
